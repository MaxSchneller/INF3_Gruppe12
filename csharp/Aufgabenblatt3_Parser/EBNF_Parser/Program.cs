using System;

namespace EBNF_Parser
{
    class Program
    {
        static void Main(string[] args)
        {
            Program pro = new Program("((3+(7*(9+((6/2)*3)+6-(3+56)+6)-2)*9)*600)");
            Console.ReadKey();

        }

        //   <ebnf> "Arithmetic Expression" {
        //       expression = term {("+" | "-") term}.
        //       term = factor {( "*" | "/" ) factor}.
        //       factor = constant | variable | "(" expression ")" .
        //       variable = "x" | "y" | "z" .
        //       constant = digit {digit} .
        //       digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" .
        //   }</ebnf>

        //String is the arithmetic Expression, we work with.
        private string arithmeticExpression;

        //Constructor
        public Program(string getArithmeticExpression)
        {
            this.arithmeticExpression = getArithmeticExpression;
            Console.WriteLine(expression());
        }

        //Method 1: expression. Is expression TRUE or FALSE?
        //Is first a term? proof if after term is "+" or "-" then delet
        //then proof if element after is term,too
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


        //Method 2: term. Is term TRUE or FALSE?
        //Called from expression
        //Is first a factor? proof if after term is "*" or "/" then delet
        //then proof if element after is factor,too
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

        //Method 3: factor. Is factor TRUE or FALSE?
        //Called from term
        //Is first a constant, variable or "(" then proof if next expression, then proof closing ")"
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

        //Method 4: variable. Is variable TRUE or FALSE?
        //Called from factor
        //Is first a "x" or "y" or "z" then delet
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

        //Method 5: constant. Is constant TRUE or FALSE?
        //Called from factor
        //Is first a digit. If true delete then proof is after then next is true
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

        //Method 6: digit. Is digit TRUE or FALSE?
        //Called from constant
        //Is the element a number between 0 and 9
        public bool digit(string isThisDigit)
        {
            return (isThisDigit.Equals("0") || isThisDigit.Equals("1") || isThisDigit.Equals("2") || isThisDigit.Equals("3") ||
                isThisDigit.Equals("4") || isThisDigit.Equals("5") || isThisDigit.Equals("6") || isThisDigit.Equals("7") ||
                isThisDigit.Equals("8") || isThisDigit.Equals("9"));
        }

    }
}
