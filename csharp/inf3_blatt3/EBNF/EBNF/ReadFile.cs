using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace EBNF_Parser
{
    public class ReadFile
    {
        static void Main(string[] args)
        {
            string line;
            List<string> list = new List<string>();

            System.IO.StreamReader file = new System.IO.StreamReader(@"C:\Users\Max\Documents\Projects\EBNF-Parser\expressions.txt");
            while ((line = file.ReadLine()) != null)
            {
                list.Add(line);
            }

            const int parsCount = 20;

            ManualResetEvent[] doneEvents = new ManualResetEvent[parsCount];
            EbnfParser[] parArray = new EbnfParser[parsCount];

            Console.WriteLine("launching {0} tasks...",parsCount);
           
            for (int i = 0; i < list.Count; i++)
            {
                doneEvents[i] = new ManualResetEvent(false);
                EbnfParser par = new EbnfParser(list[i], doneEvents[i]);
                parArray[i] = par;
                ThreadPool.QueueUserWorkItem(par.ThreadPoolCallback, i);
            }

            WaitHandle.WaitAll(doneEvents);
            Console.WriteLine("All Events are complete.");

            Console.Read();
            file.Close();
            System.Console.ReadLine();
        }
    }
}


