# Tests

This track uses `pyret` which is [available as a NPM package][pyret-npm]. Once installed, you can run your exercise's test file by passing `pyret` its location relative to your current working directory.

Linux/MacOS
```bash
$ cd {path/to/exercise-folder-location}
```

Windows
```powershell
PS C:\Users\foobar> cd {path\to\exercise-folder-location}
```

Then you can run the tests by running the `pyret` command as shown below, replacing `{exercise-test.arr}` with the name of the test file.

Linux/MacOS
```bash
$ pyret {exercise-test.arr}
2/2 modules compiled ({exercise-test.arr})
Cleaning up and generating standalone...
Looks shipshape, all 9 tests passed, mate!
```

Windows
```powershell
PS C:\Users\foobar\Exercism\pyret\exercise> pyret {exercise-test.arr}
2/2 modules compiled ({exercise-test.arr})
Cleaning up and generating standalone...
Looks shipshape, all 9 tests passed, mate!
```

[pyret-npm]: "https://www.npmjs.com/package/pyret-npm"