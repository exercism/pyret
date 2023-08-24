use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: to-roman end

NUMERALS = [list:
  {"M";1000},
  {"CM";900},
  {"D";500},
  {"CD";400},
  {"C";100},
  {"XC";90},
  {"L";50},
  {"XL";40},
  {"X";10},
  {"IX";9},
  {"V";5},
  {"IV";4},
  {"I";1}]


fun to-roman(number):
  rec to-roman-recursive = 
    lam(current, acc, numerals):
      if numerals.length() == 0:
        acc
      else:
        numeral-rule = numerals.get(0)
        numeral = numeral-rule.{0}
        value = numeral-rule.{1}
        if value <= current:
          updated-value = current - value
          
          to-roman-recursive(updated-value, acc + numeral, numerals)
        else:
          to-roman-recursive(current, acc, numerals.drop(1))
        end
      end
    end
  
  to-roman-recursive(number, "", NUMERALS)
end
