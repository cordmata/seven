Matrix := List clone

/* Initialize and return a new matrix of the given dimensions. */
Matrix dim := method(x, y,
    m := Matrix setSize(y)
    m mapInPlace(v, list() setSize(x))
)

/* Set value at a specified location. */
Matrix set := method(x, y, value, self at(y) atPut(x, value))


/* Retrieve value at a specified location. */
Matrix get := method(x, y, self at(y) at(x))

Matrix writeToFile := method(path,
    File openForUpdating(path) write(self serialized) close
)

Matrix readFromFile := method(path,
    self = doFile(path)
    self setProto Matrix
)

listSum := List getSlot("sum")
Matrix sum := method(s := 0; self foreach(v, s = s + v listSum); return s)

"---------Test new sum()--------" println
msum := Matrix dim(2,2)
msum set(0,0,1)
msum set(0,1,2)
msum set(1,0,3)
msum set(1,1,4)

"#{list(1,2,3,4) sum} == #{msum sum}" interpolate println

/* Set up matrix for serialization tests */
matx := Matrix dim(3,5)
matx set(1,3,5)
matx set(2,3,4)
matx set(0,0,4)

printTest := method(matrix,
    "#{matrix get(1,3)} == 5" interpolate println
    "#{matrix get(2,3)} == 4" interpolate println
    "#{matrix get(0,0)} == 4" interpolate println
)

"----------Before Serialized---------" println
printTest(matx)

serPath := "/Users/mcordial/Dropbox/Projects/seven/io/ser-matrix.io"
matx writeToFile(serPath)

"----------After Serialized---------" println
printTest(Matrix readFromFile(serPath))
