include file("binary-search.arr")

check "finds a value in an array with one element":
    binary-search([list: 6], 6) is 0
end

check "finds a value in the middle of an array":
    binary-search([list: 1, 3, 4, 6, 8, 9, 11], 6) is 3
end

check "finds a value at the beginning of an array":
    binary-search([list: 1, 3, 4, 6, 8, 9, 11], 1) is 0
end

check "finds a value at the end of an array":
    binary-search([list: 1, 3, 4, 6, 8, 9, 11], 11) is 6
end

check "finds a value in an array of odd length":
    binary-search([list: 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634], 144) is 9
end

check "finds a value in an array of even length":
    binary-search([list: 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377], 21) is 5
end

check "identifies that a value is not included in the array":
    binary-search([list: 1, 3, 4, 6, 8, 9, 11], 7) raises "value not in list"
end

check "a value smaller than the array's smallest value is not found":
    binary-search([list: 1, 3, 4, 6, 8, 9, 11], 0) raises "value not in list"
end

check "a value larger than the array's largest value is not found":
    binary-search([list: 1, 3, 4, 6, 8, 9, 11], 13) raises "value not in list"
end

check "nothing is found in an empty array":
    binary-search([list: ], 1) raises "value not in list"
end

check "nothing is found when the left and right bounds cross":
    binary-search([list: 1, 2], 0) raises "value not in list"
end
