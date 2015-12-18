using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EBNF
{
    public class ebnfParser
    {
        public static bool convert(List<string> list)
        {
            bool result = false;

            for (int i = 0; i < list.Count; i++)
            {
                string line = list[i];
                result = expression(line);
            }
            return result;
        }

        public static bool expression(string line)
        {
            bool result = false;

            foreach(char c in line)
            {
                if(term(line))
                {
                    if(c.Equals('+'))
                    {
                        line = line.Substring(line.IndexOf("+") + 1);
                        if (expression(line))
                        {
                            result = true;
                        }
                    }
                    if (c.Equals('-'))
                    {
                        line = line.Substring(line.IndexOf("-") + 1);
                        if (expression(line))
                        {
                            result = true;
                        }
                    }
                }
            }
            return result;
        }

        public static bool term(string line)
        {
            bool result = false;

            foreach (char c in line)
            {
                if (term(line))
                {
                    if (c.Equals('+'))
                    {
                        line = line.Substring(line.IndexOf("+") + 1);
                        if (expression(line))
                        {
                            result = true;
                        }
                    }
                    if (c.Equals('-'))
                    {
                        line = line.Substring(line.IndexOf("-") + 1);
                        if (expression(line))
                        {
                            result = true;
                        }
                    }
                }
            }
            return result;
        }

        public static bool factor(string line)
        {
            if(line.StartsWith("(") && line.EndsWith(")"))
            {
                string ex = line;
                ex = ex.Substring(1, ex.Length - 2);
                expression(ex);
            }
            else if(constant(line))
            {
                return true;
            }
            else if (variable(line))
            {
                return true;
            }
            return false;
        }

        public static bool constant(string line)
        {
            if (digit(line))
            {
                return true;
            }
            return false;
        }

        public static bool variable(string line)
        {
            foreach(char c in line)
            { 
                if(c.Equals('x') || c.Equals('y') || c.Equals('z'))
                {
                    return true;
                }
            }
            return false;
        }

        public static bool digit(string line)
        {
            foreach(char c in line)
            {
                if(c.Equals('0')||c.Equals('1')||c.Equals('2')||c.Equals('3') || c.Equals('4') || c.Equals('5') || c.Equals('6') || c.Equals('7') || c.Equals('8') || c.Equals('9'))
                {
                    return true;
                }
            }
            return false;
        }
    }
}
