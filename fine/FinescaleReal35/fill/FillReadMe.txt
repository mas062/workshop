Fill is an interpolation program to eanble construction of
moderately complex grids by defining sparse data that will
be interpolated ("filled") to define data on all grid cells.

Copy the program, fill.exe, to a favourite location (or keep
it in current folder).
Example assumes I have copied the file to
D:\Programs

To use the program, first make a data file which includes
instructions for fill. The file must have extension .FILL
(Example TestA.FILL)

To execute this file with fill, make a batch file (extension
.BAT) (or run from command window if you prefer) containing
one line, (example assuming my location)
CALL D:\Programs\fill.exe TestA > TestA.LOG

(The last argument is optional, and writes a run log to the file
TestA.LOG)

fill will generate a file TestA.FILLED, which contains COORD,
ZCORN, and petrophysics if required.

The files FILLEXE.BAT and TestA.FILL are provided as examples.

Full documentation can be found in the PDF-file provided.
