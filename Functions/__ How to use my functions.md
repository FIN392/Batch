# How to use my functions

## Table of Contents <!-- omit in toc -->
- [Copy the code to the end of your script](#copy-the-code-to-the-end-of-your-script)
- [Add the .CMD file to your project folder](#add-the-cmd-file-to-your-project-folder)

---  

## Copy the code in your script

Copy the lines contained between the ':::::::' marks (including them) at the end of your code.

To call the function:
```Batch
CALL :<FunctionName> [<Param> ... ]
```

__PROS:__
- All the code is in one file. Ideal for small scripts with only one or two functions.
- Calling the function is simple.

__CONS:__
- The file can become very long if you use multiple functions.
- Difficult to update functions in case of new versions.
- Cannot share code between different scripts.

## Add the .CMD file to your project folder

Copy the function's CMD file to a folder in your project (for example, ".\Functions"), or a folder on your disk if you're sharing it with multiple projects (for example, "X:\Scripts\Functions").

To call the function:
```Batch
:: Set a variable with your functions folder ending in '\'
SET "Func_=.\Functions\"

:: Call the function like this
CALL %Func_%<FunctionName> [<Param> ... ]
```

__PROS:__
- Easy to update in case new versions of the functions are released.
- Functions can be shared between multiple scripts.
- Easier to read code.

__CONS:__
- The way of calling functions can be a bit confusing.

