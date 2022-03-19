
import sys
f = open(sys.argv[1]+"/A/index.h", "w+")
f.write('''int summ(int a, int b)
{
    return a+b;
}
''')
f.close()
