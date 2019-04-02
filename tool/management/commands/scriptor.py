from django.core.management.base import BaseCommand
import traceback

from bin.app import app_command
from bin.shell import banner
from health.health import health_command
from tasks.task import task_command
from tool.email import email_command
from tool.robot import robot_command
from tool.log import log_exception, log
from tool.page import page_command
from tool.tst import tst_command
from tool.user import user_command


class Command(BaseCommand):
    help = 'Runs scripts in the Django context'

    def add_arguments(self, parser):
        parser.add_argument('script', nargs='+', type=str)

    def handle(self, *args, **options):
        try:
            cmd = options['script'][0]
            args = options['script'][1:]
            log('SCRIPTOR: %s %s' % (cmd, args))

            if cmd == 'app':
                app_command(args)

            elif cmd == 'email':
                email_command(args)

            elif cmd == 'help':
                self.help()

            elif cmd == 'health':
                health_command(args)

            elif cmd == 'page':
                page_command(self, args)

            elif cmd == 'robot':
                robot_command(args)

            elif cmd == 'task':
                task_command(self, args)

            elif cmd == 'tst':
                tst_command(self, args)

            elif cmd == 'user':
                user_command(self, args)

            else:
                self.stdout.write('**Scriptor Error**: unknown command %s' % options['script'])
                self.help()
        except:
            log_exception()
            self.stdout.write(banner('**Scriptor Exception**'))
            self.stdout.write('Scriptor Exception (%s %s)' % (cmd,args))
            self.stdout.write(traceback.format_exc())

    def help(self):
        self.stdout.write('''

            usage: x command 
            
            command:
                email       - send integrated email
                health      - track health metrics
                help        - show scriptor commands
                node        - build tree structure for doc nodes
                page        - track page content for testing
                robot       - get pages from web servers
                task        - work with tasks for user
                tst         - perform diff testing
                user        - login IDs for apps
        ''')

