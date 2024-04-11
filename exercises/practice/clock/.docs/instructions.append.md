# Instructions append

The tests for this exercise expect that your clock will be implemented using a `data declaration` in Pyret.
If you are unfamiliar with data declarations, [the official documentation][data-declaration] is a good place to start.

As part of the exercise, you'll be comparing values constructed by a `Clock` data variant.
Because a clock's hours and minutes can roll over in either direction, the following combinations are the same on a clock:  1 hour 1 minute, 0 hours 61 minutes, 25 hours 1 minutes, and 2 hours -59 minutes.
Pyret's `is` testing operator uses structural equality, which will result in none of these combinations being equal by default.
To that end, you'll need to define your own equality method for comparing time between values from a Clock data variant.
If you're unfamiliar with how Pyret handles equality, review the official docs on [equality].

[data-declaration]: https://pyret.org/docs/latest/s_declarations.html#%28part._s~3adata-decl%29
[equality]: https://pyret.org/docs/latest/equality.html
