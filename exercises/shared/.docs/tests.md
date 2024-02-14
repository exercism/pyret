# Tests

This track uses [the built-in testing framework][testing-docs].
Once the [pyret-npm][pyret-npm] package has been installed, open the exercise folder and run the `pyret` executable, passing in the exercise's test file like `exercise-test.arr`.

Linux/MacOS

```bash
$ cd {path/to/exercise-folder-location}
$ pyret {exercise-test.arr}
2/2 modules compiled ({exercise-test.arr})
Cleaning up and generating standalone...
Looks shipshape, all 9 tests passed, mate!
```

Windows

```powershell
PS C:\Users\foobar> cd {path\to\exercise-folder-location}
PS C:\Users\foobar\Exercism\pyret\exercise> pyret {exercise-test.arr}
2/2 modules compiled ({exercise-test.arr})
Cleaning up and generating standalone...
Looks shipshape, all 9 tests passed, mate!
```

[testing-docs]: https://pyret.org/docs/latest/testing.html
[pyret-npm]: https://www.npmjs.com/package/pyret-npm
