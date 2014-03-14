-- This is the 6502 CPU It's a RICOH 2A03, it has no support for decimal mode

-- CPU RAM
require("RAM")

initializeMemory()

readMemory(0x5000)