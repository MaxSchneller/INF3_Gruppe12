#Imports
from threading import Thread, Condition
from random import randint
import sys
import threading
 
#Arguments
max_num = int(sys.argv[1])
producerNum = int(sys.argv[2])
consumerNum = int(sys.argv[3])

bufferList = []
cond = Condition()

#Producer starts a thread which puts a number between 1 and 100
class ProducerThread(Thread):
    def run(self):
        global bufferList
        while True:
            num = randint(1,100)
            Buffer.push(self,num)
         
#Consumer starts a thread which pulls an element from bufferlist           
class ConsumerThread(Thread): 
    def run(self):
        global bufferList
        while True:
            Buffer.pop(self)

#Bufferclass initial a typsave buffer with methods           
class Buffer(object):
    
    #aquires other threads and append the random Number to the buffer
    #then nofitys all threads and release
    def push(self, num):
        global cond
        if not Buffer.isFull(self, max_num):
            cond.acquire()
            bufferList.append(num)
            print("Produced", num)
            cond.notify_all()
            cond.release()
    
    #aquires other threads and look if the buffer is empty
    #if empty consumer is waiting for producer to append something to buffer
    #pop first number of buffer
    def pop(self):  
        global cond
        cond.acquire()
        while Buffer.isEmpty(self):
            print("Buffer is empty, consumer is waiting")
            cond.wait()
            print("Something added to Buffer, Consumer is notified")
        numb = bufferList.pop(0)
        print("Consumed", numb)
        cond.release()
    
    #checks if buffer is empty
    def isEmpty(self):
        if not bufferList:
            return True
        return False
    
    #checks if buffer is full
    def isFull(self, max_num):
        if len(bufferList) == max_num:
            return True
        return False
    
    

for i in range(consumerNum):
    ConsumerThread().start()

for i in range(producerNum):
    ProducerThread().start()

print (threading.activeCount())
