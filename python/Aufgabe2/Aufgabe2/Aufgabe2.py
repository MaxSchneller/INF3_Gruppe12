import threading, time
 

mailList1 = []
mailList2 = []
mergeList = []
counter =0

def Thread1():

    global mailList1, mailList2, mergeList

    with open("mails1.txt", "r") as file:
             mailList1 = file.read().splitlines()
             mergeList = mailList1 + mailList2
             print("Mails1.txt is loaded!"+ "\n")
 
def Thread2():
    global mailList1, mailList2, mergeList
   
    with open("mails2.txt", "r") as file:
             mailList2 = file.read().splitlines()
             mergeList = mailList1 + mailList2
             print("Mails2.txt is loaded!" + "\n")
    

def Thread3():
    global counter
    substring = ".edu"
    th1.join()
    th2.join()
    

    for elem in mergeList:
            if substring in elem:
                counter=counter +1 
    print("Number of '.edu' : " , counter)

th1=threading.Thread(target=Thread1)
th2=threading.Thread(target=Thread2)
th3=threading.Thread(target=Thread3)


th1.start()

th2.start()

th3.start()

