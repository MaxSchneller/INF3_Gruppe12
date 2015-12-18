using System;
using System.Threading;

namespace EBNF_Parser
{
    public class EbnfParser
    {
        ManualResetEvent _doneEvent;

        private string arithmeticExpression;

        public EbnfParser(string arithmeticExpression, ManualResetEvent doneEvent)
        {
            _doneEvent = doneEvent;
            this.arithmeticExpression = arithmeticExpression;
        }

        public void ThreadPoolCallback(object threadContext)
        {
            int threadIndex = (int)threadContext;
            Console.WriteLine("thread {0} started...", threadIndex);
            Console.WriteLine(arithmeticExpression + " : " + expression());
            Console.WriteLine("thread {0} result calcualted...", threadIndex);
            _doneEvent.Set();
                
        }

        public string getArithmeticExpression { get { return arithmeticExpression; } }

        public bool expression()
        {
            bool isExpression = false;
            if (arithmeticExpression.Length > 0)
            {
                string isNextExpression = arithmeticExpression.Substring(0, 1);
                if (term(isNextExpression))
                {
                    isExpression = true;
                    for (int i = 0; i <= arithmeticExpression.Length; i++)
                    {
                        if (arithmeticExpression.Length > 0)
                        {
                            isNextExpression = arithmeticExpression.Substring(0, 1);
                            if (isNextExpression.Equals("+") || isNextExpression.Equals("-"))
                            {
                                arithmeticExpression = arithmeticExpression.Substring(1);
                                if (arithmeticExpression.Length > 0)
                                {
                                    isNextExpression = arithmeticExpression.Substring(0, 1);

                                    if (term(isNextExpression) == false)
                                    {
                                        isExpression = false;
                                    }
                                }
                                else
                                {
                                    isExpression = false;
                                }
                            }

                        }
                    }
                }
            }
            return isExpression;
        }

        public bool term(string isNextTerm)
        {
            bool isTerm = false;
            if (factor(isNextTerm))
            {
                isTerm = true;
                for (int i = 0; i <= arithmeticExpression.Length; i++)
                {
                    if (arithmeticExpression.Length > 0)
                    {
                        isNextTerm = arithmeticExpression.Substring(0, 1);
                        if (isNextTerm.Equals("*") || isNextTerm.Equals("/"))
                        {
                            arithmeticExpression = arithmeticExpression.Substring(1);
                            if (arithmeticExpression.Length > 0)
                            {
                                isNextTerm = arithmeticExpression.Substring(0, 1);
                                if (factor(isNextTerm) == false)
                                {
                                    isTerm = false;
                                }
                            }
                            else
                            {
                                isTerm = false;
                            }
                        }
                    }
                }
            }
            return isTerm;
        }

        public bool factor(string isNextFactor)
        {
            bool isFactor = false;
            if (arithmeticExpression.Length > 0)
            {
                if (constant(isNextFactor))
                {
                    isFactor = true;
                }

                if (variable(isNextFactor))
                {
                    isFactor = true;
                }

                if (isNextFactor.Equals("(") || isNextFactor.Equals(")"))
                {
                    for (int i = 0; i <= arithmeticExpression.Length; i++)
                    {
                        if (isNextFactor.Equals("("))
                        {
                            arithmeticExpression = arithmeticExpression.Substring(1);
                            isNextFactor = arithmeticExpression.Substring(0, 1);
                            if (!(isNextFactor.Equals(")")))
                            {
                                if (expression())
                                {
                                    isNextFactor = arithmeticExpression.Substring(0, 1);
                                    if (isNextFactor.Equals(")"))
                                    {
                                        arithmeticExpression = arithmeticExpression.Substring(1);
                                        isFactor = true;
                                    }
                                }
                            }
                            else
                            {
                                isFactor = false;
                            }
                        }
                    }

                }
            }
            return isFactor;
        }

        public bool variable(string isNextVariable)
        {
            bool isVariable = false;
            if (isNextVariable.Equals("x") || isNextVariable.Equals("y") || isNextVariable.Equals("z"))
            {
                isVariable = true;
                arithmeticExpression = arithmeticExpression.Substring(1);
            }
            return isVariable;
        }

        public bool constant(string isNextConstant)
        {
            bool isConstant = false;
            if (digit(isNextConstant))
            {
                isConstant = true;
                arithmeticExpression = arithmeticExpression.Substring(1);
                for (int i = 0; i <= arithmeticExpression.Length; i++)
                {
                    if (arithmeticExpression.Length > 0)
                    {
                        isNextConstant = arithmeticExpression.Substring(0, 1);
                        if (digit(isNextConstant))
                        {
                            arithmeticExpression = arithmeticExpression.Substring(1);
                        }
                    }
                }
            }
            return isConstant;
        }

        public bool digit(string isThisDigit)
        {
            return (isThisDigit.Equals("0") || isThisDigit.Equals("1") || isThisDigit.Equals("2") || isThisDigit.Equals("3") ||
                isThisDigit.Equals("4") || isThisDigit.Equals("5") || isThisDigit.Equals("6") || isThisDigit.Equals("7") ||
                isThisDigit.Equals("8") || isThisDigit.Equals("9"));
        }

    }
}