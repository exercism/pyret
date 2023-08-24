use context essentials2020

include file("roman-numerals.arr")

check "1 is I":
  to-roman(1) is "I"
end

check "2 is II":
  to-roman(2) is "II"
end

check "3 is III":
  to-roman(3) is "III"
end

check "4 is IV":
  to-roman(4) is "IV"
end

check "5 is V":
  to-roman(5) is "V"
end

check "6 is VI":
  to-roman(6) is "VI"
end

check "9 is IX":
  to-roman(9) is "IX"
end

check "16 is XVI":
  to-roman(16) is "XVI"
end

check "27 is XXVII":
  to-roman(27) is "XXVII"
end

check "48 is XLVIII":
  to-roman(48) is "XLVIII"
end

check "49 is XLIX":
  to-roman(49) is "XLIX"
end

check "59 is LIX":
  to-roman(59) is "LIX"
end

check "66 is LXVI":
  to-roman(66) is "LXVI"
end

check "93 is XCIII":
  to-roman(93) is "XCIII"
end

check "141 is CXLI":
  to-roman(141) is "CXLI"
end

check "163 is CLXIII":
  to-roman(163) is "CLXIII"
end

check "166 is CLXVI":
  to-roman(166) is "CLXVI"
end

check "402 is CDII":
  to-roman(402) is "CDII"
end

check "575 is DLXXV":
  to-roman(575) is "DLXXV"
end

check "666 is DCLXVI":
  to-roman(666) is "DCLXVI"
end

check "911 is CMXI":
  to-roman(911) is "CMXI"
end

check "1024 is MXXIV":
  to-roman(1024) is "MXXIV"
end

check "1666 is MDCLXVI":
  to-roman(1666) is "MDCLXVI"
end

check "3000 is MMM":
  to-roman(3000) is "MMM"
end

check "3001 is MMMI":
  to-roman(3001) is "MMMI"
end

check "3999 is MMMCMXCIX":
  to-roman(3999) is "MMMCMXCIX"
end
