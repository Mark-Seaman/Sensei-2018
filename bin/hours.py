# from datetime import datetime, timedelta
# from os import  system
# from os.path import join
# from re import search
#
# from shell import  read_file, write_file
# from switches import TODO_FILES, TODO_DIR
#
#
# # ------------------------------
# # Command Interpreter
#
# def hours_command(options):
#     #print('hours command %s' % options)
#     if options:
#         cmd = options[0]
#         args = options[1:]
#
#         if cmd=='activity':
#             hours_activity(args)
#
#         elif cmd=='add':
#             hours_add(args)
#
#         elif cmd=='days':
#             hours_days(args)
#
#         elif cmd=='edit':
#             hours_edit(args)
#
#         elif cmd=='list':
#             hours_list(args)
#
#         elif cmd=='show':
#             hours_show(args)
#
#         elif cmd=='summary':
#             hours_summary(args)
#
#         elif cmd=='tasks':
#             hours_tasks(args)
#
#         elif cmd=='work':
#             hours_work(args)
#
#         else:
#             hours_help(args)
#     else:
#         hours_help()
#
#
# def hours_help(args=None):
#     print('''
#         hours Command
#
#         usage: x hours COMMAND
#
#         COMMAND:
#
#             activity    - show a summary of activity for this month
#             add         - add a new file for a new month
#             days        - show the time invested each day
#             edit        - edit the current log of hours
#             list        - list each activity
#             show        - show the doc content
#             summary     - show all months
#             tasks       - list all the tasks
#             work        - show the work by categories
#
#         ''')
#
#
# # ------------------------------
# # Functions
#
# def activities_work():
#     return ['WAM', 'Sign', 'Teach', 'Business', 'Tools', 'Hammer', 'Hire', 'Write', 'Aspire']
#
#
# def activities_work_client():
#     return ['WAM', 'Sign']
#
#
# def activities_work_nonpaid():
#     return ['Business', 'Tools', 'Hammer', 'Hire', 'Write', 'Aspire']
#
#
# def activities_play():
#     return ['Grow', 'People', 'Church', 'Fun']
#
#
# def activities_public():
#     return ['People', 'Church']
#
#
# def activities_private():
#     return ['Grow', 'Fun']
#
#
# def activities():
#     return activities_work() + activities_play()
#
#
# def hours_activity(args):
#     times = {}
#     if not args:
#         args = ['2017-04', '2017-03']
#     for arg in args:
#         times = total_activity(hours_doc_path(arg), times)
#     print_activities(', '.join(args), times)
#
#
# def hours_add(args):
#
#     def enumerate_days(today, days):
#         return [ days_ago(today, days-d-1) for d in range(days) ]
#
#     def to_date(s):
#          return datetime.strptime(s, "%Y-%m-%d") #"%Y-%m-%d"
#
#     def date_str(t):
#         return t.strftime("%Y-%m-%d")  #  "%Y-%m-%d"
#
#     def day_str(t):
#         return t.strftime("%a, %m-%d")
#
#     def days_ago(date,days):
#         return  date_str(date-timedelta(days=days))
#
#     def month_of_days(start):
#         text = [day_str(to_date(d)) for d in enumerate_days(start, 31)]
#         return '\n'.join(text)
#
#     if args:
#         filename = '%s'%args[0]
#         path = join(TODO_DIR, filename)
#         print('File for Month', path)
#         start = datetime.today()+timedelta(days=31-datetime.today().day)
#         write_file(path, month_of_days(start))
#         hours_edit([filename])
#     else:
#         print('usage: hours add 2017-01')
#
#
# def hours_days(args):
#     times = total_days(hours_doc_path(args))
#     if args[1:]:
#         num_days = int(args[1])
#     else:
#         num_days = 31
#     print_days(times, num_days)
#
#
# def hours_doc_path(args):
#     if args:
#         if type(args)==type([]):
#             return join(TODO_DIR, args[0])
#         else:
#             return join(TODO_DIR, args)
#     else:
#         return TODO_FILES[0]
#
#
# def hours_edit(args):
#     system('e '+hours_doc_path(args))
#
#
# def hours_list(args):
#     #print('list')
#     events = list_events(args)
#     for e in events:
#         print(' '.join(e[1:]))
#
#
# def hours_tasks(args):
#     lines = read_file(hours_doc_path(args[:1])).split('\n')
#     events = list_events(args)
#     results = append_tasks(events, lines)
#     if args[1:]:
#         #print(args[1:])
#         print_tasks(results, args[1])
#     else:
#         #print(args)
#         print_tasks(results)
#
#
# def append_tasks(events, lines):
#
#     def task_text(lines, start, end):
#         lines = [x for x in lines[start+1:end]]
#         return '\n' + '\n'.join(lines)
#
#     start = 0
#     results = []
#     last_e = []
#     for e in events:
#         end = int(e[0])
#         task = task_text(lines, start, end)
#         if len(task)>5:
#             results.append(last_e + [task])
#         start = int(e[0])
#         last_e = e[1:]
#     return results
#
#
# def hours_show(args):
#     if args:
#         text = read_file(join(TODO_DIR,args[0]))
#     else:
#         text = read_file(TODO_FILES[3])
#     print(text)
#
#
# def hours_summary(args):
#     if not args:
#         args = months()
#     times = {}
#     print('\n\nTime:  %s\n' % ', '.join(args))
#     for month in args:
#         times = total_activity(hours_doc_path(month), times)
#     print_score(times)
#
#
# def hours_work(args):
#     times = total_work_days(hours_doc_path(args))
#     if args[1:]:
#         num_days = int(args[1])
#     else:
#         num_days = 31
#     print_work(times, num_days)
#
#
# def is_day(line):
#     return search(r'^([A-Za-z]+, \d\d-\d\d)\s*$', line)
#
#
# def is_activity(line):
#     match = search(r'^    ([A-Za-z]+) +(\d+)\s*$', line)
#     if match:
#         return match.groups()
#
#
# def is_task(line):
#     return search(r'^{8}(.*)\s*$', line)
#
#
# def list_events(args):
#     text = read_file(hours_doc_path(args))
#     return list_tasks(text)
#
#
# def list_tasks(text):
#     events = []
#     day = None
#     date_pattern = r'^([A-Za-z]+, \d\d-\d\d) *$'
#     activity_pattern = r'^    ([A-Za-z]+)( +(\d+))* *$'
#     for i,line in enumerate(text.split('\n')):
#         x = search(date_pattern, line)
#         if x:
#             day = line.strip()
#             events.append([str(i), day])
#         else:
#             spent = search(activity_pattern, line)
#             if spent:
#                 activity, z, time = search(activity_pattern, line).groups()
#                 if time:
#                     events.append([str(i), day, activity, time])
#                 else:
#                     events.append([str(i), day, activity, '0'])
#     return events
#
#
# def months():
#     return ['2016-%02d' % (m+8) for m in range(4)]+['2017-01']
#
#
# def print_activities(label, times):
#     total = 0
#     for n in times:
#         total += times[n]
#     print('Activity for '+label)
#     print('\n%-22s  %5s %5d%%' % ('Total', total, 100))
#     print_totals('Work:', times, activities_work(), total)
#     print_totals('Leisure:', times, activities_play(), total)
#
#
# def print_days(times, num_days):
#     table = []
#     for d in times:
#         day = times[d]
#         day_list = [str(day.get(a, '0')) for a in ['work'] + activities_play()]
#         total = 0
#         for x in day_list:
#             total += int(x)
#         day_list.append(str(total))
#         table.append(d+"," + ",".join(day_list))
#     print('\n'.join(sorted(table)[-num_days:]))
#
#
# def print_score(times):
#
#     def show_score(label, activities, ideal_hours):
#         hours = total_time(times, activities)
#         percent = hours*100/grand_total
#         diff = percent-ideal_hours
#         if diff<0:
#             difference = '-' * -diff
#         else:
#             difference = '+' * diff
#         print('%-20s %8d %8d%% %8d%%   %s' % (label, hours, percent, ideal_hours, difference))
#
#     grand_total = total_time(times)
#     print('%-20s %8s  %8s  %8s   %s\n' % ('Activity', 'Hours', 'Percent', 'Ideal', 'Diff'))
#     show_score('Work',  activities_work(), 40)
#     show_score('Grow',     ['Grow'],    10)
#     show_score('Church',   ['Church'],  10)
#     show_score('People',   ['People'],  20)
#     show_score('Fun',      ['Fun'],     20)
#     print('\nTotal                     %d\n' % grand_total)
#
#
# def print_table(labels, table):
#     print(' '.join( ['Date      '] + [ ('%-8s' % a) for a in labels] ))
#     table = [total_columns(table)] + table
#     for i,row in  enumerate(table):
#         line =  ' '.join( [ ('%8d' % a) for a in row[1:]] )
#         print(row[0] + line.replace(' 0 ', '   '))
#         if i==0:
#             print(' ')
#
#
# def print_tasks(results, activity=None):
#     for r in results:
#         if len(r)>3:
#             if not activity or r[1]==activity:
#                 task = r[3] + '\n'
#                 print("%s\n\n    %s %s \n    {%s    }\n" % (r[0], r[1], r[2], task))
#     print_total_hours(results, activity)
#
#
# def print_total_hours(results, activity=None):
#
#     def select_activity(record, activity):
#         return len(record)>2 and (not activity or record[1]==activity)
#
#     hours = [int(r[2]) for r in results if select_activity(r, activity)]
#     print('Total hours = %s' % sum(hours))
#
#
# def print_total(label, times, activities=None, grand_total=None):
#     total = total_time(times, activities)
#     if not grand_total:
#         grand_total = total
#     if total:
#         print('%-20s  %7s %5d%%' % (label, total, total*100/grand_total))
#
#
# def print_totals(label, times, activities=None, grand_total=None):
#     total = total_time(times, activities)
#     if not grand_total:
#         grand_total = total
#     if grand_total:
#         print('\n%-20s  %7s %5d%%\n' % (label, total, total*100/grand_total))
#     for n in activities:
#         time = times.get(n,0)
#         percent = time*100/grand_total
#         print('    %-20s %4s %5d%%    %s' % (n, time, percent, '*'*percent))
#
#
# def print_work(times, num_days):
#     header = activities_work()
#     table = []
#     dates = sorted([d for d in times.keys()])
#     for d in dates:
#         day = times[d]
#         day_list = [int(day.get(a, '0')) for a in header]
#         table.append([d] + day_list + [reduce(lambda x,y:x+y , day_list)])
#     print_table(header, table)
#
#
# def total_activity(filename, times={}):
#     text = read_file(filename)
#     date_pattern = r'^([A-Za-z]+, \d\d-\d\d) *$'
#     activity_pattern = r'^    ([A-Za-z]+) +(\d+)$'
#     for line in text.split('\n'):
#         x = search(date_pattern, line)
#         if x:
#             day = line.strip()
#         spent = search(activity_pattern, line)
#         if spent:
#             activity, time = search(activity_pattern, line).groups()
#             n = times.get(activity,0) + int(time)
#             times[activity] = n
#     return times
#
#
# def total_columns(table):
#     totals = [0 for x in range(len(table[0]))]
#     for row in table:
#         for i,column in enumerate(row[1:]):
#             totals[i] += column
#     return ['Total'] + totals
#
#
# def activity_list(filename):
#     times = []
#     text = read_file(filename)
#     date_pattern = r'^([A-Za-z]+, \d\d-\d\d) *$'
#     activity_pattern = r'^    ([A-Za-z]+) +(\d+)$'
#     for line in text.split('\n'):
#         x = search(date_pattern, line)
#         if x:
#             day = line.strip()[5:]
#         activity = is_activity(line)
#         if activity:
#             times.append([day, activity[0], activity[1]])
#     return times
#
#
# def total_work_days(filename):
#     times = {}
#     for a in activity_list(filename):
#         day = a[0]
#         name = a[1]
#         hours = a[2]
#         times.setdefault(day, {})[name] = int(hours)
#     return times
#
#
# def total_days(filename):
#     times = {}
#     for a in activity_list(filename):
#         day = a[0]
#         name = a[1]
#         hours = a[2]
#         if name in activities_work():
#             d = times.get(day, {})
#             old_hours = d.get('work', 0)
#             times.setdefault(day, {})['work'] = (old_hours + int(hours))
#         else:
#             times.setdefault(day, {})[name] = int(hours)
#     return times
#
#
# def total_time(times, activities=None):
#     if not activities:
#         activities = times.keys()
#     total = 0
#     for n in activities:
#         total += times.get(n,0)
#     return total
