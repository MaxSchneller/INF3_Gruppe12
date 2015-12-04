'''
Created on 27.11.2015

@author: Max
'''
import threading
import os

mailList1 = []
mailList2 = []
mergeList = []
counter =0

#Method to open the mailList1.txt and save every line in mergeList
def ReadMail1():
    global mailList1, mailList2, mergeList
    try:
        with open("mails1.txt", "r") as file:
            mailList1 = file.read().splitlines()
            mergeList = mailList1 + mailList2
            print("Mails1.txt is loaded!"+ "\n")
    except:
        print("Can't load mails1.txt")
        os._exit(1)

#Method to open the mailList2.txt and save every line in mergeList        
def ReadMail2():
    global mailList1, mailList2, mergeList
    try:
        with open("mails2.txt", "r") as file:
            mailList2 = file.read().splitlines()
            mergeList = mailList1 + mailList2
            print("Mails2.txt is loaded!" + "\n")
    except:
        print("Can't load mails2.txt")
        os._exit(1)

#waits for th1 and th2 then counting subtrings ends with ".edu"
def FindMails():
    global counter
    substring = ".edu"
    th1.join()
    th2.join()
    
    for elem in mergeList:
            if elem.endswith(substring):
                counter=counter +1 
    print("Number of '.edu' : " , counter)

th1=threading.Thread(target=ReadMail1)
th2=threading.Thread(target=ReadMail2)
th3=threading.Thread(target=FindMails)

th1.start()
th2.start()
th3.start()

