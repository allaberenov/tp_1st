#pragma once

import sys
f = open(sys.argv[1]+"/A/index.h", "w+")
f.write('''#pragma once
const int a=2;''')
f.close()
