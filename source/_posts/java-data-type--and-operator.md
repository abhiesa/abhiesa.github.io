title: Java Data Types and Operators
date: 2014-10-28 14:44:00
tags: Java
categories: Technical Notes
---

**data types in java**

|Type   |Explanation                                         |Default|Wrapper|Min Value           |Max Value          |
|-------|----------------------------------------------------|-------|-------|--------------------|-------------------|
|int    |A 32-bit (4-byte) integer value                     |0      |Integer|-2147483648         |2147483647         |
|short  |A 16-bit (2-byte) integer value                     |0      |Short  |-32768              |32767              |
|long   |A 64-bit (8-byte) integer value                     |0L     |Long   |-9223372036854775808|9223372036854775807|
|byte   |An 8-bit (1-byte) integer value                     |0      |Byte   |-128                |+127               |
|float  |A 32-bit (4-byte) floating-point value              |0.0f   |Float  |1.4e-045            |3.4e+038           |
|double |A 64-bit (8-byte) floating-point value              |0.0d   |Double |4.9e-324            |1.8e+308           |
|char   |A 16-bit character using the Unicode encoding scheme|\u0000 |Char   |                    |                   |
|boolean|A true or false value                               |false  |Boolean|false               |true               |

**keywords in Java**

|abstract |class    |extends |implements |null      |strictfp     |true     |assert   |const    |false   |import     |package   |super        |try      |boolean  |continue |final   |instanceof |private   |switch       |void     |break    |default  |finally |int        |protected |synchronized |volatile |byte     |do       |float   |interface  |public    |this         |while    |case     |double   |for     |long       |return    |throw        |catch    |else     |goto    |native     |short     |throws        |char     |enum     |if      |new        |static    |transient

**All Arithmetic Operators**

|Operator|Result                   |
|--------|-------------------------|
|+	     |Addition                 |
|-	     |Subtraction (unary minus)|
|*	     |Multiplication           |
|/	     |Division                 |
|%	     |Modulus                  |
|++	     |Increment                |
|+=	     |Addition assignment      |
|-=	     |Subtraction assignment   |
|*=	     |Multiplication assignment|
|/=	     |Division assignment      |
|%=	     |Modulus assignment       |
|--	     |Decrement                |


###Some Interesting Utilities

```java
public final class Interesting {

  /**
   * Get a Boolean from a boolean, equivalent to the java 1.4 method Boolean.valueOf(boolean)
   * @param value the boolean
   * @return the Boolean equivalent
   */
  public static Boolean valueOf(boolean value) {
    if (value)
      return Boolean.TRUE;
    else
      return Boolean.FALSE;
  }

  /**
   * Test the equality of two doubles by converting their values into IEEE 754 floating-point "double format" long values.
   * @param a Double to check equality with.
   * @param b Double to check equality with.
   * @return True if a equals b.
   */
  public static boolean equals(final double a, final double b) {
    return Double.doubleToLongBits(a) == Double.doubleToLongBits(b);
  }

  /**
   * Test the equality of two doubles by converting their values into IEEE 754 floating-point "single precision" bit layouts.
   * @param a Float to check equality with.
   * @param b Float to check equality with.
   * @return True if a equals b.
   */
  public static boolean equals(final float a, final float b) {
    return Float.floatToIntBits(a) == Float.floatToIntBits(b);
  }

  /**
   * Test the equality of a given sub-section of two byte arrays.
   * 
   * @param a The first byte array.
   * @param abegin The begining index of the first byte array.
   * @param b The second byte array.
   * @param bbegin The begining index of the second byte array.
   * @param length The length of the sub-section.
   * @return True if sub-sections are equal.
   */
  public static boolean equals(final byte a[], final int abegin, final byte b[], final int bbegin,final int length) {
    try {
      int i = length;
      while (--i >= 0) {
        if (a[abegin + i] != b[bbegin + i]) {
          return false;
        }
      }
    } catch (ArrayIndexOutOfBoundsException e) {
      return false;
    }
    return true;
  }

  /**
   * Test the equality of two byte arrays.
   * @param a The first byte array.
   * @param b The second byte array.
   * @return True if the byte arrays are equal.
   */
  public static boolean equals(final byte a[], final byte b[]) {
    if (a == b)
      return true;
    if (a == null || b == null)
      return false;
    if (a.length != b.length)
      return false;
    try {
      for (int i = 0; i < a.length; i++) {
        if (a[i] != b[i]) {
          return false;
        }
      }
    } catch (ArrayIndexOutOfBoundsException e) {
      return false;
    }
    return true;
  }
  
}
```

