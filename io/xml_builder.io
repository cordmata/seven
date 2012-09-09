OperatorTable addAssignOperator(":", "appendAttribute")

Attribute := Sequence clone
Attribute appendAttribute := method(name, val,
    name = name asMutable removePrefix("\"") removeSuffix("\"")
    self appendSeq(" #{name}=\"#{val}\"" interpolate))

curlyBrackets := method(
    atts := Attribute clone
    call message arguments foreach(arg, atts doMessage(arg)))

Builder := Object clone
Builder indent := 0
Builder forward := method(
  ind := "    " repeated(self indent)
  attributes := ""
  firstArg := call evalArgAt(0)
  if(firstArg type == "Attribute", attributes = firstArg)
  writeln("#{ind}<#{call message name}#{attributes}>" interpolate)
  call message arguments foreach(
	arg,
        self indent = self indent + 1
	content := self doMessage(arg)
	if(content type == "Sequence", writeln(ind, "    ", content))
        self indent = self indent - 1)
  writeln(ind, "</", call message name, ">"))

doFile("xml_tests.io")
