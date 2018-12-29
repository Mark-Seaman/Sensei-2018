#!/usr/bin/env python

from csv import reader


def student_emails():
    path = '/Users/seaman/UNC/bacs200/Grades-12-28.csv'
    emails = {}
    with open(path) as f:
        for i,row in enumerate(reader(f)):
            if i > 1:
                emails[row[0]] = row[3]
    return emails


# def student_info(email):
#     path = 'domains.csv'
#     with open(path) as f:
#         for row in reader(f):
#             if row[1:]:
#                 print('%s,%s,%s' % (row[0], email[row[0]], row[1]))
#
#
# # email = student_emails()
# # student_info(email)
#
#
# def list_student_info():
#     path = 'students.csv'
#     with open(path) as f:
#         for row in reader(f):
#             if row[2:]:
#                 print('%-30s %-20s %s' % (row[0], row[1], row[2]))


emails = student_emails()
with open('students.csv', 'w') as f:
    for e in emails:
        print ("%-30s %s" % (e, emails[e]))
        f.write("%s,%s\n" % (e, emails[e]))

print("%s Students" % len(emails))

