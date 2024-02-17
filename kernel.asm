
kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <multiboot_header>:
  100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fe 4f 52             	decb   0x52(%edi)
  10000b:	e4                   	.byte 0xe4

0010000c <_start>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
  10000c:	bc 40 64 10 00       	mov    $0x106440,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
  100011:	b8 a5 08 10 00       	mov    $0x1008a5,%eax
  jmp *%eax
  100016:	ff e0                	jmp    *%eax

00100018 <outw>:
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
}

static inline void
outw(ushort port, ushort data)
{
  100018:	55                   	push   %ebp
  100019:	89 e5                	mov    %esp,%ebp
  10001b:	83 ec 08             	sub    $0x8,%esp
  10001e:	8b 55 08             	mov    0x8(%ebp),%edx
  100021:	8b 45 0c             	mov    0xc(%ebp),%eax
  100024:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100028:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  10002c:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  100030:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100034:	66 ef                	out    %ax,(%dx)
}
  100036:	90                   	nop
  100037:	c9                   	leave  
  100038:	c3                   	ret    

00100039 <cli>:
  return eflags;
}

static inline void
cli(void)
{
  100039:	55                   	push   %ebp
  10003a:	89 e5                	mov    %esp,%ebp
  asm volatile("cli");
  10003c:	fa                   	cli    
}
  10003d:	90                   	nop
  10003e:	5d                   	pop    %ebp
  10003f:	c3                   	ret    

00100040 <printint>:

static int panicked = 0;

static void
printint(int xx, int base, int sign)
{
  100040:	f3 0f 1e fb          	endbr32 
  100044:	55                   	push   %ebp
  100045:	89 e5                	mov    %esp,%ebp
  100047:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
  10004a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10004e:	74 1c                	je     10006c <printint+0x2c>
  100050:	8b 45 08             	mov    0x8(%ebp),%eax
  100053:	c1 e8 1f             	shr    $0x1f,%eax
  100056:	0f b6 c0             	movzbl %al,%eax
  100059:	89 45 10             	mov    %eax,0x10(%ebp)
  10005c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  100060:	74 0a                	je     10006c <printint+0x2c>
    x = -xx;
  100062:	8b 45 08             	mov    0x8(%ebp),%eax
  100065:	f7 d8                	neg    %eax
  100067:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10006a:	eb 06                	jmp    100072 <printint+0x32>
  else
    x = xx;
  10006c:	8b 45 08             	mov    0x8(%ebp),%eax
  10006f:	89 45 f0             	mov    %eax,-0x10(%ebp)

  i = 0;
  100072:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
  100079:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10007c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10007f:	ba 00 00 00 00       	mov    $0x0,%edx
  100084:	f7 f1                	div    %ecx
  100086:	89 d1                	mov    %edx,%ecx
  100088:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10008b:	8d 50 01             	lea    0x1(%eax),%edx
  10008e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100091:	0f b6 91 00 50 10 00 	movzbl 0x105000(%ecx),%edx
  100098:	88 54 05 e0          	mov    %dl,-0x20(%ebp,%eax,1)
  }while((x /= base) != 0);
  10009c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10009f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1000a2:	ba 00 00 00 00       	mov    $0x0,%edx
  1000a7:	f7 f1                	div    %ecx
  1000a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1000ac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1000b0:	75 c7                	jne    100079 <printint+0x39>

  if(sign)
  1000b2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1000b6:	74 2a                	je     1000e2 <printint+0xa2>
    buf[i++] = '-';
  1000b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000bb:	8d 50 01             	lea    0x1(%eax),%edx
  1000be:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1000c1:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)

  while(--i >= 0)
  1000c6:	eb 1a                	jmp    1000e2 <printint+0xa2>
    consputc(buf[i]);
  1000c8:	8d 55 e0             	lea    -0x20(%ebp),%edx
  1000cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000ce:	01 d0                	add    %edx,%eax
  1000d0:	0f b6 00             	movzbl (%eax),%eax
  1000d3:	0f be c0             	movsbl %al,%eax
  1000d6:	83 ec 0c             	sub    $0xc,%esp
  1000d9:	50                   	push   %eax
  1000da:	e8 6b 02 00 00       	call   10034a <consputc>
  1000df:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
  1000e2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1000e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1000ea:	79 dc                	jns    1000c8 <printint+0x88>
}
  1000ec:	90                   	nop
  1000ed:	90                   	nop
  1000ee:	c9                   	leave  
  1000ef:	c3                   	ret    

001000f0 <cprintf>:

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
  1000f0:	f3 0f 1e fb          	endbr32 
  1000f4:	55                   	push   %ebp
  1000f5:	89 e5                	mov    %esp,%ebp
  1000f7:	83 ec 18             	sub    $0x18,%esp
  int i, c;
  uint *argp;
  char *s;

  if (fmt == 0)
  1000fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1000fd:	85 c0                	test   %eax,%eax
  1000ff:	0f 84 63 01 00 00    	je     100268 <cprintf+0x178>
    // panic("null fmt");
    return;

  argp = (uint*)(void*)(&fmt + 1);
  100105:	8d 45 0c             	lea    0xc(%ebp),%eax
  100108:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
  10010b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100112:	e9 2f 01 00 00       	jmp    100246 <cprintf+0x156>
    if(c != '%'){
  100117:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
  10011b:	74 13                	je     100130 <cprintf+0x40>
      consputc(c);
  10011d:	83 ec 0c             	sub    $0xc,%esp
  100120:	ff 75 e8             	pushl  -0x18(%ebp)
  100123:	e8 22 02 00 00       	call   10034a <consputc>
  100128:	83 c4 10             	add    $0x10,%esp
      continue;
  10012b:	e9 12 01 00 00       	jmp    100242 <cprintf+0x152>
    }
    c = fmt[++i] & 0xff;
  100130:	8b 55 08             	mov    0x8(%ebp),%edx
  100133:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100137:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10013a:	01 d0                	add    %edx,%eax
  10013c:	0f b6 00             	movzbl (%eax),%eax
  10013f:	0f be c0             	movsbl %al,%eax
  100142:	25 ff 00 00 00       	and    $0xff,%eax
  100147:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(c == 0)
  10014a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10014e:	0f 84 17 01 00 00    	je     10026b <cprintf+0x17b>
      break;
    switch(c){
  100154:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
  100158:	74 5e                	je     1001b8 <cprintf+0xc8>
  10015a:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
  10015e:	0f 8f c2 00 00 00    	jg     100226 <cprintf+0x136>
  100164:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
  100168:	74 6b                	je     1001d5 <cprintf+0xe5>
  10016a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
  10016e:	0f 8f b2 00 00 00    	jg     100226 <cprintf+0x136>
  100174:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
  100178:	74 3e                	je     1001b8 <cprintf+0xc8>
  10017a:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
  10017e:	0f 8f a2 00 00 00    	jg     100226 <cprintf+0x136>
  100184:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
  100188:	0f 84 89 00 00 00    	je     100217 <cprintf+0x127>
  10018e:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
  100192:	0f 85 8e 00 00 00    	jne    100226 <cprintf+0x136>
    case 'd':
      printint(*argp++, 10, 1);
  100198:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10019b:	8d 50 04             	lea    0x4(%eax),%edx
  10019e:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1001a1:	8b 00                	mov    (%eax),%eax
  1001a3:	83 ec 04             	sub    $0x4,%esp
  1001a6:	6a 01                	push   $0x1
  1001a8:	6a 0a                	push   $0xa
  1001aa:	50                   	push   %eax
  1001ab:	e8 90 fe ff ff       	call   100040 <printint>
  1001b0:	83 c4 10             	add    $0x10,%esp
      break;
  1001b3:	e9 8a 00 00 00       	jmp    100242 <cprintf+0x152>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
  1001b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1001bb:	8d 50 04             	lea    0x4(%eax),%edx
  1001be:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1001c1:	8b 00                	mov    (%eax),%eax
  1001c3:	83 ec 04             	sub    $0x4,%esp
  1001c6:	6a 00                	push   $0x0
  1001c8:	6a 10                	push   $0x10
  1001ca:	50                   	push   %eax
  1001cb:	e8 70 fe ff ff       	call   100040 <printint>
  1001d0:	83 c4 10             	add    $0x10,%esp
      break;
  1001d3:	eb 6d                	jmp    100242 <cprintf+0x152>
    case 's':
      if((s = (char*)*argp++) == 0)
  1001d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1001d8:	8d 50 04             	lea    0x4(%eax),%edx
  1001db:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1001de:	8b 00                	mov    (%eax),%eax
  1001e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1001e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  1001e7:	75 22                	jne    10020b <cprintf+0x11b>
        s = "(null)";
  1001e9:	c7 45 ec ec 42 10 00 	movl   $0x1042ec,-0x14(%ebp)
      for(; *s; s++)
  1001f0:	eb 19                	jmp    10020b <cprintf+0x11b>
        consputc(*s);
  1001f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1001f5:	0f b6 00             	movzbl (%eax),%eax
  1001f8:	0f be c0             	movsbl %al,%eax
  1001fb:	83 ec 0c             	sub    $0xc,%esp
  1001fe:	50                   	push   %eax
  1001ff:	e8 46 01 00 00       	call   10034a <consputc>
  100204:	83 c4 10             	add    $0x10,%esp
      for(; *s; s++)
  100207:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  10020b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10020e:	0f b6 00             	movzbl (%eax),%eax
  100211:	84 c0                	test   %al,%al
  100213:	75 dd                	jne    1001f2 <cprintf+0x102>
      break;
  100215:	eb 2b                	jmp    100242 <cprintf+0x152>
    case '%':
      consputc('%');
  100217:	83 ec 0c             	sub    $0xc,%esp
  10021a:	6a 25                	push   $0x25
  10021c:	e8 29 01 00 00       	call   10034a <consputc>
  100221:	83 c4 10             	add    $0x10,%esp
      break;
  100224:	eb 1c                	jmp    100242 <cprintf+0x152>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
  100226:	83 ec 0c             	sub    $0xc,%esp
  100229:	6a 25                	push   $0x25
  10022b:	e8 1a 01 00 00       	call   10034a <consputc>
  100230:	83 c4 10             	add    $0x10,%esp
      consputc(c);
  100233:	83 ec 0c             	sub    $0xc,%esp
  100236:	ff 75 e8             	pushl  -0x18(%ebp)
  100239:	e8 0c 01 00 00       	call   10034a <consputc>
  10023e:	83 c4 10             	add    $0x10,%esp
      break;
  100241:	90                   	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
  100242:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100246:	8b 55 08             	mov    0x8(%ebp),%edx
  100249:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10024c:	01 d0                	add    %edx,%eax
  10024e:	0f b6 00             	movzbl (%eax),%eax
  100251:	0f be c0             	movsbl %al,%eax
  100254:	25 ff 00 00 00       	and    $0xff,%eax
  100259:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10025c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  100260:	0f 85 b1 fe ff ff    	jne    100117 <cprintf+0x27>
  100266:	eb 04                	jmp    10026c <cprintf+0x17c>
    return;
  100268:	90                   	nop
  100269:	eb 01                	jmp    10026c <cprintf+0x17c>
      break;
  10026b:	90                   	nop
    }
  }
}
  10026c:	c9                   	leave  
  10026d:	c3                   	ret    

0010026e <halt>:

void
halt(void)
{
  10026e:	f3 0f 1e fb          	endbr32 
  100272:	55                   	push   %ebp
  100273:	89 e5                	mov    %esp,%ebp
  100275:	83 ec 08             	sub    $0x8,%esp
  cprintf("Bye COL%d!\n\0", 331);
  100278:	83 ec 08             	sub    $0x8,%esp
  10027b:	68 4b 01 00 00       	push   $0x14b
  100280:	68 f3 42 10 00       	push   $0x1042f3
  100285:	e8 66 fe ff ff       	call   1000f0 <cprintf>
  10028a:	83 c4 10             	add    $0x10,%esp
  outw(0x602, 0x2000);
  10028d:	83 ec 08             	sub    $0x8,%esp
  100290:	68 00 20 00 00       	push   $0x2000
  100295:	68 02 06 00 00       	push   $0x602
  10029a:	e8 79 fd ff ff       	call   100018 <outw>
  10029f:	83 c4 10             	add    $0x10,%esp
  // For older versions of QEMU, 
  outw(0xB002, 0x2000);
  1002a2:	83 ec 08             	sub    $0x8,%esp
  1002a5:	68 00 20 00 00       	push   $0x2000
  1002aa:	68 02 b0 00 00       	push   $0xb002
  1002af:	e8 64 fd ff ff       	call   100018 <outw>
  1002b4:	83 c4 10             	add    $0x10,%esp
  for(;;);
  1002b7:	eb fe                	jmp    1002b7 <halt+0x49>

001002b9 <panic>:
}

void
panic(char *s)
{
  1002b9:	f3 0f 1e fb          	endbr32 
  1002bd:	55                   	push   %ebp
  1002be:	89 e5                	mov    %esp,%ebp
  1002c0:	83 ec 38             	sub    $0x38,%esp
  int i;
  uint pcs[10];

  cli();
  1002c3:	e8 71 fd ff ff       	call   100039 <cli>
  cprintf("lapicid %d: panic: ", lapicid());
  1002c8:	e8 78 04 00 00       	call   100745 <lapicid>
  1002cd:	83 ec 08             	sub    $0x8,%esp
  1002d0:	50                   	push   %eax
  1002d1:	68 00 43 10 00       	push   $0x104300
  1002d6:	e8 15 fe ff ff       	call   1000f0 <cprintf>
  1002db:	83 c4 10             	add    $0x10,%esp
  cprintf(s);
  1002de:	8b 45 08             	mov    0x8(%ebp),%eax
  1002e1:	83 ec 0c             	sub    $0xc,%esp
  1002e4:	50                   	push   %eax
  1002e5:	e8 06 fe ff ff       	call   1000f0 <cprintf>
  1002ea:	83 c4 10             	add    $0x10,%esp
  cprintf("\n");
  1002ed:	83 ec 0c             	sub    $0xc,%esp
  1002f0:	68 14 43 10 00       	push   $0x104314
  1002f5:	e8 f6 fd ff ff       	call   1000f0 <cprintf>
  1002fa:	83 c4 10             	add    $0x10,%esp
  getcallerpcs(&s, pcs);
  1002fd:	83 ec 08             	sub    $0x8,%esp
  100300:	8d 45 cc             	lea    -0x34(%ebp),%eax
  100303:	50                   	push   %eax
  100304:	8d 45 08             	lea    0x8(%ebp),%eax
  100307:	50                   	push   %eax
  100308:	e8 2d 0f 00 00       	call   10123a <getcallerpcs>
  10030d:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
  100310:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100317:	eb 1c                	jmp    100335 <panic+0x7c>
    cprintf(" %p", pcs[i]);
  100319:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10031c:	8b 44 85 cc          	mov    -0x34(%ebp,%eax,4),%eax
  100320:	83 ec 08             	sub    $0x8,%esp
  100323:	50                   	push   %eax
  100324:	68 16 43 10 00       	push   $0x104316
  100329:	e8 c2 fd ff ff       	call   1000f0 <cprintf>
  10032e:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
  100331:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100335:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  100339:	7e de                	jle    100319 <panic+0x60>
  panicked = 1; // freeze other CPU
  10033b:	c7 05 20 54 10 00 01 	movl   $0x1,0x105420
  100342:	00 00 00 
  halt();
  100345:	e8 24 ff ff ff       	call   10026e <halt>

0010034a <consputc>:

#define BACKSPACE 0x100

void
consputc(int c)
{
  10034a:	f3 0f 1e fb          	endbr32 
  10034e:	55                   	push   %ebp
  10034f:	89 e5                	mov    %esp,%ebp
  100351:	83 ec 08             	sub    $0x8,%esp
  if(c == BACKSPACE){
  100354:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
  10035b:	75 29                	jne    100386 <consputc+0x3c>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  10035d:	83 ec 0c             	sub    $0xc,%esp
  100360:	6a 08                	push   $0x8
  100362:	e8 a3 0a 00 00       	call   100e0a <uartputc>
  100367:	83 c4 10             	add    $0x10,%esp
  10036a:	83 ec 0c             	sub    $0xc,%esp
  10036d:	6a 20                	push   $0x20
  10036f:	e8 96 0a 00 00       	call   100e0a <uartputc>
  100374:	83 c4 10             	add    $0x10,%esp
  100377:	83 ec 0c             	sub    $0xc,%esp
  10037a:	6a 08                	push   $0x8
  10037c:	e8 89 0a 00 00       	call   100e0a <uartputc>
  100381:	83 c4 10             	add    $0x10,%esp
  } else
    uartputc(c);
}
  100384:	eb 0e                	jmp    100394 <consputc+0x4a>
    uartputc(c);
  100386:	83 ec 0c             	sub    $0xc,%esp
  100389:	ff 75 08             	pushl  0x8(%ebp)
  10038c:	e8 79 0a 00 00       	call   100e0a <uartputc>
  100391:	83 c4 10             	add    $0x10,%esp
}
  100394:	90                   	nop
  100395:	c9                   	leave  
  100396:	c3                   	ret    

00100397 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
  100397:	f3 0f 1e fb          	endbr32 
  10039b:	55                   	push   %ebp
  10039c:	89 e5                	mov    %esp,%ebp
  10039e:	83 ec 18             	sub    $0x18,%esp
  int c;

  while((c = getc()) >= 0){
  1003a1:	e9 19 01 00 00       	jmp    1004bf <consoleintr+0x128>
    switch(c){
  1003a6:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%ebp)
  1003aa:	74 63                	je     10040f <consoleintr+0x78>
  1003ac:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%ebp)
  1003b0:	0f 8f 8b 00 00 00    	jg     100441 <consoleintr+0xaa>
  1003b6:	83 7d f4 08          	cmpl   $0x8,-0xc(%ebp)
  1003ba:	74 53                	je     10040f <consoleintr+0x78>
  1003bc:	83 7d f4 15          	cmpl   $0x15,-0xc(%ebp)
  1003c0:	75 7f                	jne    100441 <consoleintr+0xaa>
    case C('U'):  // Kill line.
      while(input.e != input.w &&
  1003c2:	eb 1d                	jmp    1003e1 <consoleintr+0x4a>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
  1003c4:	a1 c8 64 10 00       	mov    0x1064c8,%eax
  1003c9:	83 e8 01             	sub    $0x1,%eax
  1003cc:	a3 c8 64 10 00       	mov    %eax,0x1064c8
        consputc(BACKSPACE);
  1003d1:	83 ec 0c             	sub    $0xc,%esp
  1003d4:	68 00 01 00 00       	push   $0x100
  1003d9:	e8 6c ff ff ff       	call   10034a <consputc>
  1003de:	83 c4 10             	add    $0x10,%esp
      while(input.e != input.w &&
  1003e1:	8b 15 c8 64 10 00    	mov    0x1064c8,%edx
  1003e7:	a1 c4 64 10 00       	mov    0x1064c4,%eax
  1003ec:	39 c2                	cmp    %eax,%edx
  1003ee:	0f 84 cb 00 00 00    	je     1004bf <consoleintr+0x128>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
  1003f4:	a1 c8 64 10 00       	mov    0x1064c8,%eax
  1003f9:	83 e8 01             	sub    $0x1,%eax
  1003fc:	83 e0 7f             	and    $0x7f,%eax
  1003ff:	0f b6 80 40 64 10 00 	movzbl 0x106440(%eax),%eax
      while(input.e != input.w &&
  100406:	3c 0a                	cmp    $0xa,%al
  100408:	75 ba                	jne    1003c4 <consoleintr+0x2d>
      }
      break;
  10040a:	e9 b0 00 00 00       	jmp    1004bf <consoleintr+0x128>
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
  10040f:	8b 15 c8 64 10 00    	mov    0x1064c8,%edx
  100415:	a1 c4 64 10 00       	mov    0x1064c4,%eax
  10041a:	39 c2                	cmp    %eax,%edx
  10041c:	0f 84 9d 00 00 00    	je     1004bf <consoleintr+0x128>
        input.e--;
  100422:	a1 c8 64 10 00       	mov    0x1064c8,%eax
  100427:	83 e8 01             	sub    $0x1,%eax
  10042a:	a3 c8 64 10 00       	mov    %eax,0x1064c8
        consputc(BACKSPACE);
  10042f:	83 ec 0c             	sub    $0xc,%esp
  100432:	68 00 01 00 00       	push   $0x100
  100437:	e8 0e ff ff ff       	call   10034a <consputc>
  10043c:	83 c4 10             	add    $0x10,%esp
      }
      break;
  10043f:	eb 7e                	jmp    1004bf <consoleintr+0x128>
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
  100441:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100445:	74 77                	je     1004be <consoleintr+0x127>
  100447:	8b 15 c8 64 10 00    	mov    0x1064c8,%edx
  10044d:	a1 c0 64 10 00       	mov    0x1064c0,%eax
  100452:	29 c2                	sub    %eax,%edx
  100454:	89 d0                	mov    %edx,%eax
  100456:	83 f8 7f             	cmp    $0x7f,%eax
  100459:	77 63                	ja     1004be <consoleintr+0x127>
        c = (c == '\r') ? '\n' : c;
  10045b:	83 7d f4 0d          	cmpl   $0xd,-0xc(%ebp)
  10045f:	74 05                	je     100466 <consoleintr+0xcf>
  100461:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100464:	eb 05                	jmp    10046b <consoleintr+0xd4>
  100466:	b8 0a 00 00 00       	mov    $0xa,%eax
  10046b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        input.buf[input.e++ % INPUT_BUF] = c;
  10046e:	a1 c8 64 10 00       	mov    0x1064c8,%eax
  100473:	8d 50 01             	lea    0x1(%eax),%edx
  100476:	89 15 c8 64 10 00    	mov    %edx,0x1064c8
  10047c:	83 e0 7f             	and    $0x7f,%eax
  10047f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100482:	88 90 40 64 10 00    	mov    %dl,0x106440(%eax)
        consputc(c);
  100488:	83 ec 0c             	sub    $0xc,%esp
  10048b:	ff 75 f4             	pushl  -0xc(%ebp)
  10048e:	e8 b7 fe ff ff       	call   10034a <consputc>
  100493:	83 c4 10             	add    $0x10,%esp
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
  100496:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
  10049a:	74 18                	je     1004b4 <consoleintr+0x11d>
  10049c:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
  1004a0:	74 12                	je     1004b4 <consoleintr+0x11d>
  1004a2:	a1 c8 64 10 00       	mov    0x1064c8,%eax
  1004a7:	8b 15 c0 64 10 00    	mov    0x1064c0,%edx
  1004ad:	83 ea 80             	sub    $0xffffff80,%edx
  1004b0:	39 d0                	cmp    %edx,%eax
  1004b2:	75 0a                	jne    1004be <consoleintr+0x127>
          input.w = input.e;
  1004b4:	a1 c8 64 10 00       	mov    0x1064c8,%eax
  1004b9:	a3 c4 64 10 00       	mov    %eax,0x1064c4
        }
      }
      break;
  1004be:	90                   	nop
  while((c = getc()) >= 0){
  1004bf:	8b 45 08             	mov    0x8(%ebp),%eax
  1004c2:	ff d0                	call   *%eax
  1004c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1004c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004cb:	0f 89 d5 fe ff ff    	jns    1003a6 <consoleintr+0xf>
    }
  }
  1004d1:	90                   	nop
  1004d2:	90                   	nop
  1004d3:	c9                   	leave  
  1004d4:	c3                   	ret    

001004d5 <ioapicread>:
  uint data;
};

static uint
ioapicread(int reg)
{
  1004d5:	f3 0f 1e fb          	endbr32 
  1004d9:	55                   	push   %ebp
  1004da:	89 e5                	mov    %esp,%ebp
  ioapic->reg = reg;
  1004dc:	a1 cc 64 10 00       	mov    0x1064cc,%eax
  1004e1:	8b 55 08             	mov    0x8(%ebp),%edx
  1004e4:	89 10                	mov    %edx,(%eax)
  return ioapic->data;
  1004e6:	a1 cc 64 10 00       	mov    0x1064cc,%eax
  1004eb:	8b 40 10             	mov    0x10(%eax),%eax
}
  1004ee:	5d                   	pop    %ebp
  1004ef:	c3                   	ret    

001004f0 <ioapicwrite>:

static void
ioapicwrite(int reg, uint data)
{
  1004f0:	f3 0f 1e fb          	endbr32 
  1004f4:	55                   	push   %ebp
  1004f5:	89 e5                	mov    %esp,%ebp
  ioapic->reg = reg;
  1004f7:	a1 cc 64 10 00       	mov    0x1064cc,%eax
  1004fc:	8b 55 08             	mov    0x8(%ebp),%edx
  1004ff:	89 10                	mov    %edx,(%eax)
  ioapic->data = data;
  100501:	a1 cc 64 10 00       	mov    0x1064cc,%eax
  100506:	8b 55 0c             	mov    0xc(%ebp),%edx
  100509:	89 50 10             	mov    %edx,0x10(%eax)
}
  10050c:	90                   	nop
  10050d:	5d                   	pop    %ebp
  10050e:	c3                   	ret    

0010050f <ioapicinit>:

void
ioapicinit(void)
{
  10050f:	f3 0f 1e fb          	endbr32 
  100513:	55                   	push   %ebp
  100514:	89 e5                	mov    %esp,%ebp
  100516:	83 ec 18             	sub    $0x18,%esp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  100519:	c7 05 cc 64 10 00 00 	movl   $0xfec00000,0x1064cc
  100520:	00 c0 fe 
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  100523:	6a 01                	push   $0x1
  100525:	e8 ab ff ff ff       	call   1004d5 <ioapicread>
  10052a:	83 c4 04             	add    $0x4,%esp
  10052d:	c1 e8 10             	shr    $0x10,%eax
  100530:	25 ff 00 00 00       	and    $0xff,%eax
  100535:	89 45 f0             	mov    %eax,-0x10(%ebp)
  id = ioapicread(REG_ID) >> 24;
  100538:	6a 00                	push   $0x0
  10053a:	e8 96 ff ff ff       	call   1004d5 <ioapicread>
  10053f:	83 c4 04             	add    $0x4,%esp
  100542:	c1 e8 18             	shr    $0x18,%eax
  100545:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(id != ioapicid)
  100548:	0f b6 05 d4 64 10 00 	movzbl 0x1064d4,%eax
  10054f:	0f b6 c0             	movzbl %al,%eax
  100552:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  100555:	74 10                	je     100567 <ioapicinit+0x58>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
  100557:	83 ec 0c             	sub    $0xc,%esp
  10055a:	68 1c 43 10 00       	push   $0x10431c
  10055f:	e8 8c fb ff ff       	call   1000f0 <cprintf>
  100564:	83 c4 10             	add    $0x10,%esp

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
  100567:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10056e:	eb 3f                	jmp    1005af <ioapicinit+0xa0>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
  100570:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100573:	83 c0 20             	add    $0x20,%eax
  100576:	0d 00 00 01 00       	or     $0x10000,%eax
  10057b:	89 c2                	mov    %eax,%edx
  10057d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100580:	83 c0 08             	add    $0x8,%eax
  100583:	01 c0                	add    %eax,%eax
  100585:	83 ec 08             	sub    $0x8,%esp
  100588:	52                   	push   %edx
  100589:	50                   	push   %eax
  10058a:	e8 61 ff ff ff       	call   1004f0 <ioapicwrite>
  10058f:	83 c4 10             	add    $0x10,%esp
    ioapicwrite(REG_TABLE+2*i+1, 0);
  100592:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100595:	83 c0 08             	add    $0x8,%eax
  100598:	01 c0                	add    %eax,%eax
  10059a:	83 c0 01             	add    $0x1,%eax
  10059d:	83 ec 08             	sub    $0x8,%esp
  1005a0:	6a 00                	push   $0x0
  1005a2:	50                   	push   %eax
  1005a3:	e8 48 ff ff ff       	call   1004f0 <ioapicwrite>
  1005a8:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i <= maxintr; i++){
  1005ab:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1005af:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005b2:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  1005b5:	7e b9                	jle    100570 <ioapicinit+0x61>
  }
}
  1005b7:	90                   	nop
  1005b8:	90                   	nop
  1005b9:	c9                   	leave  
  1005ba:	c3                   	ret    

001005bb <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
  1005bb:	f3 0f 1e fb          	endbr32 
  1005bf:	55                   	push   %ebp
  1005c0:	89 e5                	mov    %esp,%ebp
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  1005c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1005c5:	83 c0 20             	add    $0x20,%eax
  1005c8:	89 c2                	mov    %eax,%edx
  1005ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1005cd:	83 c0 08             	add    $0x8,%eax
  1005d0:	01 c0                	add    %eax,%eax
  1005d2:	52                   	push   %edx
  1005d3:	50                   	push   %eax
  1005d4:	e8 17 ff ff ff       	call   1004f0 <ioapicwrite>
  1005d9:	83 c4 08             	add    $0x8,%esp
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
  1005dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005df:	c1 e0 18             	shl    $0x18,%eax
  1005e2:	89 c2                	mov    %eax,%edx
  1005e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005e7:	83 c0 08             	add    $0x8,%eax
  1005ea:	01 c0                	add    %eax,%eax
  1005ec:	83 c0 01             	add    $0x1,%eax
  1005ef:	52                   	push   %edx
  1005f0:	50                   	push   %eax
  1005f1:	e8 fa fe ff ff       	call   1004f0 <ioapicwrite>
  1005f6:	83 c4 08             	add    $0x8,%esp
}
  1005f9:	90                   	nop
  1005fa:	c9                   	leave  
  1005fb:	c3                   	ret    

001005fc <lapicw>:

volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  1005fc:	f3 0f 1e fb          	endbr32 
  100600:	55                   	push   %ebp
  100601:	89 e5                	mov    %esp,%ebp
  lapic[index] = value;
  100603:	a1 d0 64 10 00       	mov    0x1064d0,%eax
  100608:	8b 55 08             	mov    0x8(%ebp),%edx
  10060b:	c1 e2 02             	shl    $0x2,%edx
  10060e:	01 c2                	add    %eax,%edx
  100610:	8b 45 0c             	mov    0xc(%ebp),%eax
  100613:	89 02                	mov    %eax,(%edx)
  lapic[ID];  // wait for write to finish, by reading
  100615:	a1 d0 64 10 00       	mov    0x1064d0,%eax
  10061a:	83 c0 20             	add    $0x20,%eax
  10061d:	8b 00                	mov    (%eax),%eax
}
  10061f:	90                   	nop
  100620:	5d                   	pop    %ebp
  100621:	c3                   	ret    

00100622 <lapicinit>:

void
lapicinit(void)
{
  100622:	f3 0f 1e fb          	endbr32 
  100626:	55                   	push   %ebp
  100627:	89 e5                	mov    %esp,%ebp
  if(!lapic)
  100629:	a1 d0 64 10 00       	mov    0x1064d0,%eax
  10062e:	85 c0                	test   %eax,%eax
  100630:	0f 84 0c 01 00 00    	je     100742 <lapicinit+0x120>
    return;

  // Enable local APIC; set spurious interrupt vector.
  lapicw(SVR, ENABLE | (T_IRQ0 + IRQ_SPURIOUS));
  100636:	68 3f 01 00 00       	push   $0x13f
  10063b:	6a 3c                	push   $0x3c
  10063d:	e8 ba ff ff ff       	call   1005fc <lapicw>
  100642:	83 c4 08             	add    $0x8,%esp

  // The timer repeatedly counts down at bus frequency
  // from lapic[TICR] and then issues an interrupt.
  // If xv6 cared more about precise timekeeping,
  // TICR would be calibrated using an external time source.
  lapicw(TDCR, X1);
  100645:	6a 0b                	push   $0xb
  100647:	68 f8 00 00 00       	push   $0xf8
  10064c:	e8 ab ff ff ff       	call   1005fc <lapicw>
  100651:	83 c4 08             	add    $0x8,%esp
  lapicw(TIMER, PERIODIC | (T_IRQ0 + IRQ_TIMER));
  100654:	68 20 00 02 00       	push   $0x20020
  100659:	68 c8 00 00 00       	push   $0xc8
  10065e:	e8 99 ff ff ff       	call   1005fc <lapicw>
  100663:	83 c4 08             	add    $0x8,%esp
  lapicw(TICR, 10000000);
  100666:	68 80 96 98 00       	push   $0x989680
  10066b:	68 e0 00 00 00       	push   $0xe0
  100670:	e8 87 ff ff ff       	call   1005fc <lapicw>
  100675:	83 c4 08             	add    $0x8,%esp

  // Disable logical interrupt lines.
  lapicw(LINT0, MASKED);
  100678:	68 00 00 01 00       	push   $0x10000
  10067d:	68 d4 00 00 00       	push   $0xd4
  100682:	e8 75 ff ff ff       	call   1005fc <lapicw>
  100687:	83 c4 08             	add    $0x8,%esp
  lapicw(LINT1, MASKED);
  10068a:	68 00 00 01 00       	push   $0x10000
  10068f:	68 d8 00 00 00       	push   $0xd8
  100694:	e8 63 ff ff ff       	call   1005fc <lapicw>
  100699:	83 c4 08             	add    $0x8,%esp

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
  10069c:	a1 d0 64 10 00       	mov    0x1064d0,%eax
  1006a1:	83 c0 30             	add    $0x30,%eax
  1006a4:	8b 00                	mov    (%eax),%eax
  1006a6:	c1 e8 10             	shr    $0x10,%eax
  1006a9:	25 fc 00 00 00       	and    $0xfc,%eax
  1006ae:	85 c0                	test   %eax,%eax
  1006b0:	74 12                	je     1006c4 <lapicinit+0xa2>
    lapicw(PCINT, MASKED);
  1006b2:	68 00 00 01 00       	push   $0x10000
  1006b7:	68 d0 00 00 00       	push   $0xd0
  1006bc:	e8 3b ff ff ff       	call   1005fc <lapicw>
  1006c1:	83 c4 08             	add    $0x8,%esp

  // Map error interrupt to IRQ_ERROR.
  lapicw(ERROR, T_IRQ0 + IRQ_ERROR);
  1006c4:	6a 33                	push   $0x33
  1006c6:	68 dc 00 00 00       	push   $0xdc
  1006cb:	e8 2c ff ff ff       	call   1005fc <lapicw>
  1006d0:	83 c4 08             	add    $0x8,%esp

  // Clear error status register (requires back-to-back writes).
  lapicw(ESR, 0);
  1006d3:	6a 00                	push   $0x0
  1006d5:	68 a0 00 00 00       	push   $0xa0
  1006da:	e8 1d ff ff ff       	call   1005fc <lapicw>
  1006df:	83 c4 08             	add    $0x8,%esp
  lapicw(ESR, 0);
  1006e2:	6a 00                	push   $0x0
  1006e4:	68 a0 00 00 00       	push   $0xa0
  1006e9:	e8 0e ff ff ff       	call   1005fc <lapicw>
  1006ee:	83 c4 08             	add    $0x8,%esp

  // Ack any outstanding interrupts.
  lapicw(EOI, 0);
  1006f1:	6a 00                	push   $0x0
  1006f3:	6a 2c                	push   $0x2c
  1006f5:	e8 02 ff ff ff       	call   1005fc <lapicw>
  1006fa:	83 c4 08             	add    $0x8,%esp

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  1006fd:	6a 00                	push   $0x0
  1006ff:	68 c4 00 00 00       	push   $0xc4
  100704:	e8 f3 fe ff ff       	call   1005fc <lapicw>
  100709:	83 c4 08             	add    $0x8,%esp
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  10070c:	68 00 85 08 00       	push   $0x88500
  100711:	68 c0 00 00 00       	push   $0xc0
  100716:	e8 e1 fe ff ff       	call   1005fc <lapicw>
  10071b:	83 c4 08             	add    $0x8,%esp
  while(lapic[ICRLO] & DELIVS)
  10071e:	90                   	nop
  10071f:	a1 d0 64 10 00       	mov    0x1064d0,%eax
  100724:	05 00 03 00 00       	add    $0x300,%eax
  100729:	8b 00                	mov    (%eax),%eax
  10072b:	25 00 10 00 00       	and    $0x1000,%eax
  100730:	85 c0                	test   %eax,%eax
  100732:	75 eb                	jne    10071f <lapicinit+0xfd>
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
  100734:	6a 00                	push   $0x0
  100736:	6a 20                	push   $0x20
  100738:	e8 bf fe ff ff       	call   1005fc <lapicw>
  10073d:	83 c4 08             	add    $0x8,%esp
  100740:	eb 01                	jmp    100743 <lapicinit+0x121>
    return;
  100742:	90                   	nop
}
  100743:	c9                   	leave  
  100744:	c3                   	ret    

00100745 <lapicid>:

int
lapicid(void)
{
  100745:	f3 0f 1e fb          	endbr32 
  100749:	55                   	push   %ebp
  10074a:	89 e5                	mov    %esp,%ebp
  if (!lapic)
  10074c:	a1 d0 64 10 00       	mov    0x1064d0,%eax
  100751:	85 c0                	test   %eax,%eax
  100753:	75 07                	jne    10075c <lapicid+0x17>
    return 0;
  100755:	b8 00 00 00 00       	mov    $0x0,%eax
  10075a:	eb 0d                	jmp    100769 <lapicid+0x24>
  return lapic[ID] >> 24;
  10075c:	a1 d0 64 10 00       	mov    0x1064d0,%eax
  100761:	83 c0 20             	add    $0x20,%eax
  100764:	8b 00                	mov    (%eax),%eax
  100766:	c1 e8 18             	shr    $0x18,%eax
}
  100769:	5d                   	pop    %ebp
  10076a:	c3                   	ret    

0010076b <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  10076b:	f3 0f 1e fb          	endbr32 
  10076f:	55                   	push   %ebp
  100770:	89 e5                	mov    %esp,%ebp
  if(lapic)
  100772:	a1 d0 64 10 00       	mov    0x1064d0,%eax
  100777:	85 c0                	test   %eax,%eax
  100779:	74 0c                	je     100787 <lapiceoi+0x1c>
    lapicw(EOI, 0);
  10077b:	6a 00                	push   $0x0
  10077d:	6a 2c                	push   $0x2c
  10077f:	e8 78 fe ff ff       	call   1005fc <lapicw>
  100784:	83 c4 08             	add    $0x8,%esp
}
  100787:	90                   	nop
  100788:	c9                   	leave  
  100789:	c3                   	ret    

0010078a <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
  10078a:	f3 0f 1e fb          	endbr32 
  10078e:	55                   	push   %ebp
  10078f:	89 e5                	mov    %esp,%ebp
  100791:	90                   	nop
  100792:	5d                   	pop    %ebp
  100793:	c3                   	ret    

00100794 <sti>:


static inline void
sti(void)
{
  100794:	55                   	push   %ebp
  100795:	89 e5                	mov    %esp,%ebp
  asm volatile("sti");
  100797:	fb                   	sti    
}
  100798:	90                   	nop
  100799:	5d                   	pop    %ebp
  10079a:	c3                   	ret    

0010079b <wfi>:

static inline void
wfi(void)
{
  10079b:	55                   	push   %ebp
  10079c:	89 e5                	mov    %esp,%ebp
  asm volatile("hlt");
  10079e:	f4                   	hlt    
}
  10079f:	90                   	nop
  1007a0:	5d                   	pop    %ebp
  1007a1:	c3                   	ret    

001007a2 <log_test>:
#include "fcntl.h"
#include "logflag.h"

extern char end[]; // first address after kernel loaded from ELF file
static inline void 
log_test(void) {
  1007a2:	55                   	push   %ebp
  1007a3:	89 e5                	mov    %esp,%ebp
  1007a5:	81 ec 18 02 00 00    	sub    $0x218,%esp
  struct file* gtxt;
  int n;
  char buffer[512];

  if((gtxt=open("/hello.txt", O_RDONLY)) == 0) {
  1007ab:	83 ec 08             	sub    $0x8,%esp
  1007ae:	6a 00                	push   $0x0
  1007b0:	68 50 43 10 00       	push   $0x104350
  1007b5:	e8 5d 35 00 00       	call   103d17 <open>
  1007ba:	83 c4 10             	add    $0x10,%esp
  1007bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1007c0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1007c4:	75 0d                	jne    1007d3 <log_test+0x31>
    panic("Unable to open /hello.txt");
  1007c6:	83 ec 0c             	sub    $0xc,%esp
  1007c9:	68 5b 43 10 00       	push   $0x10435b
  1007ce:	e8 e6 fa ff ff       	call   1002b9 <panic>
  } 

  n = fileread(gtxt, buffer, 5);
  1007d3:	83 ec 04             	sub    $0x4,%esp
  1007d6:	6a 05                	push   $0x5
  1007d8:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  1007de:	50                   	push   %eax
  1007df:	ff 75 f4             	pushl  -0xc(%ebp)
  1007e2:	e8 a5 2f 00 00       	call   10378c <fileread>
  1007e7:	83 c4 10             	add    $0x10,%esp
  1007ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cprintf("[UNDOLOG] READ: %d %s\n", n, buffer);
  1007ed:	83 ec 04             	sub    $0x4,%esp
  1007f0:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  1007f6:	50                   	push   %eax
  1007f7:	ff 75 f0             	pushl  -0x10(%ebp)
  1007fa:	68 75 43 10 00       	push   $0x104375
  1007ff:	e8 ec f8 ff ff       	call   1000f0 <cprintf>
  100804:	83 c4 10             	add    $0x10,%esp
  fileclose(gtxt);
  100807:	83 ec 0c             	sub    $0xc,%esp
  10080a:	ff 75 f4             	pushl  -0xc(%ebp)
  10080d:	e8 9e 2e 00 00       	call   1036b0 <fileclose>
  100812:	83 c4 10             	add    $0x10,%esp

  buffer[0] = '0' + PANIC_1;
  100815:	c6 85 f0 fd ff ff 30 	movb   $0x30,-0x210(%ebp)
  buffer[1] = '0' + PANIC_2;
  10081c:	c6 85 f1 fd ff ff 30 	movb   $0x30,-0x20f(%ebp)
  buffer[2] = '0' + PANIC_3;
  100823:	c6 85 f2 fd ff ff 30 	movb   $0x30,-0x20e(%ebp)
  buffer[3] = '0' + PANIC_4;
  10082a:	c6 85 f3 fd ff ff 30 	movb   $0x30,-0x20d(%ebp)
  buffer[4] = '0' + PANIC_5;
  100831:	c6 85 f4 fd ff ff 30 	movb   $0x30,-0x20c(%ebp)

  // Open for writing 
  if((gtxt = open("/hello.txt", O_WRONLY)) == 0){
  100838:	83 ec 08             	sub    $0x8,%esp
  10083b:	6a 01                	push   $0x1
  10083d:	68 50 43 10 00       	push   $0x104350
  100842:	e8 d0 34 00 00       	call   103d17 <open>
  100847:	83 c4 10             	add    $0x10,%esp
  10084a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10084d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100851:	75 0d                	jne    100860 <log_test+0xbe>
    panic("Failed to create /foo/hello.txt");
  100853:	83 ec 0c             	sub    $0xc,%esp
  100856:	68 8c 43 10 00       	push   $0x10438c
  10085b:	e8 59 fa ff ff       	call   1002b9 <panic>
  }  
  n = filewrite(gtxt, buffer, 5);
  100860:	83 ec 04             	sub    $0x4,%esp
  100863:	6a 05                	push   $0x5
  100865:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  10086b:	50                   	push   %eax
  10086c:	ff 75 f4             	pushl  -0xc(%ebp)
  10086f:	e8 9b 2f 00 00       	call   10380f <filewrite>
  100874:	83 c4 10             	add    $0x10,%esp
  100877:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cprintf("[UNDOLOG] WRITE: %d %s\n", n, buffer);
  10087a:	83 ec 04             	sub    $0x4,%esp
  10087d:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  100883:	50                   	push   %eax
  100884:	ff 75 f0             	pushl  -0x10(%ebp)
  100887:	68 ac 43 10 00       	push   $0x1043ac
  10088c:	e8 5f f8 ff ff       	call   1000f0 <cprintf>
  100891:	83 c4 10             	add    $0x10,%esp
  fileclose(gtxt);
  100894:	83 ec 0c             	sub    $0xc,%esp
  100897:	ff 75 f4             	pushl  -0xc(%ebp)
  10089a:	e8 11 2e 00 00       	call   1036b0 <fileclose>
  10089f:	83 c4 10             	add    $0x10,%esp
}
  1008a2:	90                   	nop
  1008a3:	c9                   	leave  
  1008a4:	c3                   	ret    

001008a5 <main>:

// Bootstrap processor starts running C code here.
int
main(int argc, char* argv[])
{
  1008a5:	f3 0f 1e fb          	endbr32 
  1008a9:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  1008ad:	83 e4 f0             	and    $0xfffffff0,%esp
  1008b0:	ff 71 fc             	pushl  -0x4(%ecx)
  1008b3:	55                   	push   %ebp
  1008b4:	89 e5                	mov    %esp,%ebp
  1008b6:	51                   	push   %ecx
  1008b7:	83 ec 04             	sub    $0x4,%esp
  mpinit();        // detect other processors
  1008ba:	e8 95 02 00 00       	call   100b54 <mpinit>
  lapicinit();     // interrupt controller
  1008bf:	e8 5e fd ff ff       	call   100622 <lapicinit>
  picinit();       // disable pic
  1008c4:	e8 ed 03 00 00       	call   100cb6 <picinit>
  ioapicinit();    // another interrupt controller
  1008c9:	e8 41 fc ff ff       	call   10050f <ioapicinit>
  uartinit();      // serial port
  1008ce:	e8 4c 04 00 00       	call   100d1f <uartinit>
  ideinit();       // disk 
  1008d3:	e8 e5 1a 00 00       	call   1023bd <ideinit>
  tvinit();        // trap vectors
  1008d8:	e8 1d 0a 00 00       	call   1012fa <tvinit>
  binit();         // buffer cache
  1008dd:	e8 c5 17 00 00       	call   1020a7 <binit>
  idtinit();       // load idt register
  1008e2:	e8 fd 0a 00 00       	call   1013e4 <idtinit>
  sti();           // enable interrupts
  1008e7:	e8 a8 fe ff ff       	call   100794 <sti>
  iinit(ROOTDEV);  // Read superblock to start reading inodes
  1008ec:	83 ec 0c             	sub    $0xc,%esp
  1008ef:	6a 01                	push   $0x1
  1008f1:	e8 da 20 00 00       	call   1029d0 <iinit>
  1008f6:	83 c4 10             	add    $0x10,%esp
  initlog(ROOTDEV);  // Initialize log
  1008f9:	83 ec 0c             	sub    $0xc,%esp
  1008fc:	6a 01                	push   $0x1
  1008fe:	e8 94 35 00 00       	call   103e97 <initlog>
  100903:	83 c4 10             	add    $0x10,%esp
  log_test();
  100906:	e8 97 fe ff ff       	call   1007a2 <log_test>
  for(;;)
    wfi();
  10090b:	e8 8b fe ff ff       	call   10079b <wfi>
  100910:	eb f9                	jmp    10090b <main+0x66>

00100912 <inb>:
{
  100912:	55                   	push   %ebp
  100913:	89 e5                	mov    %esp,%ebp
  100915:	83 ec 14             	sub    $0x14,%esp
  100918:	8b 45 08             	mov    0x8(%ebp),%eax
  10091b:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  10091f:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  100923:	89 c2                	mov    %eax,%edx
  100925:	ec                   	in     (%dx),%al
  100926:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
  100929:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
  10092d:	c9                   	leave  
  10092e:	c3                   	ret    

0010092f <outb>:
{
  10092f:	55                   	push   %ebp
  100930:	89 e5                	mov    %esp,%ebp
  100932:	83 ec 08             	sub    $0x8,%esp
  100935:	8b 45 08             	mov    0x8(%ebp),%eax
  100938:	8b 55 0c             	mov    0xc(%ebp),%edx
  10093b:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  10093f:	89 d0                	mov    %edx,%eax
  100941:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  100944:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100948:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  10094c:	ee                   	out    %al,(%dx)
}
  10094d:	90                   	nop
  10094e:	c9                   	leave  
  10094f:	c3                   	ret    

00100950 <sum>:
int ncpu;
uchar ioapicid;

static uchar
sum(uchar *addr, int len)
{
  100950:	f3 0f 1e fb          	endbr32 
  100954:	55                   	push   %ebp
  100955:	89 e5                	mov    %esp,%ebp
  100957:	83 ec 10             	sub    $0x10,%esp
  int i, sum;

  sum = 0;
  10095a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  for(i=0; i<len; i++)
  100961:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100968:	eb 15                	jmp    10097f <sum+0x2f>
    sum += addr[i];
  10096a:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10096d:	8b 45 08             	mov    0x8(%ebp),%eax
  100970:	01 d0                	add    %edx,%eax
  100972:	0f b6 00             	movzbl (%eax),%eax
  100975:	0f b6 c0             	movzbl %al,%eax
  100978:	01 45 f8             	add    %eax,-0x8(%ebp)
  for(i=0; i<len; i++)
  10097b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10097f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100982:	3b 45 0c             	cmp    0xc(%ebp),%eax
  100985:	7c e3                	jl     10096a <sum+0x1a>
  return sum;
  100987:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  10098a:	c9                   	leave  
  10098b:	c3                   	ret    

0010098c <mpsearch1>:

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
  10098c:	f3 0f 1e fb          	endbr32 
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
  100993:	83 ec 18             	sub    $0x18,%esp
  uchar *e, *p, *addr;

  // addr = P2V(a);
  addr = (uchar*) a;
  100996:	8b 45 08             	mov    0x8(%ebp),%eax
  100999:	89 45 f0             	mov    %eax,-0x10(%ebp)
  e = addr+len;
  10099c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10099f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009a2:	01 d0                	add    %edx,%eax
  1009a4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  for(p = addr; p < e; p += sizeof(struct mp))
  1009a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1009ad:	eb 36                	jmp    1009e5 <mpsearch1+0x59>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
  1009af:	83 ec 04             	sub    $0x4,%esp
  1009b2:	6a 04                	push   $0x4
  1009b4:	68 c4 43 10 00       	push   $0x1043c4
  1009b9:	ff 75 f4             	pushl  -0xc(%ebp)
  1009bc:	e8 ba 05 00 00       	call   100f7b <memcmp>
  1009c1:	83 c4 10             	add    $0x10,%esp
  1009c4:	85 c0                	test   %eax,%eax
  1009c6:	75 19                	jne    1009e1 <mpsearch1+0x55>
  1009c8:	83 ec 08             	sub    $0x8,%esp
  1009cb:	6a 10                	push   $0x10
  1009cd:	ff 75 f4             	pushl  -0xc(%ebp)
  1009d0:	e8 7b ff ff ff       	call   100950 <sum>
  1009d5:	83 c4 10             	add    $0x10,%esp
  1009d8:	84 c0                	test   %al,%al
  1009da:	75 05                	jne    1009e1 <mpsearch1+0x55>
      return (struct mp*)p;
  1009dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009df:	eb 11                	jmp    1009f2 <mpsearch1+0x66>
  for(p = addr; p < e; p += sizeof(struct mp))
  1009e1:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
  1009e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009e8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1009eb:	72 c2                	jb     1009af <mpsearch1+0x23>
  return 0;
  1009ed:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1009f2:	c9                   	leave  
  1009f3:	c3                   	ret    

001009f4 <mpsearch>:
// 1) in the first KB of the EBDA;
// 2) in the last KB of system base memory;
// 3) in the BIOS ROM between 0xE0000 and 0xFFFFF.
static struct mp*
mpsearch(void)
{
  1009f4:	f3 0f 1e fb          	endbr32 
  1009f8:	55                   	push   %ebp
  1009f9:	89 e5                	mov    %esp,%ebp
  1009fb:	83 ec 18             	sub    $0x18,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  // bda = (uchar *) P2V(0x400);
  bda = (uchar *) 0x400;
  1009fe:	c7 45 f4 00 04 00 00 	movl   $0x400,-0xc(%ebp)
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
  100a05:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a08:	83 c0 0f             	add    $0xf,%eax
  100a0b:	0f b6 00             	movzbl (%eax),%eax
  100a0e:	0f b6 c0             	movzbl %al,%eax
  100a11:	c1 e0 08             	shl    $0x8,%eax
  100a14:	89 c2                	mov    %eax,%edx
  100a16:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a19:	83 c0 0e             	add    $0xe,%eax
  100a1c:	0f b6 00             	movzbl (%eax),%eax
  100a1f:	0f b6 c0             	movzbl %al,%eax
  100a22:	09 d0                	or     %edx,%eax
  100a24:	c1 e0 04             	shl    $0x4,%eax
  100a27:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100a2a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100a2e:	74 21                	je     100a51 <mpsearch+0x5d>
    if((mp = mpsearch1(p, 1024)))
  100a30:	83 ec 08             	sub    $0x8,%esp
  100a33:	68 00 04 00 00       	push   $0x400
  100a38:	ff 75 f0             	pushl  -0x10(%ebp)
  100a3b:	e8 4c ff ff ff       	call   10098c <mpsearch1>
  100a40:	83 c4 10             	add    $0x10,%esp
  100a43:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100a46:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100a4a:	74 51                	je     100a9d <mpsearch+0xa9>
      return mp;
  100a4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a4f:	eb 61                	jmp    100ab2 <mpsearch+0xbe>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
  100a51:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a54:	83 c0 14             	add    $0x14,%eax
  100a57:	0f b6 00             	movzbl (%eax),%eax
  100a5a:	0f b6 c0             	movzbl %al,%eax
  100a5d:	c1 e0 08             	shl    $0x8,%eax
  100a60:	89 c2                	mov    %eax,%edx
  100a62:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a65:	83 c0 13             	add    $0x13,%eax
  100a68:	0f b6 00             	movzbl (%eax),%eax
  100a6b:	0f b6 c0             	movzbl %al,%eax
  100a6e:	09 d0                	or     %edx,%eax
  100a70:	c1 e0 0a             	shl    $0xa,%eax
  100a73:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((mp = mpsearch1(p-1024, 1024)))
  100a76:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a79:	2d 00 04 00 00       	sub    $0x400,%eax
  100a7e:	83 ec 08             	sub    $0x8,%esp
  100a81:	68 00 04 00 00       	push   $0x400
  100a86:	50                   	push   %eax
  100a87:	e8 00 ff ff ff       	call   10098c <mpsearch1>
  100a8c:	83 c4 10             	add    $0x10,%esp
  100a8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100a92:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100a96:	74 05                	je     100a9d <mpsearch+0xa9>
      return mp;
  100a98:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a9b:	eb 15                	jmp    100ab2 <mpsearch+0xbe>
  }
  return mpsearch1(0xF0000, 0x10000);
  100a9d:	83 ec 08             	sub    $0x8,%esp
  100aa0:	68 00 00 01 00       	push   $0x10000
  100aa5:	68 00 00 0f 00       	push   $0xf0000
  100aaa:	e8 dd fe ff ff       	call   10098c <mpsearch1>
  100aaf:	83 c4 10             	add    $0x10,%esp
}
  100ab2:	c9                   	leave  
  100ab3:	c3                   	ret    

00100ab4 <mpconfig>:
// Check for correct signature, calculate the checksum and,
// if correct, check the version.
// To do: check extended table checksum.
static struct mpconf*
mpconfig(struct mp **pmp)
{
  100ab4:	f3 0f 1e fb          	endbr32 
  100ab8:	55                   	push   %ebp
  100ab9:	89 e5                	mov    %esp,%ebp
  100abb:	83 ec 18             	sub    $0x18,%esp
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
  100abe:	e8 31 ff ff ff       	call   1009f4 <mpsearch>
  100ac3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ac6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100aca:	74 0a                	je     100ad6 <mpconfig+0x22>
  100acc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100acf:	8b 40 04             	mov    0x4(%eax),%eax
  100ad2:	85 c0                	test   %eax,%eax
  100ad4:	75 07                	jne    100add <mpconfig+0x29>
    return 0;
  100ad6:	b8 00 00 00 00       	mov    $0x0,%eax
  100adb:	eb 75                	jmp    100b52 <mpconfig+0x9e>
  // conf = (struct mpconf*) P2V((uint) mp->physaddr);
  conf = (struct mpconf*) (uint) mp->physaddr;
  100add:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ae0:	8b 40 04             	mov    0x4(%eax),%eax
  100ae3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
  100ae6:	83 ec 04             	sub    $0x4,%esp
  100ae9:	6a 04                	push   $0x4
  100aeb:	68 c9 43 10 00       	push   $0x1043c9
  100af0:	ff 75 f0             	pushl  -0x10(%ebp)
  100af3:	e8 83 04 00 00       	call   100f7b <memcmp>
  100af8:	83 c4 10             	add    $0x10,%esp
  100afb:	85 c0                	test   %eax,%eax
  100afd:	74 07                	je     100b06 <mpconfig+0x52>
    return 0;
  100aff:	b8 00 00 00 00       	mov    $0x0,%eax
  100b04:	eb 4c                	jmp    100b52 <mpconfig+0x9e>
  if(conf->version != 1 && conf->version != 4)
  100b06:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b09:	0f b6 40 06          	movzbl 0x6(%eax),%eax
  100b0d:	3c 01                	cmp    $0x1,%al
  100b0f:	74 12                	je     100b23 <mpconfig+0x6f>
  100b11:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b14:	0f b6 40 06          	movzbl 0x6(%eax),%eax
  100b18:	3c 04                	cmp    $0x4,%al
  100b1a:	74 07                	je     100b23 <mpconfig+0x6f>
    return 0;
  100b1c:	b8 00 00 00 00       	mov    $0x0,%eax
  100b21:	eb 2f                	jmp    100b52 <mpconfig+0x9e>
  if(sum((uchar*)conf, conf->length) != 0)
  100b23:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b26:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100b2a:	0f b7 c0             	movzwl %ax,%eax
  100b2d:	83 ec 08             	sub    $0x8,%esp
  100b30:	50                   	push   %eax
  100b31:	ff 75 f0             	pushl  -0x10(%ebp)
  100b34:	e8 17 fe ff ff       	call   100950 <sum>
  100b39:	83 c4 10             	add    $0x10,%esp
  100b3c:	84 c0                	test   %al,%al
  100b3e:	74 07                	je     100b47 <mpconfig+0x93>
    return 0;
  100b40:	b8 00 00 00 00       	mov    $0x0,%eax
  100b45:	eb 0b                	jmp    100b52 <mpconfig+0x9e>
  *pmp = mp;
  100b47:	8b 45 08             	mov    0x8(%ebp),%eax
  100b4a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b4d:	89 10                	mov    %edx,(%eax)
  return conf;
  100b4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100b52:	c9                   	leave  
  100b53:	c3                   	ret    

00100b54 <mpinit>:

void
mpinit(void)
{
  100b54:	f3 0f 1e fb          	endbr32 
  100b58:	55                   	push   %ebp
  100b59:	89 e5                	mov    %esp,%ebp
  100b5b:	83 ec 28             	sub    $0x28,%esp
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
  100b5e:	83 ec 0c             	sub    $0xc,%esp
  100b61:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100b64:	50                   	push   %eax
  100b65:	e8 4a ff ff ff       	call   100ab4 <mpconfig>
  100b6a:	83 c4 10             	add    $0x10,%esp
  100b6d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100b70:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100b74:	75 0d                	jne    100b83 <mpinit+0x2f>
    panic("Expect to run on an SMP");
  100b76:	83 ec 0c             	sub    $0xc,%esp
  100b79:	68 ce 43 10 00       	push   $0x1043ce
  100b7e:	e8 36 f7 ff ff       	call   1002b9 <panic>
  ismp = 1;
  100b83:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  lapic = (uint*)conf->lapicaddr;
  100b8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100b8d:	8b 40 24             	mov    0x24(%eax),%eax
  100b90:	a3 d0 64 10 00       	mov    %eax,0x1064d0
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
  100b95:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100b98:	83 c0 2c             	add    $0x2c,%eax
  100b9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100b9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100ba1:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100ba5:	0f b7 d0             	movzwl %ax,%edx
  100ba8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bab:	01 d0                	add    %edx,%eax
  100bad:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100bb0:	e9 83 00 00 00       	jmp    100c38 <mpinit+0xe4>
    switch(*p){
  100bb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bb8:	0f b6 00             	movzbl (%eax),%eax
  100bbb:	0f b6 c0             	movzbl %al,%eax
  100bbe:	83 f8 04             	cmp    $0x4,%eax
  100bc1:	7f 6d                	jg     100c30 <mpinit+0xdc>
  100bc3:	83 f8 03             	cmp    $0x3,%eax
  100bc6:	7d 62                	jge    100c2a <mpinit+0xd6>
  100bc8:	83 f8 02             	cmp    $0x2,%eax
  100bcb:	74 45                	je     100c12 <mpinit+0xbe>
  100bcd:	83 f8 02             	cmp    $0x2,%eax
  100bd0:	7f 5e                	jg     100c30 <mpinit+0xdc>
  100bd2:	85 c0                	test   %eax,%eax
  100bd4:	74 07                	je     100bdd <mpinit+0x89>
  100bd6:	83 f8 01             	cmp    $0x1,%eax
  100bd9:	74 4f                	je     100c2a <mpinit+0xd6>
  100bdb:	eb 53                	jmp    100c30 <mpinit+0xdc>
    case MPPROC:
      proc = (struct mpproc*)p;
  100bdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100be0:	89 45 e0             	mov    %eax,-0x20(%ebp)
      if(ncpu < NCPU) {
  100be3:	a1 e0 64 10 00       	mov    0x1064e0,%eax
  100be8:	83 f8 07             	cmp    $0x7,%eax
  100beb:	7f 1f                	jg     100c0c <mpinit+0xb8>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
  100bed:	a1 e0 64 10 00       	mov    0x1064e0,%eax
  100bf2:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100bf5:	0f b6 52 01          	movzbl 0x1(%edx),%edx
  100bf9:	88 90 d8 64 10 00    	mov    %dl,0x1064d8(%eax)
        ncpu++;
  100bff:	a1 e0 64 10 00       	mov    0x1064e0,%eax
  100c04:	83 c0 01             	add    $0x1,%eax
  100c07:	a3 e0 64 10 00       	mov    %eax,0x1064e0
      }
      p += sizeof(struct mpproc);
  100c0c:	83 45 f4 14          	addl   $0x14,-0xc(%ebp)
      continue;
  100c10:	eb 26                	jmp    100c38 <mpinit+0xe4>
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
  100c12:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      ioapicid = ioapic->apicno;
  100c18:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100c1b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  100c1f:	a2 d4 64 10 00       	mov    %al,0x1064d4
      p += sizeof(struct mpioapic);
  100c24:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
      continue;
  100c28:	eb 0e                	jmp    100c38 <mpinit+0xe4>
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
  100c2a:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
      continue;
  100c2e:	eb 08                	jmp    100c38 <mpinit+0xe4>
    default:
      ismp = 0;
  100c30:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      break;
  100c37:	90                   	nop
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
  100c38:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c3b:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  100c3e:	0f 82 71 ff ff ff    	jb     100bb5 <mpinit+0x61>
    }
  }
  if(!ismp)
  100c44:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c48:	75 0d                	jne    100c57 <mpinit+0x103>
    panic("Didn't find a suitable machine");
  100c4a:	83 ec 0c             	sub    $0xc,%esp
  100c4d:	68 e8 43 10 00       	push   $0x1043e8
  100c52:	e8 62 f6 ff ff       	call   1002b9 <panic>

  if(mp->imcrp){
  100c57:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100c5a:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
  100c5e:	84 c0                	test   %al,%al
  100c60:	74 30                	je     100c92 <mpinit+0x13e>
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
  100c62:	83 ec 08             	sub    $0x8,%esp
  100c65:	6a 70                	push   $0x70
  100c67:	6a 22                	push   $0x22
  100c69:	e8 c1 fc ff ff       	call   10092f <outb>
  100c6e:	83 c4 10             	add    $0x10,%esp
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  100c71:	83 ec 0c             	sub    $0xc,%esp
  100c74:	6a 23                	push   $0x23
  100c76:	e8 97 fc ff ff       	call   100912 <inb>
  100c7b:	83 c4 10             	add    $0x10,%esp
  100c7e:	83 c8 01             	or     $0x1,%eax
  100c81:	0f b6 c0             	movzbl %al,%eax
  100c84:	83 ec 08             	sub    $0x8,%esp
  100c87:	50                   	push   %eax
  100c88:	6a 23                	push   $0x23
  100c8a:	e8 a0 fc ff ff       	call   10092f <outb>
  100c8f:	83 c4 10             	add    $0x10,%esp
  }
}
  100c92:	90                   	nop
  100c93:	c9                   	leave  
  100c94:	c3                   	ret    

00100c95 <outb>:
{
  100c95:	55                   	push   %ebp
  100c96:	89 e5                	mov    %esp,%ebp
  100c98:	83 ec 08             	sub    $0x8,%esp
  100c9b:	8b 45 08             	mov    0x8(%ebp),%eax
  100c9e:	8b 55 0c             	mov    0xc(%ebp),%edx
  100ca1:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  100ca5:	89 d0                	mov    %edx,%eax
  100ca7:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  100caa:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100cae:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100cb2:	ee                   	out    %al,(%dx)
}
  100cb3:	90                   	nop
  100cb4:	c9                   	leave  
  100cb5:	c3                   	ret    

00100cb6 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
  100cb6:	f3 0f 1e fb          	endbr32 
  100cba:	55                   	push   %ebp
  100cbb:	89 e5                	mov    %esp,%ebp
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  100cbd:	68 ff 00 00 00       	push   $0xff
  100cc2:	6a 21                	push   $0x21
  100cc4:	e8 cc ff ff ff       	call   100c95 <outb>
  100cc9:	83 c4 08             	add    $0x8,%esp
  outb(IO_PIC2+1, 0xFF);
  100ccc:	68 ff 00 00 00       	push   $0xff
  100cd1:	68 a1 00 00 00       	push   $0xa1
  100cd6:	e8 ba ff ff ff       	call   100c95 <outb>
  100cdb:	83 c4 08             	add    $0x8,%esp
  100cde:	90                   	nop
  100cdf:	c9                   	leave  
  100ce0:	c3                   	ret    

00100ce1 <inb>:
{
  100ce1:	55                   	push   %ebp
  100ce2:	89 e5                	mov    %esp,%ebp
  100ce4:	83 ec 14             	sub    $0x14,%esp
  100ce7:	8b 45 08             	mov    0x8(%ebp),%eax
  100cea:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  100cee:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  100cf2:	89 c2                	mov    %eax,%edx
  100cf4:	ec                   	in     (%dx),%al
  100cf5:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
  100cf8:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
  100cfc:	c9                   	leave  
  100cfd:	c3                   	ret    

00100cfe <outb>:
{
  100cfe:	55                   	push   %ebp
  100cff:	89 e5                	mov    %esp,%ebp
  100d01:	83 ec 08             	sub    $0x8,%esp
  100d04:	8b 45 08             	mov    0x8(%ebp),%eax
  100d07:	8b 55 0c             	mov    0xc(%ebp),%edx
  100d0a:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  100d0e:	89 d0                	mov    %edx,%eax
  100d10:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  100d13:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100d17:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100d1b:	ee                   	out    %al,(%dx)
}
  100d1c:	90                   	nop
  100d1d:	c9                   	leave  
  100d1e:	c3                   	ret    

00100d1f <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
  100d1f:	f3 0f 1e fb          	endbr32 
  100d23:	55                   	push   %ebp
  100d24:	89 e5                	mov    %esp,%ebp
  100d26:	83 ec 18             	sub    $0x18,%esp
  char *p;

  // Turn off the FIFO
  outb(COM1+2, 0);
  100d29:	6a 00                	push   $0x0
  100d2b:	68 fa 03 00 00       	push   $0x3fa
  100d30:	e8 c9 ff ff ff       	call   100cfe <outb>
  100d35:	83 c4 08             	add    $0x8,%esp

  // 9600 baud, 8 data bits, 1 stop bit, parity off.
  outb(COM1+3, 0x80);    // Unlock divisor
  100d38:	68 80 00 00 00       	push   $0x80
  100d3d:	68 fb 03 00 00       	push   $0x3fb
  100d42:	e8 b7 ff ff ff       	call   100cfe <outb>
  100d47:	83 c4 08             	add    $0x8,%esp
  outb(COM1+0, 115200/9600);
  100d4a:	6a 0c                	push   $0xc
  100d4c:	68 f8 03 00 00       	push   $0x3f8
  100d51:	e8 a8 ff ff ff       	call   100cfe <outb>
  100d56:	83 c4 08             	add    $0x8,%esp
  outb(COM1+1, 0);
  100d59:	6a 00                	push   $0x0
  100d5b:	68 f9 03 00 00       	push   $0x3f9
  100d60:	e8 99 ff ff ff       	call   100cfe <outb>
  100d65:	83 c4 08             	add    $0x8,%esp
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  100d68:	6a 03                	push   $0x3
  100d6a:	68 fb 03 00 00       	push   $0x3fb
  100d6f:	e8 8a ff ff ff       	call   100cfe <outb>
  100d74:	83 c4 08             	add    $0x8,%esp
  outb(COM1+4, 0);
  100d77:	6a 00                	push   $0x0
  100d79:	68 fc 03 00 00       	push   $0x3fc
  100d7e:	e8 7b ff ff ff       	call   100cfe <outb>
  100d83:	83 c4 08             	add    $0x8,%esp
  outb(COM1+1, 0x01);    // Enable receive interrupts.
  100d86:	6a 01                	push   $0x1
  100d88:	68 f9 03 00 00       	push   $0x3f9
  100d8d:	e8 6c ff ff ff       	call   100cfe <outb>
  100d92:	83 c4 08             	add    $0x8,%esp

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
  100d95:	68 fd 03 00 00       	push   $0x3fd
  100d9a:	e8 42 ff ff ff       	call   100ce1 <inb>
  100d9f:	83 c4 04             	add    $0x4,%esp
  100da2:	3c ff                	cmp    $0xff,%al
  100da4:	74 61                	je     100e07 <uartinit+0xe8>
    return;
  uart = 1;
  100da6:	c7 05 24 54 10 00 01 	movl   $0x1,0x105424
  100dad:	00 00 00 

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  100db0:	68 fa 03 00 00       	push   $0x3fa
  100db5:	e8 27 ff ff ff       	call   100ce1 <inb>
  100dba:	83 c4 04             	add    $0x4,%esp
  inb(COM1+0);
  100dbd:	68 f8 03 00 00       	push   $0x3f8
  100dc2:	e8 1a ff ff ff       	call   100ce1 <inb>
  100dc7:	83 c4 04             	add    $0x4,%esp
  ioapicenable(IRQ_COM1, 0);
  100dca:	83 ec 08             	sub    $0x8,%esp
  100dcd:	6a 00                	push   $0x0
  100dcf:	6a 04                	push   $0x4
  100dd1:	e8 e5 f7 ff ff       	call   1005bb <ioapicenable>
  100dd6:	83 c4 10             	add    $0x10,%esp

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
  100dd9:	c7 45 f4 07 44 10 00 	movl   $0x104407,-0xc(%ebp)
  100de0:	eb 19                	jmp    100dfb <uartinit+0xdc>
    uartputc(*p);
  100de2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100de5:	0f b6 00             	movzbl (%eax),%eax
  100de8:	0f be c0             	movsbl %al,%eax
  100deb:	83 ec 0c             	sub    $0xc,%esp
  100dee:	50                   	push   %eax
  100def:	e8 16 00 00 00       	call   100e0a <uartputc>
  100df4:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
  100df7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100dfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dfe:	0f b6 00             	movzbl (%eax),%eax
  100e01:	84 c0                	test   %al,%al
  100e03:	75 dd                	jne    100de2 <uartinit+0xc3>
  100e05:	eb 01                	jmp    100e08 <uartinit+0xe9>
    return;
  100e07:	90                   	nop
}
  100e08:	c9                   	leave  
  100e09:	c3                   	ret    

00100e0a <uartputc>:

void
uartputc(int c)
{
  100e0a:	f3 0f 1e fb          	endbr32 
  100e0e:	55                   	push   %ebp
  100e0f:	89 e5                	mov    %esp,%ebp
  100e11:	83 ec 10             	sub    $0x10,%esp
  int i;

  if(!uart)
  100e14:	a1 24 54 10 00       	mov    0x105424,%eax
  100e19:	85 c0                	test   %eax,%eax
  100e1b:	74 40                	je     100e5d <uartputc+0x53>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++);
  100e1d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100e24:	eb 04                	jmp    100e2a <uartputc+0x20>
  100e26:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100e2a:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  100e2e:	7f 17                	jg     100e47 <uartputc+0x3d>
  100e30:	68 fd 03 00 00       	push   $0x3fd
  100e35:	e8 a7 fe ff ff       	call   100ce1 <inb>
  100e3a:	83 c4 04             	add    $0x4,%esp
  100e3d:	0f b6 c0             	movzbl %al,%eax
  100e40:	83 e0 20             	and    $0x20,%eax
  100e43:	85 c0                	test   %eax,%eax
  100e45:	74 df                	je     100e26 <uartputc+0x1c>
  outb(COM1+0, c);
  100e47:	8b 45 08             	mov    0x8(%ebp),%eax
  100e4a:	0f b6 c0             	movzbl %al,%eax
  100e4d:	50                   	push   %eax
  100e4e:	68 f8 03 00 00       	push   $0x3f8
  100e53:	e8 a6 fe ff ff       	call   100cfe <outb>
  100e58:	83 c4 08             	add    $0x8,%esp
  100e5b:	eb 01                	jmp    100e5e <uartputc+0x54>
    return;
  100e5d:	90                   	nop
}
  100e5e:	c9                   	leave  
  100e5f:	c3                   	ret    

00100e60 <uartgetc>:


static int
uartgetc(void)
{
  100e60:	f3 0f 1e fb          	endbr32 
  100e64:	55                   	push   %ebp
  100e65:	89 e5                	mov    %esp,%ebp
  if(!uart)
  100e67:	a1 24 54 10 00       	mov    0x105424,%eax
  100e6c:	85 c0                	test   %eax,%eax
  100e6e:	75 07                	jne    100e77 <uartgetc+0x17>
    return -1;
  100e70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e75:	eb 2e                	jmp    100ea5 <uartgetc+0x45>
  if(!(inb(COM1+5) & 0x01))
  100e77:	68 fd 03 00 00       	push   $0x3fd
  100e7c:	e8 60 fe ff ff       	call   100ce1 <inb>
  100e81:	83 c4 04             	add    $0x4,%esp
  100e84:	0f b6 c0             	movzbl %al,%eax
  100e87:	83 e0 01             	and    $0x1,%eax
  100e8a:	85 c0                	test   %eax,%eax
  100e8c:	75 07                	jne    100e95 <uartgetc+0x35>
    return -1;
  100e8e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e93:	eb 10                	jmp    100ea5 <uartgetc+0x45>
  return inb(COM1+0);
  100e95:	68 f8 03 00 00       	push   $0x3f8
  100e9a:	e8 42 fe ff ff       	call   100ce1 <inb>
  100e9f:	83 c4 04             	add    $0x4,%esp
  100ea2:	0f b6 c0             	movzbl %al,%eax
}
  100ea5:	c9                   	leave  
  100ea6:	c3                   	ret    

00100ea7 <uartintr>:

void
uartintr(void)
{
  100ea7:	f3 0f 1e fb          	endbr32 
  100eab:	55                   	push   %ebp
  100eac:	89 e5                	mov    %esp,%ebp
  100eae:	83 ec 08             	sub    $0x8,%esp
  consoleintr(uartgetc);
  100eb1:	83 ec 0c             	sub    $0xc,%esp
  100eb4:	68 60 0e 10 00       	push   $0x100e60
  100eb9:	e8 d9 f4 ff ff       	call   100397 <consoleintr>
  100ebe:	83 c4 10             	add    $0x10,%esp
  100ec1:	90                   	nop
  100ec2:	c9                   	leave  
  100ec3:	c3                   	ret    

00100ec4 <stosb>:
{
  100ec4:	55                   	push   %ebp
  100ec5:	89 e5                	mov    %esp,%ebp
  100ec7:	57                   	push   %edi
  100ec8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  100ec9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100ecc:	8b 55 10             	mov    0x10(%ebp),%edx
  100ecf:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ed2:	89 cb                	mov    %ecx,%ebx
  100ed4:	89 df                	mov    %ebx,%edi
  100ed6:	89 d1                	mov    %edx,%ecx
  100ed8:	fc                   	cld    
  100ed9:	f3 aa                	rep stos %al,%es:(%edi)
  100edb:	89 ca                	mov    %ecx,%edx
  100edd:	89 fb                	mov    %edi,%ebx
  100edf:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100ee2:	89 55 10             	mov    %edx,0x10(%ebp)
}
  100ee5:	90                   	nop
  100ee6:	5b                   	pop    %ebx
  100ee7:	5f                   	pop    %edi
  100ee8:	5d                   	pop    %ebp
  100ee9:	c3                   	ret    

00100eea <stosl>:
{
  100eea:	55                   	push   %ebp
  100eeb:	89 e5                	mov    %esp,%ebp
  100eed:	57                   	push   %edi
  100eee:	53                   	push   %ebx
  asm volatile("cld; rep stosl" :
  100eef:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100ef2:	8b 55 10             	mov    0x10(%ebp),%edx
  100ef5:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ef8:	89 cb                	mov    %ecx,%ebx
  100efa:	89 df                	mov    %ebx,%edi
  100efc:	89 d1                	mov    %edx,%ecx
  100efe:	fc                   	cld    
  100eff:	f3 ab                	rep stos %eax,%es:(%edi)
  100f01:	89 ca                	mov    %ecx,%edx
  100f03:	89 fb                	mov    %edi,%ebx
  100f05:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100f08:	89 55 10             	mov    %edx,0x10(%ebp)
}
  100f0b:	90                   	nop
  100f0c:	5b                   	pop    %ebx
  100f0d:	5f                   	pop    %edi
  100f0e:	5d                   	pop    %ebp
  100f0f:	c3                   	ret    

00100f10 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
  100f10:	f3 0f 1e fb          	endbr32 
  100f14:	55                   	push   %ebp
  100f15:	89 e5                	mov    %esp,%ebp
  if ((int)dst%4 == 0 && n%4 == 0){
  100f17:	8b 45 08             	mov    0x8(%ebp),%eax
  100f1a:	83 e0 03             	and    $0x3,%eax
  100f1d:	85 c0                	test   %eax,%eax
  100f1f:	75 43                	jne    100f64 <memset+0x54>
  100f21:	8b 45 10             	mov    0x10(%ebp),%eax
  100f24:	83 e0 03             	and    $0x3,%eax
  100f27:	85 c0                	test   %eax,%eax
  100f29:	75 39                	jne    100f64 <memset+0x54>
    c &= 0xFF;
  100f2b:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  100f32:	8b 45 10             	mov    0x10(%ebp),%eax
  100f35:	c1 e8 02             	shr    $0x2,%eax
  100f38:	89 c1                	mov    %eax,%ecx
  100f3a:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f3d:	c1 e0 18             	shl    $0x18,%eax
  100f40:	89 c2                	mov    %eax,%edx
  100f42:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f45:	c1 e0 10             	shl    $0x10,%eax
  100f48:	09 c2                	or     %eax,%edx
  100f4a:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f4d:	c1 e0 08             	shl    $0x8,%eax
  100f50:	09 d0                	or     %edx,%eax
  100f52:	0b 45 0c             	or     0xc(%ebp),%eax
  100f55:	51                   	push   %ecx
  100f56:	50                   	push   %eax
  100f57:	ff 75 08             	pushl  0x8(%ebp)
  100f5a:	e8 8b ff ff ff       	call   100eea <stosl>
  100f5f:	83 c4 0c             	add    $0xc,%esp
  100f62:	eb 12                	jmp    100f76 <memset+0x66>
  } else
    stosb(dst, c, n);
  100f64:	8b 45 10             	mov    0x10(%ebp),%eax
  100f67:	50                   	push   %eax
  100f68:	ff 75 0c             	pushl  0xc(%ebp)
  100f6b:	ff 75 08             	pushl  0x8(%ebp)
  100f6e:	e8 51 ff ff ff       	call   100ec4 <stosb>
  100f73:	83 c4 0c             	add    $0xc,%esp
  return dst;
  100f76:	8b 45 08             	mov    0x8(%ebp),%eax
}
  100f79:	c9                   	leave  
  100f7a:	c3                   	ret    

00100f7b <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
  100f7b:	f3 0f 1e fb          	endbr32 
  100f7f:	55                   	push   %ebp
  100f80:	89 e5                	mov    %esp,%ebp
  100f82:	83 ec 10             	sub    $0x10,%esp
  const uchar *s1, *s2;

  s1 = v1;
  100f85:	8b 45 08             	mov    0x8(%ebp),%eax
  100f88:	89 45 fc             	mov    %eax,-0x4(%ebp)
  s2 = v2;
  100f8b:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f8e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0){
  100f91:	eb 30                	jmp    100fc3 <memcmp+0x48>
    if(*s1 != *s2)
  100f93:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f96:	0f b6 10             	movzbl (%eax),%edx
  100f99:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f9c:	0f b6 00             	movzbl (%eax),%eax
  100f9f:	38 c2                	cmp    %al,%dl
  100fa1:	74 18                	je     100fbb <memcmp+0x40>
      return *s1 - *s2;
  100fa3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100fa6:	0f b6 00             	movzbl (%eax),%eax
  100fa9:	0f b6 d0             	movzbl %al,%edx
  100fac:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100faf:	0f b6 00             	movzbl (%eax),%eax
  100fb2:	0f b6 c0             	movzbl %al,%eax
  100fb5:	29 c2                	sub    %eax,%edx
  100fb7:	89 d0                	mov    %edx,%eax
  100fb9:	eb 1a                	jmp    100fd5 <memcmp+0x5a>
    s1++, s2++;
  100fbb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fbf:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  while(n-- > 0){
  100fc3:	8b 45 10             	mov    0x10(%ebp),%eax
  100fc6:	8d 50 ff             	lea    -0x1(%eax),%edx
  100fc9:	89 55 10             	mov    %edx,0x10(%ebp)
  100fcc:	85 c0                	test   %eax,%eax
  100fce:	75 c3                	jne    100f93 <memcmp+0x18>
  }

  return 0;
  100fd0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100fd5:	c9                   	leave  
  100fd6:	c3                   	ret    

00100fd7 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
  100fd7:	f3 0f 1e fb          	endbr32 
  100fdb:	55                   	push   %ebp
  100fdc:	89 e5                	mov    %esp,%ebp
  100fde:	83 ec 10             	sub    $0x10,%esp
  const char *s;
  char *d;

  s = src;
  100fe1:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fe4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  d = dst;
  100fe7:	8b 45 08             	mov    0x8(%ebp),%eax
  100fea:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if(s < d && s + n > d){
  100fed:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ff0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100ff3:	73 54                	jae    101049 <memmove+0x72>
  100ff5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100ff8:	8b 45 10             	mov    0x10(%ebp),%eax
  100ffb:	01 d0                	add    %edx,%eax
  100ffd:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  101000:	73 47                	jae    101049 <memmove+0x72>
    s += n;
  101002:	8b 45 10             	mov    0x10(%ebp),%eax
  101005:	01 45 fc             	add    %eax,-0x4(%ebp)
    d += n;
  101008:	8b 45 10             	mov    0x10(%ebp),%eax
  10100b:	01 45 f8             	add    %eax,-0x8(%ebp)
    while(n-- > 0)
  10100e:	eb 13                	jmp    101023 <memmove+0x4c>
      *--d = *--s;
  101010:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  101014:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
  101018:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10101b:	0f b6 10             	movzbl (%eax),%edx
  10101e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101021:	88 10                	mov    %dl,(%eax)
    while(n-- > 0)
  101023:	8b 45 10             	mov    0x10(%ebp),%eax
  101026:	8d 50 ff             	lea    -0x1(%eax),%edx
  101029:	89 55 10             	mov    %edx,0x10(%ebp)
  10102c:	85 c0                	test   %eax,%eax
  10102e:	75 e0                	jne    101010 <memmove+0x39>
  if(s < d && s + n > d){
  101030:	eb 24                	jmp    101056 <memmove+0x7f>
  } else
    while(n-- > 0)
      *d++ = *s++;
  101032:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101035:	8d 42 01             	lea    0x1(%edx),%eax
  101038:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10103b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10103e:	8d 48 01             	lea    0x1(%eax),%ecx
  101041:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  101044:	0f b6 12             	movzbl (%edx),%edx
  101047:	88 10                	mov    %dl,(%eax)
    while(n-- > 0)
  101049:	8b 45 10             	mov    0x10(%ebp),%eax
  10104c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10104f:	89 55 10             	mov    %edx,0x10(%ebp)
  101052:	85 c0                	test   %eax,%eax
  101054:	75 dc                	jne    101032 <memmove+0x5b>

  return dst;
  101056:	8b 45 08             	mov    0x8(%ebp),%eax
}
  101059:	c9                   	leave  
  10105a:	c3                   	ret    

0010105b <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  10105b:	f3 0f 1e fb          	endbr32 
  10105f:	55                   	push   %ebp
  101060:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
  101062:	ff 75 10             	pushl  0x10(%ebp)
  101065:	ff 75 0c             	pushl  0xc(%ebp)
  101068:	ff 75 08             	pushl  0x8(%ebp)
  10106b:	e8 67 ff ff ff       	call   100fd7 <memmove>
  101070:	83 c4 0c             	add    $0xc,%esp
}
  101073:	c9                   	leave  
  101074:	c3                   	ret    

00101075 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
  101075:	f3 0f 1e fb          	endbr32 
  101079:	55                   	push   %ebp
  10107a:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
  10107c:	eb 0c                	jmp    10108a <strncmp+0x15>
    n--, p++, q++;
  10107e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  101082:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  101086:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(n > 0 && *p && *p == *q)
  10108a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10108e:	74 1a                	je     1010aa <strncmp+0x35>
  101090:	8b 45 08             	mov    0x8(%ebp),%eax
  101093:	0f b6 00             	movzbl (%eax),%eax
  101096:	84 c0                	test   %al,%al
  101098:	74 10                	je     1010aa <strncmp+0x35>
  10109a:	8b 45 08             	mov    0x8(%ebp),%eax
  10109d:	0f b6 10             	movzbl (%eax),%edx
  1010a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1010a3:	0f b6 00             	movzbl (%eax),%eax
  1010a6:	38 c2                	cmp    %al,%dl
  1010a8:	74 d4                	je     10107e <strncmp+0x9>
  if(n == 0)
  1010aa:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1010ae:	75 07                	jne    1010b7 <strncmp+0x42>
    return 0;
  1010b0:	b8 00 00 00 00       	mov    $0x0,%eax
  1010b5:	eb 16                	jmp    1010cd <strncmp+0x58>
  return (uchar)*p - (uchar)*q;
  1010b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1010ba:	0f b6 00             	movzbl (%eax),%eax
  1010bd:	0f b6 d0             	movzbl %al,%edx
  1010c0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1010c3:	0f b6 00             	movzbl (%eax),%eax
  1010c6:	0f b6 c0             	movzbl %al,%eax
  1010c9:	29 c2                	sub    %eax,%edx
  1010cb:	89 d0                	mov    %edx,%eax
}
  1010cd:	5d                   	pop    %ebp
  1010ce:	c3                   	ret    

001010cf <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
  1010cf:	f3 0f 1e fb          	endbr32 
  1010d3:	55                   	push   %ebp
  1010d4:	89 e5                	mov    %esp,%ebp
  1010d6:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  1010d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1010dc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
  1010df:	90                   	nop
  1010e0:	8b 45 10             	mov    0x10(%ebp),%eax
  1010e3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1010e6:	89 55 10             	mov    %edx,0x10(%ebp)
  1010e9:	85 c0                	test   %eax,%eax
  1010eb:	7e 2c                	jle    101119 <strncpy+0x4a>
  1010ed:	8b 55 0c             	mov    0xc(%ebp),%edx
  1010f0:	8d 42 01             	lea    0x1(%edx),%eax
  1010f3:	89 45 0c             	mov    %eax,0xc(%ebp)
  1010f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f9:	8d 48 01             	lea    0x1(%eax),%ecx
  1010fc:	89 4d 08             	mov    %ecx,0x8(%ebp)
  1010ff:	0f b6 12             	movzbl (%edx),%edx
  101102:	88 10                	mov    %dl,(%eax)
  101104:	0f b6 00             	movzbl (%eax),%eax
  101107:	84 c0                	test   %al,%al
  101109:	75 d5                	jne    1010e0 <strncpy+0x11>
    ;
  while(n-- > 0)
  10110b:	eb 0c                	jmp    101119 <strncpy+0x4a>
    *s++ = 0;
  10110d:	8b 45 08             	mov    0x8(%ebp),%eax
  101110:	8d 50 01             	lea    0x1(%eax),%edx
  101113:	89 55 08             	mov    %edx,0x8(%ebp)
  101116:	c6 00 00             	movb   $0x0,(%eax)
  while(n-- > 0)
  101119:	8b 45 10             	mov    0x10(%ebp),%eax
  10111c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10111f:	89 55 10             	mov    %edx,0x10(%ebp)
  101122:	85 c0                	test   %eax,%eax
  101124:	7f e7                	jg     10110d <strncpy+0x3e>
  return os;
  101126:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101129:	c9                   	leave  
  10112a:	c3                   	ret    

0010112b <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
  10112b:	f3 0f 1e fb          	endbr32 
  10112f:	55                   	push   %ebp
  101130:	89 e5                	mov    %esp,%ebp
  101132:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  101135:	8b 45 08             	mov    0x8(%ebp),%eax
  101138:	89 45 fc             	mov    %eax,-0x4(%ebp)
  if(n <= 0)
  10113b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10113f:	7f 05                	jg     101146 <safestrcpy+0x1b>
    return os;
  101141:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101144:	eb 31                	jmp    101177 <safestrcpy+0x4c>
  while(--n > 0 && (*s++ = *t++) != 0)
  101146:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10114a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10114e:	7e 1e                	jle    10116e <safestrcpy+0x43>
  101150:	8b 55 0c             	mov    0xc(%ebp),%edx
  101153:	8d 42 01             	lea    0x1(%edx),%eax
  101156:	89 45 0c             	mov    %eax,0xc(%ebp)
  101159:	8b 45 08             	mov    0x8(%ebp),%eax
  10115c:	8d 48 01             	lea    0x1(%eax),%ecx
  10115f:	89 4d 08             	mov    %ecx,0x8(%ebp)
  101162:	0f b6 12             	movzbl (%edx),%edx
  101165:	88 10                	mov    %dl,(%eax)
  101167:	0f b6 00             	movzbl (%eax),%eax
  10116a:	84 c0                	test   %al,%al
  10116c:	75 d8                	jne    101146 <safestrcpy+0x1b>
    ;
  *s = 0;
  10116e:	8b 45 08             	mov    0x8(%ebp),%eax
  101171:	c6 00 00             	movb   $0x0,(%eax)
  return os;
  101174:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101177:	c9                   	leave  
  101178:	c3                   	ret    

00101179 <strlen>:

int
strlen(const char *s)
{
  101179:	f3 0f 1e fb          	endbr32 
  10117d:	55                   	push   %ebp
  10117e:	89 e5                	mov    %esp,%ebp
  101180:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  101183:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10118a:	eb 04                	jmp    101190 <strlen+0x17>
  10118c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101190:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101193:	8b 45 08             	mov    0x8(%ebp),%eax
  101196:	01 d0                	add    %edx,%eax
  101198:	0f b6 00             	movzbl (%eax),%eax
  10119b:	84 c0                	test   %al,%al
  10119d:	75 ed                	jne    10118c <strlen+0x13>
    ;
  return n;
  10119f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1011a2:	c9                   	leave  
  1011a3:	c3                   	ret    

001011a4 <readeflags>:
{
  1011a4:	55                   	push   %ebp
  1011a5:	89 e5                	mov    %esp,%ebp
  1011a7:	83 ec 10             	sub    $0x10,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
  1011aa:	9c                   	pushf  
  1011ab:	58                   	pop    %eax
  1011ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return eflags;
  1011af:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1011b2:	c9                   	leave  
  1011b3:	c3                   	ret    

001011b4 <cpuid>:
#include "x86.h"
#include "proc.h"

// Must be called with interrupts disabled
int
cpuid() {
  1011b4:	f3 0f 1e fb          	endbr32 
  1011b8:	55                   	push   %ebp
  1011b9:	89 e5                	mov    %esp,%ebp
  1011bb:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
  1011be:	e8 07 00 00 00       	call   1011ca <mycpu>
  1011c3:	2d d8 64 10 00       	sub    $0x1064d8,%eax
}
  1011c8:	c9                   	leave  
  1011c9:	c3                   	ret    

001011ca <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
  1011ca:	f3 0f 1e fb          	endbr32 
  1011ce:	55                   	push   %ebp
  1011cf:	89 e5                	mov    %esp,%ebp
  1011d1:	83 ec 18             	sub    $0x18,%esp
  int apicid, i;
  
  if(readeflags()&FL_IF)
  1011d4:	e8 cb ff ff ff       	call   1011a4 <readeflags>
  1011d9:	25 00 02 00 00       	and    $0x200,%eax
  1011de:	85 c0                	test   %eax,%eax
  1011e0:	74 0d                	je     1011ef <mycpu+0x25>
    panic("mycpu called with interrupts enabled\n");
  1011e2:	83 ec 0c             	sub    $0xc,%esp
  1011e5:	68 10 44 10 00       	push   $0x104410
  1011ea:	e8 ca f0 ff ff       	call   1002b9 <panic>
  
  apicid = lapicid();
  1011ef:	e8 51 f5 ff ff       	call   100745 <lapicid>
  1011f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
  1011f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1011fe:	eb 21                	jmp    101221 <mycpu+0x57>
    if (cpus[i].apicid == apicid)
  101200:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101203:	05 d8 64 10 00       	add    $0x1064d8,%eax
  101208:	0f b6 00             	movzbl (%eax),%eax
  10120b:	0f b6 c0             	movzbl %al,%eax
  10120e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  101211:	75 0a                	jne    10121d <mycpu+0x53>
      return &cpus[i];
  101213:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101216:	05 d8 64 10 00       	add    $0x1064d8,%eax
  10121b:	eb 1b                	jmp    101238 <mycpu+0x6e>
  for (i = 0; i < ncpu; ++i) {
  10121d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101221:	a1 e0 64 10 00       	mov    0x1064e0,%eax
  101226:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  101229:	7c d5                	jl     101200 <mycpu+0x36>
  }
  panic("unknown apicid\n");
  10122b:	83 ec 0c             	sub    $0xc,%esp
  10122e:	68 36 44 10 00       	push   $0x104436
  101233:	e8 81 f0 ff ff       	call   1002b9 <panic>
  101238:	c9                   	leave  
  101239:	c3                   	ret    

0010123a <getcallerpcs>:
// #include "memlayout.h"

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
  10123a:	f3 0f 1e fb          	endbr32 
  10123e:	55                   	push   %ebp
  10123f:	89 e5                	mov    %esp,%ebp
  101241:	83 ec 10             	sub    $0x10,%esp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  101244:	8b 45 08             	mov    0x8(%ebp),%eax
  101247:	83 e8 08             	sub    $0x8,%eax
  10124a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  for(i = 0; i < 10; i++){
  10124d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  101254:	eb 2f                	jmp    101285 <getcallerpcs+0x4b>
    // if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
    if(ebp == 0 || ebp == (uint*)0xffffffff)
  101256:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  10125a:	74 4a                	je     1012a6 <getcallerpcs+0x6c>
  10125c:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  101260:	74 44                	je     1012a6 <getcallerpcs+0x6c>
      break;
    pcs[i] = ebp[1];     // saved %eip
  101262:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101265:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  10126c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10126f:	01 c2                	add    %eax,%edx
  101271:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101274:	8b 40 04             	mov    0x4(%eax),%eax
  101277:	89 02                	mov    %eax,(%edx)
    ebp = (uint*)ebp[0]; // saved %ebp
  101279:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10127c:	8b 00                	mov    (%eax),%eax
  10127e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  for(i = 0; i < 10; i++){
  101281:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  101285:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
  101289:	7e cb                	jle    101256 <getcallerpcs+0x1c>
  }
  for(; i < 10; i++)
  10128b:	eb 19                	jmp    1012a6 <getcallerpcs+0x6c>
    pcs[i] = 0;
  10128d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101290:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101297:	8b 45 0c             	mov    0xc(%ebp),%eax
  10129a:	01 d0                	add    %edx,%eax
  10129c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
  1012a2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1012a6:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
  1012aa:	7e e1                	jle    10128d <getcallerpcs+0x53>
  1012ac:	90                   	nop
  1012ad:	90                   	nop
  1012ae:	c9                   	leave  
  1012af:	c3                   	ret    

001012b0 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushal
  1012b0:	60                   	pusha  
  
  # Call trap(tf), where tf=%esp
  pushl %esp
  1012b1:	54                   	push   %esp
  call trap
  1012b2:	e8 49 01 00 00       	call   101400 <trap>
  addl $4, %esp
  1012b7:	83 c4 04             	add    $0x4,%esp

001012ba <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
  1012ba:	61                   	popa   
  addl $0x8, %esp  # trapno and errcode
  1012bb:	83 c4 08             	add    $0x8,%esp
  iret
  1012be:	cf                   	iret   

001012bf <lidt>:
{
  1012bf:	55                   	push   %ebp
  1012c0:	89 e5                	mov    %esp,%ebp
  1012c2:	83 ec 10             	sub    $0x10,%esp
  pd[0] = size-1;
  1012c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1012c8:	83 e8 01             	sub    $0x1,%eax
  1012cb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
  1012cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1012d2:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
  1012d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1012d9:	c1 e8 10             	shr    $0x10,%eax
  1012dc:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
  1012e0:	8d 45 fa             	lea    -0x6(%ebp),%eax
  1012e3:	0f 01 18             	lidtl  (%eax)
}
  1012e6:	90                   	nop
  1012e7:	c9                   	leave  
  1012e8:	c3                   	ret    

001012e9 <rcr2>:

static inline uint
rcr2(void)
{
  1012e9:	55                   	push   %ebp
  1012ea:	89 e5                	mov    %esp,%ebp
  1012ec:	83 ec 10             	sub    $0x10,%esp
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
  1012ef:	0f 20 d0             	mov    %cr2,%eax
  1012f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return val;
  1012f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1012f8:	c9                   	leave  
  1012f9:	c3                   	ret    

001012fa <tvinit>:
extern uint vectors[];  // in vectors.S: array of 256 entry pointers
uint ticks;

void
tvinit(void)
{
  1012fa:	f3 0f 1e fb          	endbr32 
  1012fe:	55                   	push   %ebp
  1012ff:	89 e5                	mov    %esp,%ebp
  101301:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
  101304:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10130b:	e9 c3 00 00 00       	jmp    1013d3 <tvinit+0xd9>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  101310:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101313:	8b 04 85 11 50 10 00 	mov    0x105011(,%eax,4),%eax
  10131a:	89 c2                	mov    %eax,%edx
  10131c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10131f:	66 89 14 c5 00 65 10 	mov    %dx,0x106500(,%eax,8)
  101326:	00 
  101327:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10132a:	66 c7 04 c5 02 65 10 	movw   $0x8,0x106502(,%eax,8)
  101331:	00 08 00 
  101334:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101337:	0f b6 14 c5 04 65 10 	movzbl 0x106504(,%eax,8),%edx
  10133e:	00 
  10133f:	83 e2 e0             	and    $0xffffffe0,%edx
  101342:	88 14 c5 04 65 10 00 	mov    %dl,0x106504(,%eax,8)
  101349:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10134c:	0f b6 14 c5 04 65 10 	movzbl 0x106504(,%eax,8),%edx
  101353:	00 
  101354:	83 e2 1f             	and    $0x1f,%edx
  101357:	88 14 c5 04 65 10 00 	mov    %dl,0x106504(,%eax,8)
  10135e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101361:	0f b6 14 c5 05 65 10 	movzbl 0x106505(,%eax,8),%edx
  101368:	00 
  101369:	83 e2 f0             	and    $0xfffffff0,%edx
  10136c:	83 ca 0e             	or     $0xe,%edx
  10136f:	88 14 c5 05 65 10 00 	mov    %dl,0x106505(,%eax,8)
  101376:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101379:	0f b6 14 c5 05 65 10 	movzbl 0x106505(,%eax,8),%edx
  101380:	00 
  101381:	83 e2 ef             	and    $0xffffffef,%edx
  101384:	88 14 c5 05 65 10 00 	mov    %dl,0x106505(,%eax,8)
  10138b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10138e:	0f b6 14 c5 05 65 10 	movzbl 0x106505(,%eax,8),%edx
  101395:	00 
  101396:	83 e2 9f             	and    $0xffffff9f,%edx
  101399:	88 14 c5 05 65 10 00 	mov    %dl,0x106505(,%eax,8)
  1013a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1013a3:	0f b6 14 c5 05 65 10 	movzbl 0x106505(,%eax,8),%edx
  1013aa:	00 
  1013ab:	83 ca 80             	or     $0xffffff80,%edx
  1013ae:	88 14 c5 05 65 10 00 	mov    %dl,0x106505(,%eax,8)
  1013b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1013b8:	8b 04 85 11 50 10 00 	mov    0x105011(,%eax,4),%eax
  1013bf:	c1 e8 10             	shr    $0x10,%eax
  1013c2:	89 c2                	mov    %eax,%edx
  1013c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1013c7:	66 89 14 c5 06 65 10 	mov    %dx,0x106506(,%eax,8)
  1013ce:	00 
  for(i = 0; i < 256; i++)
  1013cf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1013d3:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  1013da:	0f 8e 30 ff ff ff    	jle    101310 <tvinit+0x16>
}
  1013e0:	90                   	nop
  1013e1:	90                   	nop
  1013e2:	c9                   	leave  
  1013e3:	c3                   	ret    

001013e4 <idtinit>:

void
idtinit(void)
{
  1013e4:	f3 0f 1e fb          	endbr32 
  1013e8:	55                   	push   %ebp
  1013e9:	89 e5                	mov    %esp,%ebp
  lidt(idt, sizeof(idt));
  1013eb:	68 00 08 00 00       	push   $0x800
  1013f0:	68 00 65 10 00       	push   $0x106500
  1013f5:	e8 c5 fe ff ff       	call   1012bf <lidt>
  1013fa:	83 c4 08             	add    $0x8,%esp
}
  1013fd:	90                   	nop
  1013fe:	c9                   	leave  
  1013ff:	c3                   	ret    

00101400 <trap>:

void
trap(struct trapframe *tf)
{
  101400:	f3 0f 1e fb          	endbr32 
  101404:	55                   	push   %ebp
  101405:	89 e5                	mov    %esp,%ebp
  101407:	56                   	push   %esi
  101408:	53                   	push   %ebx
  switch(tf->trapno){
  101409:	8b 45 08             	mov    0x8(%ebp),%eax
  10140c:	8b 40 20             	mov    0x20(%eax),%eax
  10140f:	83 e8 20             	sub    $0x20,%eax
  101412:	83 f8 1f             	cmp    $0x1f,%eax
  101415:	77 62                	ja     101479 <trap+0x79>
  101417:	8b 04 85 a4 44 10 00 	mov    0x1044a4(,%eax,4),%eax
  10141e:	3e ff e0             	notrack jmp *%eax
  case T_IRQ0 + IRQ_TIMER:
    ticks++;
  101421:	a1 00 6d 10 00       	mov    0x106d00,%eax
  101426:	83 c0 01             	add    $0x1,%eax
  101429:	a3 00 6d 10 00       	mov    %eax,0x106d00
    lapiceoi();
  10142e:	e8 38 f3 ff ff       	call   10076b <lapiceoi>
    break;
  101433:	eb 7d                	jmp    1014b2 <trap+0xb2>
  case T_IRQ0 + IRQ_IDE:
    ideintr();
  101435:	e8 a9 11 00 00       	call   1025e3 <ideintr>
    lapiceoi();
  10143a:	e8 2c f3 ff ff       	call   10076b <lapiceoi>
    break;
  10143f:	eb 71                	jmp    1014b2 <trap+0xb2>
  case T_IRQ0 + IRQ_COM1:
    uartintr();
  101441:	e8 61 fa ff ff       	call   100ea7 <uartintr>
    lapiceoi();
  101446:	e8 20 f3 ff ff       	call   10076b <lapiceoi>
    break;
  10144b:	eb 65                	jmp    1014b2 <trap+0xb2>
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
  10144d:	8b 45 08             	mov    0x8(%ebp),%eax
  101450:	8b 70 28             	mov    0x28(%eax),%esi
            cpuid(), tf->cs, tf->eip);
  101453:	8b 45 08             	mov    0x8(%ebp),%eax
  101456:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
  10145a:	0f b7 d8             	movzwl %ax,%ebx
  10145d:	e8 52 fd ff ff       	call   1011b4 <cpuid>
  101462:	56                   	push   %esi
  101463:	53                   	push   %ebx
  101464:	50                   	push   %eax
  101465:	68 48 44 10 00       	push   $0x104448
  10146a:	e8 81 ec ff ff       	call   1000f0 <cprintf>
  10146f:	83 c4 10             	add    $0x10,%esp
    lapiceoi();
  101472:	e8 f4 f2 ff ff       	call   10076b <lapiceoi>
    break;
  101477:	eb 39                	jmp    1014b2 <trap+0xb2>

  default:
    cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
  101479:	e8 6b fe ff ff       	call   1012e9 <rcr2>
  10147e:	89 c3                	mov    %eax,%ebx
  101480:	8b 45 08             	mov    0x8(%ebp),%eax
  101483:	8b 70 28             	mov    0x28(%eax),%esi
  101486:	e8 29 fd ff ff       	call   1011b4 <cpuid>
  10148b:	8b 55 08             	mov    0x8(%ebp),%edx
  10148e:	8b 52 20             	mov    0x20(%edx),%edx
  101491:	83 ec 0c             	sub    $0xc,%esp
  101494:	53                   	push   %ebx
  101495:	56                   	push   %esi
  101496:	50                   	push   %eax
  101497:	52                   	push   %edx
  101498:	68 6c 44 10 00       	push   $0x10446c
  10149d:	e8 4e ec ff ff       	call   1000f0 <cprintf>
  1014a2:	83 c4 20             	add    $0x20,%esp
            tf->trapno, cpuid(), tf->eip, rcr2());
    panic("trap");
  1014a5:	83 ec 0c             	sub    $0xc,%esp
  1014a8:	68 9e 44 10 00       	push   $0x10449e
  1014ad:	e8 07 ee ff ff       	call   1002b9 <panic>
  }
}
  1014b2:	90                   	nop
  1014b3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1014b6:	5b                   	pop    %ebx
  1014b7:	5e                   	pop    %esi
  1014b8:	5d                   	pop    %ebp
  1014b9:	c3                   	ret    

001014ba <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
  1014ba:	6a 00                	push   $0x0
  pushl $0
  1014bc:	6a 00                	push   $0x0
  jmp alltraps
  1014be:	e9 ed fd ff ff       	jmp    1012b0 <alltraps>

001014c3 <vector1>:
.globl vector1
vector1:
  pushl $0
  1014c3:	6a 00                	push   $0x0
  pushl $1
  1014c5:	6a 01                	push   $0x1
  jmp alltraps
  1014c7:	e9 e4 fd ff ff       	jmp    1012b0 <alltraps>

001014cc <vector2>:
.globl vector2
vector2:
  pushl $0
  1014cc:	6a 00                	push   $0x0
  pushl $2
  1014ce:	6a 02                	push   $0x2
  jmp alltraps
  1014d0:	e9 db fd ff ff       	jmp    1012b0 <alltraps>

001014d5 <vector3>:
.globl vector3
vector3:
  pushl $0
  1014d5:	6a 00                	push   $0x0
  pushl $3
  1014d7:	6a 03                	push   $0x3
  jmp alltraps
  1014d9:	e9 d2 fd ff ff       	jmp    1012b0 <alltraps>

001014de <vector4>:
.globl vector4
vector4:
  pushl $0
  1014de:	6a 00                	push   $0x0
  pushl $4
  1014e0:	6a 04                	push   $0x4
  jmp alltraps
  1014e2:	e9 c9 fd ff ff       	jmp    1012b0 <alltraps>

001014e7 <vector5>:
.globl vector5
vector5:
  pushl $0
  1014e7:	6a 00                	push   $0x0
  pushl $5
  1014e9:	6a 05                	push   $0x5
  jmp alltraps
  1014eb:	e9 c0 fd ff ff       	jmp    1012b0 <alltraps>

001014f0 <vector6>:
.globl vector6
vector6:
  pushl $0
  1014f0:	6a 00                	push   $0x0
  pushl $6
  1014f2:	6a 06                	push   $0x6
  jmp alltraps
  1014f4:	e9 b7 fd ff ff       	jmp    1012b0 <alltraps>

001014f9 <vector7>:
.globl vector7
vector7:
  pushl $0
  1014f9:	6a 00                	push   $0x0
  pushl $7
  1014fb:	6a 07                	push   $0x7
  jmp alltraps
  1014fd:	e9 ae fd ff ff       	jmp    1012b0 <alltraps>

00101502 <vector8>:
.globl vector8
vector8:
  pushl $8
  101502:	6a 08                	push   $0x8
  jmp alltraps
  101504:	e9 a7 fd ff ff       	jmp    1012b0 <alltraps>

00101509 <vector9>:
.globl vector9
vector9:
  pushl $0
  101509:	6a 00                	push   $0x0
  pushl $9
  10150b:	6a 09                	push   $0x9
  jmp alltraps
  10150d:	e9 9e fd ff ff       	jmp    1012b0 <alltraps>

00101512 <vector10>:
.globl vector10
vector10:
  pushl $10
  101512:	6a 0a                	push   $0xa
  jmp alltraps
  101514:	e9 97 fd ff ff       	jmp    1012b0 <alltraps>

00101519 <vector11>:
.globl vector11
vector11:
  pushl $11
  101519:	6a 0b                	push   $0xb
  jmp alltraps
  10151b:	e9 90 fd ff ff       	jmp    1012b0 <alltraps>

00101520 <vector12>:
.globl vector12
vector12:
  pushl $12
  101520:	6a 0c                	push   $0xc
  jmp alltraps
  101522:	e9 89 fd ff ff       	jmp    1012b0 <alltraps>

00101527 <vector13>:
.globl vector13
vector13:
  pushl $13
  101527:	6a 0d                	push   $0xd
  jmp alltraps
  101529:	e9 82 fd ff ff       	jmp    1012b0 <alltraps>

0010152e <vector14>:
.globl vector14
vector14:
  pushl $14
  10152e:	6a 0e                	push   $0xe
  jmp alltraps
  101530:	e9 7b fd ff ff       	jmp    1012b0 <alltraps>

00101535 <vector15>:
.globl vector15
vector15:
  pushl $0
  101535:	6a 00                	push   $0x0
  pushl $15
  101537:	6a 0f                	push   $0xf
  jmp alltraps
  101539:	e9 72 fd ff ff       	jmp    1012b0 <alltraps>

0010153e <vector16>:
.globl vector16
vector16:
  pushl $0
  10153e:	6a 00                	push   $0x0
  pushl $16
  101540:	6a 10                	push   $0x10
  jmp alltraps
  101542:	e9 69 fd ff ff       	jmp    1012b0 <alltraps>

00101547 <vector17>:
.globl vector17
vector17:
  pushl $17
  101547:	6a 11                	push   $0x11
  jmp alltraps
  101549:	e9 62 fd ff ff       	jmp    1012b0 <alltraps>

0010154e <vector18>:
.globl vector18
vector18:
  pushl $0
  10154e:	6a 00                	push   $0x0
  pushl $18
  101550:	6a 12                	push   $0x12
  jmp alltraps
  101552:	e9 59 fd ff ff       	jmp    1012b0 <alltraps>

00101557 <vector19>:
.globl vector19
vector19:
  pushl $0
  101557:	6a 00                	push   $0x0
  pushl $19
  101559:	6a 13                	push   $0x13
  jmp alltraps
  10155b:	e9 50 fd ff ff       	jmp    1012b0 <alltraps>

00101560 <vector20>:
.globl vector20
vector20:
  pushl $0
  101560:	6a 00                	push   $0x0
  pushl $20
  101562:	6a 14                	push   $0x14
  jmp alltraps
  101564:	e9 47 fd ff ff       	jmp    1012b0 <alltraps>

00101569 <vector21>:
.globl vector21
vector21:
  pushl $0
  101569:	6a 00                	push   $0x0
  pushl $21
  10156b:	6a 15                	push   $0x15
  jmp alltraps
  10156d:	e9 3e fd ff ff       	jmp    1012b0 <alltraps>

00101572 <vector22>:
.globl vector22
vector22:
  pushl $0
  101572:	6a 00                	push   $0x0
  pushl $22
  101574:	6a 16                	push   $0x16
  jmp alltraps
  101576:	e9 35 fd ff ff       	jmp    1012b0 <alltraps>

0010157b <vector23>:
.globl vector23
vector23:
  pushl $0
  10157b:	6a 00                	push   $0x0
  pushl $23
  10157d:	6a 17                	push   $0x17
  jmp alltraps
  10157f:	e9 2c fd ff ff       	jmp    1012b0 <alltraps>

00101584 <vector24>:
.globl vector24
vector24:
  pushl $0
  101584:	6a 00                	push   $0x0
  pushl $24
  101586:	6a 18                	push   $0x18
  jmp alltraps
  101588:	e9 23 fd ff ff       	jmp    1012b0 <alltraps>

0010158d <vector25>:
.globl vector25
vector25:
  pushl $0
  10158d:	6a 00                	push   $0x0
  pushl $25
  10158f:	6a 19                	push   $0x19
  jmp alltraps
  101591:	e9 1a fd ff ff       	jmp    1012b0 <alltraps>

00101596 <vector26>:
.globl vector26
vector26:
  pushl $0
  101596:	6a 00                	push   $0x0
  pushl $26
  101598:	6a 1a                	push   $0x1a
  jmp alltraps
  10159a:	e9 11 fd ff ff       	jmp    1012b0 <alltraps>

0010159f <vector27>:
.globl vector27
vector27:
  pushl $0
  10159f:	6a 00                	push   $0x0
  pushl $27
  1015a1:	6a 1b                	push   $0x1b
  jmp alltraps
  1015a3:	e9 08 fd ff ff       	jmp    1012b0 <alltraps>

001015a8 <vector28>:
.globl vector28
vector28:
  pushl $0
  1015a8:	6a 00                	push   $0x0
  pushl $28
  1015aa:	6a 1c                	push   $0x1c
  jmp alltraps
  1015ac:	e9 ff fc ff ff       	jmp    1012b0 <alltraps>

001015b1 <vector29>:
.globl vector29
vector29:
  pushl $0
  1015b1:	6a 00                	push   $0x0
  pushl $29
  1015b3:	6a 1d                	push   $0x1d
  jmp alltraps
  1015b5:	e9 f6 fc ff ff       	jmp    1012b0 <alltraps>

001015ba <vector30>:
.globl vector30
vector30:
  pushl $0
  1015ba:	6a 00                	push   $0x0
  pushl $30
  1015bc:	6a 1e                	push   $0x1e
  jmp alltraps
  1015be:	e9 ed fc ff ff       	jmp    1012b0 <alltraps>

001015c3 <vector31>:
.globl vector31
vector31:
  pushl $0
  1015c3:	6a 00                	push   $0x0
  pushl $31
  1015c5:	6a 1f                	push   $0x1f
  jmp alltraps
  1015c7:	e9 e4 fc ff ff       	jmp    1012b0 <alltraps>

001015cc <vector32>:
.globl vector32
vector32:
  pushl $0
  1015cc:	6a 00                	push   $0x0
  pushl $32
  1015ce:	6a 20                	push   $0x20
  jmp alltraps
  1015d0:	e9 db fc ff ff       	jmp    1012b0 <alltraps>

001015d5 <vector33>:
.globl vector33
vector33:
  pushl $0
  1015d5:	6a 00                	push   $0x0
  pushl $33
  1015d7:	6a 21                	push   $0x21
  jmp alltraps
  1015d9:	e9 d2 fc ff ff       	jmp    1012b0 <alltraps>

001015de <vector34>:
.globl vector34
vector34:
  pushl $0
  1015de:	6a 00                	push   $0x0
  pushl $34
  1015e0:	6a 22                	push   $0x22
  jmp alltraps
  1015e2:	e9 c9 fc ff ff       	jmp    1012b0 <alltraps>

001015e7 <vector35>:
.globl vector35
vector35:
  pushl $0
  1015e7:	6a 00                	push   $0x0
  pushl $35
  1015e9:	6a 23                	push   $0x23
  jmp alltraps
  1015eb:	e9 c0 fc ff ff       	jmp    1012b0 <alltraps>

001015f0 <vector36>:
.globl vector36
vector36:
  pushl $0
  1015f0:	6a 00                	push   $0x0
  pushl $36
  1015f2:	6a 24                	push   $0x24
  jmp alltraps
  1015f4:	e9 b7 fc ff ff       	jmp    1012b0 <alltraps>

001015f9 <vector37>:
.globl vector37
vector37:
  pushl $0
  1015f9:	6a 00                	push   $0x0
  pushl $37
  1015fb:	6a 25                	push   $0x25
  jmp alltraps
  1015fd:	e9 ae fc ff ff       	jmp    1012b0 <alltraps>

00101602 <vector38>:
.globl vector38
vector38:
  pushl $0
  101602:	6a 00                	push   $0x0
  pushl $38
  101604:	6a 26                	push   $0x26
  jmp alltraps
  101606:	e9 a5 fc ff ff       	jmp    1012b0 <alltraps>

0010160b <vector39>:
.globl vector39
vector39:
  pushl $0
  10160b:	6a 00                	push   $0x0
  pushl $39
  10160d:	6a 27                	push   $0x27
  jmp alltraps
  10160f:	e9 9c fc ff ff       	jmp    1012b0 <alltraps>

00101614 <vector40>:
.globl vector40
vector40:
  pushl $0
  101614:	6a 00                	push   $0x0
  pushl $40
  101616:	6a 28                	push   $0x28
  jmp alltraps
  101618:	e9 93 fc ff ff       	jmp    1012b0 <alltraps>

0010161d <vector41>:
.globl vector41
vector41:
  pushl $0
  10161d:	6a 00                	push   $0x0
  pushl $41
  10161f:	6a 29                	push   $0x29
  jmp alltraps
  101621:	e9 8a fc ff ff       	jmp    1012b0 <alltraps>

00101626 <vector42>:
.globl vector42
vector42:
  pushl $0
  101626:	6a 00                	push   $0x0
  pushl $42
  101628:	6a 2a                	push   $0x2a
  jmp alltraps
  10162a:	e9 81 fc ff ff       	jmp    1012b0 <alltraps>

0010162f <vector43>:
.globl vector43
vector43:
  pushl $0
  10162f:	6a 00                	push   $0x0
  pushl $43
  101631:	6a 2b                	push   $0x2b
  jmp alltraps
  101633:	e9 78 fc ff ff       	jmp    1012b0 <alltraps>

00101638 <vector44>:
.globl vector44
vector44:
  pushl $0
  101638:	6a 00                	push   $0x0
  pushl $44
  10163a:	6a 2c                	push   $0x2c
  jmp alltraps
  10163c:	e9 6f fc ff ff       	jmp    1012b0 <alltraps>

00101641 <vector45>:
.globl vector45
vector45:
  pushl $0
  101641:	6a 00                	push   $0x0
  pushl $45
  101643:	6a 2d                	push   $0x2d
  jmp alltraps
  101645:	e9 66 fc ff ff       	jmp    1012b0 <alltraps>

0010164a <vector46>:
.globl vector46
vector46:
  pushl $0
  10164a:	6a 00                	push   $0x0
  pushl $46
  10164c:	6a 2e                	push   $0x2e
  jmp alltraps
  10164e:	e9 5d fc ff ff       	jmp    1012b0 <alltraps>

00101653 <vector47>:
.globl vector47
vector47:
  pushl $0
  101653:	6a 00                	push   $0x0
  pushl $47
  101655:	6a 2f                	push   $0x2f
  jmp alltraps
  101657:	e9 54 fc ff ff       	jmp    1012b0 <alltraps>

0010165c <vector48>:
.globl vector48
vector48:
  pushl $0
  10165c:	6a 00                	push   $0x0
  pushl $48
  10165e:	6a 30                	push   $0x30
  jmp alltraps
  101660:	e9 4b fc ff ff       	jmp    1012b0 <alltraps>

00101665 <vector49>:
.globl vector49
vector49:
  pushl $0
  101665:	6a 00                	push   $0x0
  pushl $49
  101667:	6a 31                	push   $0x31
  jmp alltraps
  101669:	e9 42 fc ff ff       	jmp    1012b0 <alltraps>

0010166e <vector50>:
.globl vector50
vector50:
  pushl $0
  10166e:	6a 00                	push   $0x0
  pushl $50
  101670:	6a 32                	push   $0x32
  jmp alltraps
  101672:	e9 39 fc ff ff       	jmp    1012b0 <alltraps>

00101677 <vector51>:
.globl vector51
vector51:
  pushl $0
  101677:	6a 00                	push   $0x0
  pushl $51
  101679:	6a 33                	push   $0x33
  jmp alltraps
  10167b:	e9 30 fc ff ff       	jmp    1012b0 <alltraps>

00101680 <vector52>:
.globl vector52
vector52:
  pushl $0
  101680:	6a 00                	push   $0x0
  pushl $52
  101682:	6a 34                	push   $0x34
  jmp alltraps
  101684:	e9 27 fc ff ff       	jmp    1012b0 <alltraps>

00101689 <vector53>:
.globl vector53
vector53:
  pushl $0
  101689:	6a 00                	push   $0x0
  pushl $53
  10168b:	6a 35                	push   $0x35
  jmp alltraps
  10168d:	e9 1e fc ff ff       	jmp    1012b0 <alltraps>

00101692 <vector54>:
.globl vector54
vector54:
  pushl $0
  101692:	6a 00                	push   $0x0
  pushl $54
  101694:	6a 36                	push   $0x36
  jmp alltraps
  101696:	e9 15 fc ff ff       	jmp    1012b0 <alltraps>

0010169b <vector55>:
.globl vector55
vector55:
  pushl $0
  10169b:	6a 00                	push   $0x0
  pushl $55
  10169d:	6a 37                	push   $0x37
  jmp alltraps
  10169f:	e9 0c fc ff ff       	jmp    1012b0 <alltraps>

001016a4 <vector56>:
.globl vector56
vector56:
  pushl $0
  1016a4:	6a 00                	push   $0x0
  pushl $56
  1016a6:	6a 38                	push   $0x38
  jmp alltraps
  1016a8:	e9 03 fc ff ff       	jmp    1012b0 <alltraps>

001016ad <vector57>:
.globl vector57
vector57:
  pushl $0
  1016ad:	6a 00                	push   $0x0
  pushl $57
  1016af:	6a 39                	push   $0x39
  jmp alltraps
  1016b1:	e9 fa fb ff ff       	jmp    1012b0 <alltraps>

001016b6 <vector58>:
.globl vector58
vector58:
  pushl $0
  1016b6:	6a 00                	push   $0x0
  pushl $58
  1016b8:	6a 3a                	push   $0x3a
  jmp alltraps
  1016ba:	e9 f1 fb ff ff       	jmp    1012b0 <alltraps>

001016bf <vector59>:
.globl vector59
vector59:
  pushl $0
  1016bf:	6a 00                	push   $0x0
  pushl $59
  1016c1:	6a 3b                	push   $0x3b
  jmp alltraps
  1016c3:	e9 e8 fb ff ff       	jmp    1012b0 <alltraps>

001016c8 <vector60>:
.globl vector60
vector60:
  pushl $0
  1016c8:	6a 00                	push   $0x0
  pushl $60
  1016ca:	6a 3c                	push   $0x3c
  jmp alltraps
  1016cc:	e9 df fb ff ff       	jmp    1012b0 <alltraps>

001016d1 <vector61>:
.globl vector61
vector61:
  pushl $0
  1016d1:	6a 00                	push   $0x0
  pushl $61
  1016d3:	6a 3d                	push   $0x3d
  jmp alltraps
  1016d5:	e9 d6 fb ff ff       	jmp    1012b0 <alltraps>

001016da <vector62>:
.globl vector62
vector62:
  pushl $0
  1016da:	6a 00                	push   $0x0
  pushl $62
  1016dc:	6a 3e                	push   $0x3e
  jmp alltraps
  1016de:	e9 cd fb ff ff       	jmp    1012b0 <alltraps>

001016e3 <vector63>:
.globl vector63
vector63:
  pushl $0
  1016e3:	6a 00                	push   $0x0
  pushl $63
  1016e5:	6a 3f                	push   $0x3f
  jmp alltraps
  1016e7:	e9 c4 fb ff ff       	jmp    1012b0 <alltraps>

001016ec <vector64>:
.globl vector64
vector64:
  pushl $0
  1016ec:	6a 00                	push   $0x0
  pushl $64
  1016ee:	6a 40                	push   $0x40
  jmp alltraps
  1016f0:	e9 bb fb ff ff       	jmp    1012b0 <alltraps>

001016f5 <vector65>:
.globl vector65
vector65:
  pushl $0
  1016f5:	6a 00                	push   $0x0
  pushl $65
  1016f7:	6a 41                	push   $0x41
  jmp alltraps
  1016f9:	e9 b2 fb ff ff       	jmp    1012b0 <alltraps>

001016fe <vector66>:
.globl vector66
vector66:
  pushl $0
  1016fe:	6a 00                	push   $0x0
  pushl $66
  101700:	6a 42                	push   $0x42
  jmp alltraps
  101702:	e9 a9 fb ff ff       	jmp    1012b0 <alltraps>

00101707 <vector67>:
.globl vector67
vector67:
  pushl $0
  101707:	6a 00                	push   $0x0
  pushl $67
  101709:	6a 43                	push   $0x43
  jmp alltraps
  10170b:	e9 a0 fb ff ff       	jmp    1012b0 <alltraps>

00101710 <vector68>:
.globl vector68
vector68:
  pushl $0
  101710:	6a 00                	push   $0x0
  pushl $68
  101712:	6a 44                	push   $0x44
  jmp alltraps
  101714:	e9 97 fb ff ff       	jmp    1012b0 <alltraps>

00101719 <vector69>:
.globl vector69
vector69:
  pushl $0
  101719:	6a 00                	push   $0x0
  pushl $69
  10171b:	6a 45                	push   $0x45
  jmp alltraps
  10171d:	e9 8e fb ff ff       	jmp    1012b0 <alltraps>

00101722 <vector70>:
.globl vector70
vector70:
  pushl $0
  101722:	6a 00                	push   $0x0
  pushl $70
  101724:	6a 46                	push   $0x46
  jmp alltraps
  101726:	e9 85 fb ff ff       	jmp    1012b0 <alltraps>

0010172b <vector71>:
.globl vector71
vector71:
  pushl $0
  10172b:	6a 00                	push   $0x0
  pushl $71
  10172d:	6a 47                	push   $0x47
  jmp alltraps
  10172f:	e9 7c fb ff ff       	jmp    1012b0 <alltraps>

00101734 <vector72>:
.globl vector72
vector72:
  pushl $0
  101734:	6a 00                	push   $0x0
  pushl $72
  101736:	6a 48                	push   $0x48
  jmp alltraps
  101738:	e9 73 fb ff ff       	jmp    1012b0 <alltraps>

0010173d <vector73>:
.globl vector73
vector73:
  pushl $0
  10173d:	6a 00                	push   $0x0
  pushl $73
  10173f:	6a 49                	push   $0x49
  jmp alltraps
  101741:	e9 6a fb ff ff       	jmp    1012b0 <alltraps>

00101746 <vector74>:
.globl vector74
vector74:
  pushl $0
  101746:	6a 00                	push   $0x0
  pushl $74
  101748:	6a 4a                	push   $0x4a
  jmp alltraps
  10174a:	e9 61 fb ff ff       	jmp    1012b0 <alltraps>

0010174f <vector75>:
.globl vector75
vector75:
  pushl $0
  10174f:	6a 00                	push   $0x0
  pushl $75
  101751:	6a 4b                	push   $0x4b
  jmp alltraps
  101753:	e9 58 fb ff ff       	jmp    1012b0 <alltraps>

00101758 <vector76>:
.globl vector76
vector76:
  pushl $0
  101758:	6a 00                	push   $0x0
  pushl $76
  10175a:	6a 4c                	push   $0x4c
  jmp alltraps
  10175c:	e9 4f fb ff ff       	jmp    1012b0 <alltraps>

00101761 <vector77>:
.globl vector77
vector77:
  pushl $0
  101761:	6a 00                	push   $0x0
  pushl $77
  101763:	6a 4d                	push   $0x4d
  jmp alltraps
  101765:	e9 46 fb ff ff       	jmp    1012b0 <alltraps>

0010176a <vector78>:
.globl vector78
vector78:
  pushl $0
  10176a:	6a 00                	push   $0x0
  pushl $78
  10176c:	6a 4e                	push   $0x4e
  jmp alltraps
  10176e:	e9 3d fb ff ff       	jmp    1012b0 <alltraps>

00101773 <vector79>:
.globl vector79
vector79:
  pushl $0
  101773:	6a 00                	push   $0x0
  pushl $79
  101775:	6a 4f                	push   $0x4f
  jmp alltraps
  101777:	e9 34 fb ff ff       	jmp    1012b0 <alltraps>

0010177c <vector80>:
.globl vector80
vector80:
  pushl $0
  10177c:	6a 00                	push   $0x0
  pushl $80
  10177e:	6a 50                	push   $0x50
  jmp alltraps
  101780:	e9 2b fb ff ff       	jmp    1012b0 <alltraps>

00101785 <vector81>:
.globl vector81
vector81:
  pushl $0
  101785:	6a 00                	push   $0x0
  pushl $81
  101787:	6a 51                	push   $0x51
  jmp alltraps
  101789:	e9 22 fb ff ff       	jmp    1012b0 <alltraps>

0010178e <vector82>:
.globl vector82
vector82:
  pushl $0
  10178e:	6a 00                	push   $0x0
  pushl $82
  101790:	6a 52                	push   $0x52
  jmp alltraps
  101792:	e9 19 fb ff ff       	jmp    1012b0 <alltraps>

00101797 <vector83>:
.globl vector83
vector83:
  pushl $0
  101797:	6a 00                	push   $0x0
  pushl $83
  101799:	6a 53                	push   $0x53
  jmp alltraps
  10179b:	e9 10 fb ff ff       	jmp    1012b0 <alltraps>

001017a0 <vector84>:
.globl vector84
vector84:
  pushl $0
  1017a0:	6a 00                	push   $0x0
  pushl $84
  1017a2:	6a 54                	push   $0x54
  jmp alltraps
  1017a4:	e9 07 fb ff ff       	jmp    1012b0 <alltraps>

001017a9 <vector85>:
.globl vector85
vector85:
  pushl $0
  1017a9:	6a 00                	push   $0x0
  pushl $85
  1017ab:	6a 55                	push   $0x55
  jmp alltraps
  1017ad:	e9 fe fa ff ff       	jmp    1012b0 <alltraps>

001017b2 <vector86>:
.globl vector86
vector86:
  pushl $0
  1017b2:	6a 00                	push   $0x0
  pushl $86
  1017b4:	6a 56                	push   $0x56
  jmp alltraps
  1017b6:	e9 f5 fa ff ff       	jmp    1012b0 <alltraps>

001017bb <vector87>:
.globl vector87
vector87:
  pushl $0
  1017bb:	6a 00                	push   $0x0
  pushl $87
  1017bd:	6a 57                	push   $0x57
  jmp alltraps
  1017bf:	e9 ec fa ff ff       	jmp    1012b0 <alltraps>

001017c4 <vector88>:
.globl vector88
vector88:
  pushl $0
  1017c4:	6a 00                	push   $0x0
  pushl $88
  1017c6:	6a 58                	push   $0x58
  jmp alltraps
  1017c8:	e9 e3 fa ff ff       	jmp    1012b0 <alltraps>

001017cd <vector89>:
.globl vector89
vector89:
  pushl $0
  1017cd:	6a 00                	push   $0x0
  pushl $89
  1017cf:	6a 59                	push   $0x59
  jmp alltraps
  1017d1:	e9 da fa ff ff       	jmp    1012b0 <alltraps>

001017d6 <vector90>:
.globl vector90
vector90:
  pushl $0
  1017d6:	6a 00                	push   $0x0
  pushl $90
  1017d8:	6a 5a                	push   $0x5a
  jmp alltraps
  1017da:	e9 d1 fa ff ff       	jmp    1012b0 <alltraps>

001017df <vector91>:
.globl vector91
vector91:
  pushl $0
  1017df:	6a 00                	push   $0x0
  pushl $91
  1017e1:	6a 5b                	push   $0x5b
  jmp alltraps
  1017e3:	e9 c8 fa ff ff       	jmp    1012b0 <alltraps>

001017e8 <vector92>:
.globl vector92
vector92:
  pushl $0
  1017e8:	6a 00                	push   $0x0
  pushl $92
  1017ea:	6a 5c                	push   $0x5c
  jmp alltraps
  1017ec:	e9 bf fa ff ff       	jmp    1012b0 <alltraps>

001017f1 <vector93>:
.globl vector93
vector93:
  pushl $0
  1017f1:	6a 00                	push   $0x0
  pushl $93
  1017f3:	6a 5d                	push   $0x5d
  jmp alltraps
  1017f5:	e9 b6 fa ff ff       	jmp    1012b0 <alltraps>

001017fa <vector94>:
.globl vector94
vector94:
  pushl $0
  1017fa:	6a 00                	push   $0x0
  pushl $94
  1017fc:	6a 5e                	push   $0x5e
  jmp alltraps
  1017fe:	e9 ad fa ff ff       	jmp    1012b0 <alltraps>

00101803 <vector95>:
.globl vector95
vector95:
  pushl $0
  101803:	6a 00                	push   $0x0
  pushl $95
  101805:	6a 5f                	push   $0x5f
  jmp alltraps
  101807:	e9 a4 fa ff ff       	jmp    1012b0 <alltraps>

0010180c <vector96>:
.globl vector96
vector96:
  pushl $0
  10180c:	6a 00                	push   $0x0
  pushl $96
  10180e:	6a 60                	push   $0x60
  jmp alltraps
  101810:	e9 9b fa ff ff       	jmp    1012b0 <alltraps>

00101815 <vector97>:
.globl vector97
vector97:
  pushl $0
  101815:	6a 00                	push   $0x0
  pushl $97
  101817:	6a 61                	push   $0x61
  jmp alltraps
  101819:	e9 92 fa ff ff       	jmp    1012b0 <alltraps>

0010181e <vector98>:
.globl vector98
vector98:
  pushl $0
  10181e:	6a 00                	push   $0x0
  pushl $98
  101820:	6a 62                	push   $0x62
  jmp alltraps
  101822:	e9 89 fa ff ff       	jmp    1012b0 <alltraps>

00101827 <vector99>:
.globl vector99
vector99:
  pushl $0
  101827:	6a 00                	push   $0x0
  pushl $99
  101829:	6a 63                	push   $0x63
  jmp alltraps
  10182b:	e9 80 fa ff ff       	jmp    1012b0 <alltraps>

00101830 <vector100>:
.globl vector100
vector100:
  pushl $0
  101830:	6a 00                	push   $0x0
  pushl $100
  101832:	6a 64                	push   $0x64
  jmp alltraps
  101834:	e9 77 fa ff ff       	jmp    1012b0 <alltraps>

00101839 <vector101>:
.globl vector101
vector101:
  pushl $0
  101839:	6a 00                	push   $0x0
  pushl $101
  10183b:	6a 65                	push   $0x65
  jmp alltraps
  10183d:	e9 6e fa ff ff       	jmp    1012b0 <alltraps>

00101842 <vector102>:
.globl vector102
vector102:
  pushl $0
  101842:	6a 00                	push   $0x0
  pushl $102
  101844:	6a 66                	push   $0x66
  jmp alltraps
  101846:	e9 65 fa ff ff       	jmp    1012b0 <alltraps>

0010184b <vector103>:
.globl vector103
vector103:
  pushl $0
  10184b:	6a 00                	push   $0x0
  pushl $103
  10184d:	6a 67                	push   $0x67
  jmp alltraps
  10184f:	e9 5c fa ff ff       	jmp    1012b0 <alltraps>

00101854 <vector104>:
.globl vector104
vector104:
  pushl $0
  101854:	6a 00                	push   $0x0
  pushl $104
  101856:	6a 68                	push   $0x68
  jmp alltraps
  101858:	e9 53 fa ff ff       	jmp    1012b0 <alltraps>

0010185d <vector105>:
.globl vector105
vector105:
  pushl $0
  10185d:	6a 00                	push   $0x0
  pushl $105
  10185f:	6a 69                	push   $0x69
  jmp alltraps
  101861:	e9 4a fa ff ff       	jmp    1012b0 <alltraps>

00101866 <vector106>:
.globl vector106
vector106:
  pushl $0
  101866:	6a 00                	push   $0x0
  pushl $106
  101868:	6a 6a                	push   $0x6a
  jmp alltraps
  10186a:	e9 41 fa ff ff       	jmp    1012b0 <alltraps>

0010186f <vector107>:
.globl vector107
vector107:
  pushl $0
  10186f:	6a 00                	push   $0x0
  pushl $107
  101871:	6a 6b                	push   $0x6b
  jmp alltraps
  101873:	e9 38 fa ff ff       	jmp    1012b0 <alltraps>

00101878 <vector108>:
.globl vector108
vector108:
  pushl $0
  101878:	6a 00                	push   $0x0
  pushl $108
  10187a:	6a 6c                	push   $0x6c
  jmp alltraps
  10187c:	e9 2f fa ff ff       	jmp    1012b0 <alltraps>

00101881 <vector109>:
.globl vector109
vector109:
  pushl $0
  101881:	6a 00                	push   $0x0
  pushl $109
  101883:	6a 6d                	push   $0x6d
  jmp alltraps
  101885:	e9 26 fa ff ff       	jmp    1012b0 <alltraps>

0010188a <vector110>:
.globl vector110
vector110:
  pushl $0
  10188a:	6a 00                	push   $0x0
  pushl $110
  10188c:	6a 6e                	push   $0x6e
  jmp alltraps
  10188e:	e9 1d fa ff ff       	jmp    1012b0 <alltraps>

00101893 <vector111>:
.globl vector111
vector111:
  pushl $0
  101893:	6a 00                	push   $0x0
  pushl $111
  101895:	6a 6f                	push   $0x6f
  jmp alltraps
  101897:	e9 14 fa ff ff       	jmp    1012b0 <alltraps>

0010189c <vector112>:
.globl vector112
vector112:
  pushl $0
  10189c:	6a 00                	push   $0x0
  pushl $112
  10189e:	6a 70                	push   $0x70
  jmp alltraps
  1018a0:	e9 0b fa ff ff       	jmp    1012b0 <alltraps>

001018a5 <vector113>:
.globl vector113
vector113:
  pushl $0
  1018a5:	6a 00                	push   $0x0
  pushl $113
  1018a7:	6a 71                	push   $0x71
  jmp alltraps
  1018a9:	e9 02 fa ff ff       	jmp    1012b0 <alltraps>

001018ae <vector114>:
.globl vector114
vector114:
  pushl $0
  1018ae:	6a 00                	push   $0x0
  pushl $114
  1018b0:	6a 72                	push   $0x72
  jmp alltraps
  1018b2:	e9 f9 f9 ff ff       	jmp    1012b0 <alltraps>

001018b7 <vector115>:
.globl vector115
vector115:
  pushl $0
  1018b7:	6a 00                	push   $0x0
  pushl $115
  1018b9:	6a 73                	push   $0x73
  jmp alltraps
  1018bb:	e9 f0 f9 ff ff       	jmp    1012b0 <alltraps>

001018c0 <vector116>:
.globl vector116
vector116:
  pushl $0
  1018c0:	6a 00                	push   $0x0
  pushl $116
  1018c2:	6a 74                	push   $0x74
  jmp alltraps
  1018c4:	e9 e7 f9 ff ff       	jmp    1012b0 <alltraps>

001018c9 <vector117>:
.globl vector117
vector117:
  pushl $0
  1018c9:	6a 00                	push   $0x0
  pushl $117
  1018cb:	6a 75                	push   $0x75
  jmp alltraps
  1018cd:	e9 de f9 ff ff       	jmp    1012b0 <alltraps>

001018d2 <vector118>:
.globl vector118
vector118:
  pushl $0
  1018d2:	6a 00                	push   $0x0
  pushl $118
  1018d4:	6a 76                	push   $0x76
  jmp alltraps
  1018d6:	e9 d5 f9 ff ff       	jmp    1012b0 <alltraps>

001018db <vector119>:
.globl vector119
vector119:
  pushl $0
  1018db:	6a 00                	push   $0x0
  pushl $119
  1018dd:	6a 77                	push   $0x77
  jmp alltraps
  1018df:	e9 cc f9 ff ff       	jmp    1012b0 <alltraps>

001018e4 <vector120>:
.globl vector120
vector120:
  pushl $0
  1018e4:	6a 00                	push   $0x0
  pushl $120
  1018e6:	6a 78                	push   $0x78
  jmp alltraps
  1018e8:	e9 c3 f9 ff ff       	jmp    1012b0 <alltraps>

001018ed <vector121>:
.globl vector121
vector121:
  pushl $0
  1018ed:	6a 00                	push   $0x0
  pushl $121
  1018ef:	6a 79                	push   $0x79
  jmp alltraps
  1018f1:	e9 ba f9 ff ff       	jmp    1012b0 <alltraps>

001018f6 <vector122>:
.globl vector122
vector122:
  pushl $0
  1018f6:	6a 00                	push   $0x0
  pushl $122
  1018f8:	6a 7a                	push   $0x7a
  jmp alltraps
  1018fa:	e9 b1 f9 ff ff       	jmp    1012b0 <alltraps>

001018ff <vector123>:
.globl vector123
vector123:
  pushl $0
  1018ff:	6a 00                	push   $0x0
  pushl $123
  101901:	6a 7b                	push   $0x7b
  jmp alltraps
  101903:	e9 a8 f9 ff ff       	jmp    1012b0 <alltraps>

00101908 <vector124>:
.globl vector124
vector124:
  pushl $0
  101908:	6a 00                	push   $0x0
  pushl $124
  10190a:	6a 7c                	push   $0x7c
  jmp alltraps
  10190c:	e9 9f f9 ff ff       	jmp    1012b0 <alltraps>

00101911 <vector125>:
.globl vector125
vector125:
  pushl $0
  101911:	6a 00                	push   $0x0
  pushl $125
  101913:	6a 7d                	push   $0x7d
  jmp alltraps
  101915:	e9 96 f9 ff ff       	jmp    1012b0 <alltraps>

0010191a <vector126>:
.globl vector126
vector126:
  pushl $0
  10191a:	6a 00                	push   $0x0
  pushl $126
  10191c:	6a 7e                	push   $0x7e
  jmp alltraps
  10191e:	e9 8d f9 ff ff       	jmp    1012b0 <alltraps>

00101923 <vector127>:
.globl vector127
vector127:
  pushl $0
  101923:	6a 00                	push   $0x0
  pushl $127
  101925:	6a 7f                	push   $0x7f
  jmp alltraps
  101927:	e9 84 f9 ff ff       	jmp    1012b0 <alltraps>

0010192c <vector128>:
.globl vector128
vector128:
  pushl $0
  10192c:	6a 00                	push   $0x0
  pushl $128
  10192e:	68 80 00 00 00       	push   $0x80
  jmp alltraps
  101933:	e9 78 f9 ff ff       	jmp    1012b0 <alltraps>

00101938 <vector129>:
.globl vector129
vector129:
  pushl $0
  101938:	6a 00                	push   $0x0
  pushl $129
  10193a:	68 81 00 00 00       	push   $0x81
  jmp alltraps
  10193f:	e9 6c f9 ff ff       	jmp    1012b0 <alltraps>

00101944 <vector130>:
.globl vector130
vector130:
  pushl $0
  101944:	6a 00                	push   $0x0
  pushl $130
  101946:	68 82 00 00 00       	push   $0x82
  jmp alltraps
  10194b:	e9 60 f9 ff ff       	jmp    1012b0 <alltraps>

00101950 <vector131>:
.globl vector131
vector131:
  pushl $0
  101950:	6a 00                	push   $0x0
  pushl $131
  101952:	68 83 00 00 00       	push   $0x83
  jmp alltraps
  101957:	e9 54 f9 ff ff       	jmp    1012b0 <alltraps>

0010195c <vector132>:
.globl vector132
vector132:
  pushl $0
  10195c:	6a 00                	push   $0x0
  pushl $132
  10195e:	68 84 00 00 00       	push   $0x84
  jmp alltraps
  101963:	e9 48 f9 ff ff       	jmp    1012b0 <alltraps>

00101968 <vector133>:
.globl vector133
vector133:
  pushl $0
  101968:	6a 00                	push   $0x0
  pushl $133
  10196a:	68 85 00 00 00       	push   $0x85
  jmp alltraps
  10196f:	e9 3c f9 ff ff       	jmp    1012b0 <alltraps>

00101974 <vector134>:
.globl vector134
vector134:
  pushl $0
  101974:	6a 00                	push   $0x0
  pushl $134
  101976:	68 86 00 00 00       	push   $0x86
  jmp alltraps
  10197b:	e9 30 f9 ff ff       	jmp    1012b0 <alltraps>

00101980 <vector135>:
.globl vector135
vector135:
  pushl $0
  101980:	6a 00                	push   $0x0
  pushl $135
  101982:	68 87 00 00 00       	push   $0x87
  jmp alltraps
  101987:	e9 24 f9 ff ff       	jmp    1012b0 <alltraps>

0010198c <vector136>:
.globl vector136
vector136:
  pushl $0
  10198c:	6a 00                	push   $0x0
  pushl $136
  10198e:	68 88 00 00 00       	push   $0x88
  jmp alltraps
  101993:	e9 18 f9 ff ff       	jmp    1012b0 <alltraps>

00101998 <vector137>:
.globl vector137
vector137:
  pushl $0
  101998:	6a 00                	push   $0x0
  pushl $137
  10199a:	68 89 00 00 00       	push   $0x89
  jmp alltraps
  10199f:	e9 0c f9 ff ff       	jmp    1012b0 <alltraps>

001019a4 <vector138>:
.globl vector138
vector138:
  pushl $0
  1019a4:	6a 00                	push   $0x0
  pushl $138
  1019a6:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
  1019ab:	e9 00 f9 ff ff       	jmp    1012b0 <alltraps>

001019b0 <vector139>:
.globl vector139
vector139:
  pushl $0
  1019b0:	6a 00                	push   $0x0
  pushl $139
  1019b2:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
  1019b7:	e9 f4 f8 ff ff       	jmp    1012b0 <alltraps>

001019bc <vector140>:
.globl vector140
vector140:
  pushl $0
  1019bc:	6a 00                	push   $0x0
  pushl $140
  1019be:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
  1019c3:	e9 e8 f8 ff ff       	jmp    1012b0 <alltraps>

001019c8 <vector141>:
.globl vector141
vector141:
  pushl $0
  1019c8:	6a 00                	push   $0x0
  pushl $141
  1019ca:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
  1019cf:	e9 dc f8 ff ff       	jmp    1012b0 <alltraps>

001019d4 <vector142>:
.globl vector142
vector142:
  pushl $0
  1019d4:	6a 00                	push   $0x0
  pushl $142
  1019d6:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
  1019db:	e9 d0 f8 ff ff       	jmp    1012b0 <alltraps>

001019e0 <vector143>:
.globl vector143
vector143:
  pushl $0
  1019e0:	6a 00                	push   $0x0
  pushl $143
  1019e2:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
  1019e7:	e9 c4 f8 ff ff       	jmp    1012b0 <alltraps>

001019ec <vector144>:
.globl vector144
vector144:
  pushl $0
  1019ec:	6a 00                	push   $0x0
  pushl $144
  1019ee:	68 90 00 00 00       	push   $0x90
  jmp alltraps
  1019f3:	e9 b8 f8 ff ff       	jmp    1012b0 <alltraps>

001019f8 <vector145>:
.globl vector145
vector145:
  pushl $0
  1019f8:	6a 00                	push   $0x0
  pushl $145
  1019fa:	68 91 00 00 00       	push   $0x91
  jmp alltraps
  1019ff:	e9 ac f8 ff ff       	jmp    1012b0 <alltraps>

00101a04 <vector146>:
.globl vector146
vector146:
  pushl $0
  101a04:	6a 00                	push   $0x0
  pushl $146
  101a06:	68 92 00 00 00       	push   $0x92
  jmp alltraps
  101a0b:	e9 a0 f8 ff ff       	jmp    1012b0 <alltraps>

00101a10 <vector147>:
.globl vector147
vector147:
  pushl $0
  101a10:	6a 00                	push   $0x0
  pushl $147
  101a12:	68 93 00 00 00       	push   $0x93
  jmp alltraps
  101a17:	e9 94 f8 ff ff       	jmp    1012b0 <alltraps>

00101a1c <vector148>:
.globl vector148
vector148:
  pushl $0
  101a1c:	6a 00                	push   $0x0
  pushl $148
  101a1e:	68 94 00 00 00       	push   $0x94
  jmp alltraps
  101a23:	e9 88 f8 ff ff       	jmp    1012b0 <alltraps>

00101a28 <vector149>:
.globl vector149
vector149:
  pushl $0
  101a28:	6a 00                	push   $0x0
  pushl $149
  101a2a:	68 95 00 00 00       	push   $0x95
  jmp alltraps
  101a2f:	e9 7c f8 ff ff       	jmp    1012b0 <alltraps>

00101a34 <vector150>:
.globl vector150
vector150:
  pushl $0
  101a34:	6a 00                	push   $0x0
  pushl $150
  101a36:	68 96 00 00 00       	push   $0x96
  jmp alltraps
  101a3b:	e9 70 f8 ff ff       	jmp    1012b0 <alltraps>

00101a40 <vector151>:
.globl vector151
vector151:
  pushl $0
  101a40:	6a 00                	push   $0x0
  pushl $151
  101a42:	68 97 00 00 00       	push   $0x97
  jmp alltraps
  101a47:	e9 64 f8 ff ff       	jmp    1012b0 <alltraps>

00101a4c <vector152>:
.globl vector152
vector152:
  pushl $0
  101a4c:	6a 00                	push   $0x0
  pushl $152
  101a4e:	68 98 00 00 00       	push   $0x98
  jmp alltraps
  101a53:	e9 58 f8 ff ff       	jmp    1012b0 <alltraps>

00101a58 <vector153>:
.globl vector153
vector153:
  pushl $0
  101a58:	6a 00                	push   $0x0
  pushl $153
  101a5a:	68 99 00 00 00       	push   $0x99
  jmp alltraps
  101a5f:	e9 4c f8 ff ff       	jmp    1012b0 <alltraps>

00101a64 <vector154>:
.globl vector154
vector154:
  pushl $0
  101a64:	6a 00                	push   $0x0
  pushl $154
  101a66:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
  101a6b:	e9 40 f8 ff ff       	jmp    1012b0 <alltraps>

00101a70 <vector155>:
.globl vector155
vector155:
  pushl $0
  101a70:	6a 00                	push   $0x0
  pushl $155
  101a72:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
  101a77:	e9 34 f8 ff ff       	jmp    1012b0 <alltraps>

00101a7c <vector156>:
.globl vector156
vector156:
  pushl $0
  101a7c:	6a 00                	push   $0x0
  pushl $156
  101a7e:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
  101a83:	e9 28 f8 ff ff       	jmp    1012b0 <alltraps>

00101a88 <vector157>:
.globl vector157
vector157:
  pushl $0
  101a88:	6a 00                	push   $0x0
  pushl $157
  101a8a:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
  101a8f:	e9 1c f8 ff ff       	jmp    1012b0 <alltraps>

00101a94 <vector158>:
.globl vector158
vector158:
  pushl $0
  101a94:	6a 00                	push   $0x0
  pushl $158
  101a96:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
  101a9b:	e9 10 f8 ff ff       	jmp    1012b0 <alltraps>

00101aa0 <vector159>:
.globl vector159
vector159:
  pushl $0
  101aa0:	6a 00                	push   $0x0
  pushl $159
  101aa2:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
  101aa7:	e9 04 f8 ff ff       	jmp    1012b0 <alltraps>

00101aac <vector160>:
.globl vector160
vector160:
  pushl $0
  101aac:	6a 00                	push   $0x0
  pushl $160
  101aae:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
  101ab3:	e9 f8 f7 ff ff       	jmp    1012b0 <alltraps>

00101ab8 <vector161>:
.globl vector161
vector161:
  pushl $0
  101ab8:	6a 00                	push   $0x0
  pushl $161
  101aba:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
  101abf:	e9 ec f7 ff ff       	jmp    1012b0 <alltraps>

00101ac4 <vector162>:
.globl vector162
vector162:
  pushl $0
  101ac4:	6a 00                	push   $0x0
  pushl $162
  101ac6:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
  101acb:	e9 e0 f7 ff ff       	jmp    1012b0 <alltraps>

00101ad0 <vector163>:
.globl vector163
vector163:
  pushl $0
  101ad0:	6a 00                	push   $0x0
  pushl $163
  101ad2:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
  101ad7:	e9 d4 f7 ff ff       	jmp    1012b0 <alltraps>

00101adc <vector164>:
.globl vector164
vector164:
  pushl $0
  101adc:	6a 00                	push   $0x0
  pushl $164
  101ade:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
  101ae3:	e9 c8 f7 ff ff       	jmp    1012b0 <alltraps>

00101ae8 <vector165>:
.globl vector165
vector165:
  pushl $0
  101ae8:	6a 00                	push   $0x0
  pushl $165
  101aea:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
  101aef:	e9 bc f7 ff ff       	jmp    1012b0 <alltraps>

00101af4 <vector166>:
.globl vector166
vector166:
  pushl $0
  101af4:	6a 00                	push   $0x0
  pushl $166
  101af6:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
  101afb:	e9 b0 f7 ff ff       	jmp    1012b0 <alltraps>

00101b00 <vector167>:
.globl vector167
vector167:
  pushl $0
  101b00:	6a 00                	push   $0x0
  pushl $167
  101b02:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
  101b07:	e9 a4 f7 ff ff       	jmp    1012b0 <alltraps>

00101b0c <vector168>:
.globl vector168
vector168:
  pushl $0
  101b0c:	6a 00                	push   $0x0
  pushl $168
  101b0e:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
  101b13:	e9 98 f7 ff ff       	jmp    1012b0 <alltraps>

00101b18 <vector169>:
.globl vector169
vector169:
  pushl $0
  101b18:	6a 00                	push   $0x0
  pushl $169
  101b1a:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
  101b1f:	e9 8c f7 ff ff       	jmp    1012b0 <alltraps>

00101b24 <vector170>:
.globl vector170
vector170:
  pushl $0
  101b24:	6a 00                	push   $0x0
  pushl $170
  101b26:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
  101b2b:	e9 80 f7 ff ff       	jmp    1012b0 <alltraps>

00101b30 <vector171>:
.globl vector171
vector171:
  pushl $0
  101b30:	6a 00                	push   $0x0
  pushl $171
  101b32:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
  101b37:	e9 74 f7 ff ff       	jmp    1012b0 <alltraps>

00101b3c <vector172>:
.globl vector172
vector172:
  pushl $0
  101b3c:	6a 00                	push   $0x0
  pushl $172
  101b3e:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
  101b43:	e9 68 f7 ff ff       	jmp    1012b0 <alltraps>

00101b48 <vector173>:
.globl vector173
vector173:
  pushl $0
  101b48:	6a 00                	push   $0x0
  pushl $173
  101b4a:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
  101b4f:	e9 5c f7 ff ff       	jmp    1012b0 <alltraps>

00101b54 <vector174>:
.globl vector174
vector174:
  pushl $0
  101b54:	6a 00                	push   $0x0
  pushl $174
  101b56:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
  101b5b:	e9 50 f7 ff ff       	jmp    1012b0 <alltraps>

00101b60 <vector175>:
.globl vector175
vector175:
  pushl $0
  101b60:	6a 00                	push   $0x0
  pushl $175
  101b62:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
  101b67:	e9 44 f7 ff ff       	jmp    1012b0 <alltraps>

00101b6c <vector176>:
.globl vector176
vector176:
  pushl $0
  101b6c:	6a 00                	push   $0x0
  pushl $176
  101b6e:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
  101b73:	e9 38 f7 ff ff       	jmp    1012b0 <alltraps>

00101b78 <vector177>:
.globl vector177
vector177:
  pushl $0
  101b78:	6a 00                	push   $0x0
  pushl $177
  101b7a:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
  101b7f:	e9 2c f7 ff ff       	jmp    1012b0 <alltraps>

00101b84 <vector178>:
.globl vector178
vector178:
  pushl $0
  101b84:	6a 00                	push   $0x0
  pushl $178
  101b86:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
  101b8b:	e9 20 f7 ff ff       	jmp    1012b0 <alltraps>

00101b90 <vector179>:
.globl vector179
vector179:
  pushl $0
  101b90:	6a 00                	push   $0x0
  pushl $179
  101b92:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
  101b97:	e9 14 f7 ff ff       	jmp    1012b0 <alltraps>

00101b9c <vector180>:
.globl vector180
vector180:
  pushl $0
  101b9c:	6a 00                	push   $0x0
  pushl $180
  101b9e:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
  101ba3:	e9 08 f7 ff ff       	jmp    1012b0 <alltraps>

00101ba8 <vector181>:
.globl vector181
vector181:
  pushl $0
  101ba8:	6a 00                	push   $0x0
  pushl $181
  101baa:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
  101baf:	e9 fc f6 ff ff       	jmp    1012b0 <alltraps>

00101bb4 <vector182>:
.globl vector182
vector182:
  pushl $0
  101bb4:	6a 00                	push   $0x0
  pushl $182
  101bb6:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
  101bbb:	e9 f0 f6 ff ff       	jmp    1012b0 <alltraps>

00101bc0 <vector183>:
.globl vector183
vector183:
  pushl $0
  101bc0:	6a 00                	push   $0x0
  pushl $183
  101bc2:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
  101bc7:	e9 e4 f6 ff ff       	jmp    1012b0 <alltraps>

00101bcc <vector184>:
.globl vector184
vector184:
  pushl $0
  101bcc:	6a 00                	push   $0x0
  pushl $184
  101bce:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
  101bd3:	e9 d8 f6 ff ff       	jmp    1012b0 <alltraps>

00101bd8 <vector185>:
.globl vector185
vector185:
  pushl $0
  101bd8:	6a 00                	push   $0x0
  pushl $185
  101bda:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
  101bdf:	e9 cc f6 ff ff       	jmp    1012b0 <alltraps>

00101be4 <vector186>:
.globl vector186
vector186:
  pushl $0
  101be4:	6a 00                	push   $0x0
  pushl $186
  101be6:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
  101beb:	e9 c0 f6 ff ff       	jmp    1012b0 <alltraps>

00101bf0 <vector187>:
.globl vector187
vector187:
  pushl $0
  101bf0:	6a 00                	push   $0x0
  pushl $187
  101bf2:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
  101bf7:	e9 b4 f6 ff ff       	jmp    1012b0 <alltraps>

00101bfc <vector188>:
.globl vector188
vector188:
  pushl $0
  101bfc:	6a 00                	push   $0x0
  pushl $188
  101bfe:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
  101c03:	e9 a8 f6 ff ff       	jmp    1012b0 <alltraps>

00101c08 <vector189>:
.globl vector189
vector189:
  pushl $0
  101c08:	6a 00                	push   $0x0
  pushl $189
  101c0a:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
  101c0f:	e9 9c f6 ff ff       	jmp    1012b0 <alltraps>

00101c14 <vector190>:
.globl vector190
vector190:
  pushl $0
  101c14:	6a 00                	push   $0x0
  pushl $190
  101c16:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
  101c1b:	e9 90 f6 ff ff       	jmp    1012b0 <alltraps>

00101c20 <vector191>:
.globl vector191
vector191:
  pushl $0
  101c20:	6a 00                	push   $0x0
  pushl $191
  101c22:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
  101c27:	e9 84 f6 ff ff       	jmp    1012b0 <alltraps>

00101c2c <vector192>:
.globl vector192
vector192:
  pushl $0
  101c2c:	6a 00                	push   $0x0
  pushl $192
  101c2e:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
  101c33:	e9 78 f6 ff ff       	jmp    1012b0 <alltraps>

00101c38 <vector193>:
.globl vector193
vector193:
  pushl $0
  101c38:	6a 00                	push   $0x0
  pushl $193
  101c3a:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
  101c3f:	e9 6c f6 ff ff       	jmp    1012b0 <alltraps>

00101c44 <vector194>:
.globl vector194
vector194:
  pushl $0
  101c44:	6a 00                	push   $0x0
  pushl $194
  101c46:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
  101c4b:	e9 60 f6 ff ff       	jmp    1012b0 <alltraps>

00101c50 <vector195>:
.globl vector195
vector195:
  pushl $0
  101c50:	6a 00                	push   $0x0
  pushl $195
  101c52:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
  101c57:	e9 54 f6 ff ff       	jmp    1012b0 <alltraps>

00101c5c <vector196>:
.globl vector196
vector196:
  pushl $0
  101c5c:	6a 00                	push   $0x0
  pushl $196
  101c5e:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
  101c63:	e9 48 f6 ff ff       	jmp    1012b0 <alltraps>

00101c68 <vector197>:
.globl vector197
vector197:
  pushl $0
  101c68:	6a 00                	push   $0x0
  pushl $197
  101c6a:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
  101c6f:	e9 3c f6 ff ff       	jmp    1012b0 <alltraps>

00101c74 <vector198>:
.globl vector198
vector198:
  pushl $0
  101c74:	6a 00                	push   $0x0
  pushl $198
  101c76:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
  101c7b:	e9 30 f6 ff ff       	jmp    1012b0 <alltraps>

00101c80 <vector199>:
.globl vector199
vector199:
  pushl $0
  101c80:	6a 00                	push   $0x0
  pushl $199
  101c82:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
  101c87:	e9 24 f6 ff ff       	jmp    1012b0 <alltraps>

00101c8c <vector200>:
.globl vector200
vector200:
  pushl $0
  101c8c:	6a 00                	push   $0x0
  pushl $200
  101c8e:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
  101c93:	e9 18 f6 ff ff       	jmp    1012b0 <alltraps>

00101c98 <vector201>:
.globl vector201
vector201:
  pushl $0
  101c98:	6a 00                	push   $0x0
  pushl $201
  101c9a:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
  101c9f:	e9 0c f6 ff ff       	jmp    1012b0 <alltraps>

00101ca4 <vector202>:
.globl vector202
vector202:
  pushl $0
  101ca4:	6a 00                	push   $0x0
  pushl $202
  101ca6:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
  101cab:	e9 00 f6 ff ff       	jmp    1012b0 <alltraps>

00101cb0 <vector203>:
.globl vector203
vector203:
  pushl $0
  101cb0:	6a 00                	push   $0x0
  pushl $203
  101cb2:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
  101cb7:	e9 f4 f5 ff ff       	jmp    1012b0 <alltraps>

00101cbc <vector204>:
.globl vector204
vector204:
  pushl $0
  101cbc:	6a 00                	push   $0x0
  pushl $204
  101cbe:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
  101cc3:	e9 e8 f5 ff ff       	jmp    1012b0 <alltraps>

00101cc8 <vector205>:
.globl vector205
vector205:
  pushl $0
  101cc8:	6a 00                	push   $0x0
  pushl $205
  101cca:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
  101ccf:	e9 dc f5 ff ff       	jmp    1012b0 <alltraps>

00101cd4 <vector206>:
.globl vector206
vector206:
  pushl $0
  101cd4:	6a 00                	push   $0x0
  pushl $206
  101cd6:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
  101cdb:	e9 d0 f5 ff ff       	jmp    1012b0 <alltraps>

00101ce0 <vector207>:
.globl vector207
vector207:
  pushl $0
  101ce0:	6a 00                	push   $0x0
  pushl $207
  101ce2:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
  101ce7:	e9 c4 f5 ff ff       	jmp    1012b0 <alltraps>

00101cec <vector208>:
.globl vector208
vector208:
  pushl $0
  101cec:	6a 00                	push   $0x0
  pushl $208
  101cee:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
  101cf3:	e9 b8 f5 ff ff       	jmp    1012b0 <alltraps>

00101cf8 <vector209>:
.globl vector209
vector209:
  pushl $0
  101cf8:	6a 00                	push   $0x0
  pushl $209
  101cfa:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
  101cff:	e9 ac f5 ff ff       	jmp    1012b0 <alltraps>

00101d04 <vector210>:
.globl vector210
vector210:
  pushl $0
  101d04:	6a 00                	push   $0x0
  pushl $210
  101d06:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
  101d0b:	e9 a0 f5 ff ff       	jmp    1012b0 <alltraps>

00101d10 <vector211>:
.globl vector211
vector211:
  pushl $0
  101d10:	6a 00                	push   $0x0
  pushl $211
  101d12:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
  101d17:	e9 94 f5 ff ff       	jmp    1012b0 <alltraps>

00101d1c <vector212>:
.globl vector212
vector212:
  pushl $0
  101d1c:	6a 00                	push   $0x0
  pushl $212
  101d1e:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
  101d23:	e9 88 f5 ff ff       	jmp    1012b0 <alltraps>

00101d28 <vector213>:
.globl vector213
vector213:
  pushl $0
  101d28:	6a 00                	push   $0x0
  pushl $213
  101d2a:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
  101d2f:	e9 7c f5 ff ff       	jmp    1012b0 <alltraps>

00101d34 <vector214>:
.globl vector214
vector214:
  pushl $0
  101d34:	6a 00                	push   $0x0
  pushl $214
  101d36:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
  101d3b:	e9 70 f5 ff ff       	jmp    1012b0 <alltraps>

00101d40 <vector215>:
.globl vector215
vector215:
  pushl $0
  101d40:	6a 00                	push   $0x0
  pushl $215
  101d42:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
  101d47:	e9 64 f5 ff ff       	jmp    1012b0 <alltraps>

00101d4c <vector216>:
.globl vector216
vector216:
  pushl $0
  101d4c:	6a 00                	push   $0x0
  pushl $216
  101d4e:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
  101d53:	e9 58 f5 ff ff       	jmp    1012b0 <alltraps>

00101d58 <vector217>:
.globl vector217
vector217:
  pushl $0
  101d58:	6a 00                	push   $0x0
  pushl $217
  101d5a:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
  101d5f:	e9 4c f5 ff ff       	jmp    1012b0 <alltraps>

00101d64 <vector218>:
.globl vector218
vector218:
  pushl $0
  101d64:	6a 00                	push   $0x0
  pushl $218
  101d66:	68 da 00 00 00       	push   $0xda
  jmp alltraps
  101d6b:	e9 40 f5 ff ff       	jmp    1012b0 <alltraps>

00101d70 <vector219>:
.globl vector219
vector219:
  pushl $0
  101d70:	6a 00                	push   $0x0
  pushl $219
  101d72:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
  101d77:	e9 34 f5 ff ff       	jmp    1012b0 <alltraps>

00101d7c <vector220>:
.globl vector220
vector220:
  pushl $0
  101d7c:	6a 00                	push   $0x0
  pushl $220
  101d7e:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
  101d83:	e9 28 f5 ff ff       	jmp    1012b0 <alltraps>

00101d88 <vector221>:
.globl vector221
vector221:
  pushl $0
  101d88:	6a 00                	push   $0x0
  pushl $221
  101d8a:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
  101d8f:	e9 1c f5 ff ff       	jmp    1012b0 <alltraps>

00101d94 <vector222>:
.globl vector222
vector222:
  pushl $0
  101d94:	6a 00                	push   $0x0
  pushl $222
  101d96:	68 de 00 00 00       	push   $0xde
  jmp alltraps
  101d9b:	e9 10 f5 ff ff       	jmp    1012b0 <alltraps>

00101da0 <vector223>:
.globl vector223
vector223:
  pushl $0
  101da0:	6a 00                	push   $0x0
  pushl $223
  101da2:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
  101da7:	e9 04 f5 ff ff       	jmp    1012b0 <alltraps>

00101dac <vector224>:
.globl vector224
vector224:
  pushl $0
  101dac:	6a 00                	push   $0x0
  pushl $224
  101dae:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
  101db3:	e9 f8 f4 ff ff       	jmp    1012b0 <alltraps>

00101db8 <vector225>:
.globl vector225
vector225:
  pushl $0
  101db8:	6a 00                	push   $0x0
  pushl $225
  101dba:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
  101dbf:	e9 ec f4 ff ff       	jmp    1012b0 <alltraps>

00101dc4 <vector226>:
.globl vector226
vector226:
  pushl $0
  101dc4:	6a 00                	push   $0x0
  pushl $226
  101dc6:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
  101dcb:	e9 e0 f4 ff ff       	jmp    1012b0 <alltraps>

00101dd0 <vector227>:
.globl vector227
vector227:
  pushl $0
  101dd0:	6a 00                	push   $0x0
  pushl $227
  101dd2:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
  101dd7:	e9 d4 f4 ff ff       	jmp    1012b0 <alltraps>

00101ddc <vector228>:
.globl vector228
vector228:
  pushl $0
  101ddc:	6a 00                	push   $0x0
  pushl $228
  101dde:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
  101de3:	e9 c8 f4 ff ff       	jmp    1012b0 <alltraps>

00101de8 <vector229>:
.globl vector229
vector229:
  pushl $0
  101de8:	6a 00                	push   $0x0
  pushl $229
  101dea:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
  101def:	e9 bc f4 ff ff       	jmp    1012b0 <alltraps>

00101df4 <vector230>:
.globl vector230
vector230:
  pushl $0
  101df4:	6a 00                	push   $0x0
  pushl $230
  101df6:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
  101dfb:	e9 b0 f4 ff ff       	jmp    1012b0 <alltraps>

00101e00 <vector231>:
.globl vector231
vector231:
  pushl $0
  101e00:	6a 00                	push   $0x0
  pushl $231
  101e02:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
  101e07:	e9 a4 f4 ff ff       	jmp    1012b0 <alltraps>

00101e0c <vector232>:
.globl vector232
vector232:
  pushl $0
  101e0c:	6a 00                	push   $0x0
  pushl $232
  101e0e:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
  101e13:	e9 98 f4 ff ff       	jmp    1012b0 <alltraps>

00101e18 <vector233>:
.globl vector233
vector233:
  pushl $0
  101e18:	6a 00                	push   $0x0
  pushl $233
  101e1a:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
  101e1f:	e9 8c f4 ff ff       	jmp    1012b0 <alltraps>

00101e24 <vector234>:
.globl vector234
vector234:
  pushl $0
  101e24:	6a 00                	push   $0x0
  pushl $234
  101e26:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
  101e2b:	e9 80 f4 ff ff       	jmp    1012b0 <alltraps>

00101e30 <vector235>:
.globl vector235
vector235:
  pushl $0
  101e30:	6a 00                	push   $0x0
  pushl $235
  101e32:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
  101e37:	e9 74 f4 ff ff       	jmp    1012b0 <alltraps>

00101e3c <vector236>:
.globl vector236
vector236:
  pushl $0
  101e3c:	6a 00                	push   $0x0
  pushl $236
  101e3e:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
  101e43:	e9 68 f4 ff ff       	jmp    1012b0 <alltraps>

00101e48 <vector237>:
.globl vector237
vector237:
  pushl $0
  101e48:	6a 00                	push   $0x0
  pushl $237
  101e4a:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
  101e4f:	e9 5c f4 ff ff       	jmp    1012b0 <alltraps>

00101e54 <vector238>:
.globl vector238
vector238:
  pushl $0
  101e54:	6a 00                	push   $0x0
  pushl $238
  101e56:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
  101e5b:	e9 50 f4 ff ff       	jmp    1012b0 <alltraps>

00101e60 <vector239>:
.globl vector239
vector239:
  pushl $0
  101e60:	6a 00                	push   $0x0
  pushl $239
  101e62:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
  101e67:	e9 44 f4 ff ff       	jmp    1012b0 <alltraps>

00101e6c <vector240>:
.globl vector240
vector240:
  pushl $0
  101e6c:	6a 00                	push   $0x0
  pushl $240
  101e6e:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
  101e73:	e9 38 f4 ff ff       	jmp    1012b0 <alltraps>

00101e78 <vector241>:
.globl vector241
vector241:
  pushl $0
  101e78:	6a 00                	push   $0x0
  pushl $241
  101e7a:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
  101e7f:	e9 2c f4 ff ff       	jmp    1012b0 <alltraps>

00101e84 <vector242>:
.globl vector242
vector242:
  pushl $0
  101e84:	6a 00                	push   $0x0
  pushl $242
  101e86:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
  101e8b:	e9 20 f4 ff ff       	jmp    1012b0 <alltraps>

00101e90 <vector243>:
.globl vector243
vector243:
  pushl $0
  101e90:	6a 00                	push   $0x0
  pushl $243
  101e92:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
  101e97:	e9 14 f4 ff ff       	jmp    1012b0 <alltraps>

00101e9c <vector244>:
.globl vector244
vector244:
  pushl $0
  101e9c:	6a 00                	push   $0x0
  pushl $244
  101e9e:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
  101ea3:	e9 08 f4 ff ff       	jmp    1012b0 <alltraps>

00101ea8 <vector245>:
.globl vector245
vector245:
  pushl $0
  101ea8:	6a 00                	push   $0x0
  pushl $245
  101eaa:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
  101eaf:	e9 fc f3 ff ff       	jmp    1012b0 <alltraps>

00101eb4 <vector246>:
.globl vector246
vector246:
  pushl $0
  101eb4:	6a 00                	push   $0x0
  pushl $246
  101eb6:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
  101ebb:	e9 f0 f3 ff ff       	jmp    1012b0 <alltraps>

00101ec0 <vector247>:
.globl vector247
vector247:
  pushl $0
  101ec0:	6a 00                	push   $0x0
  pushl $247
  101ec2:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
  101ec7:	e9 e4 f3 ff ff       	jmp    1012b0 <alltraps>

00101ecc <vector248>:
.globl vector248
vector248:
  pushl $0
  101ecc:	6a 00                	push   $0x0
  pushl $248
  101ece:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
  101ed3:	e9 d8 f3 ff ff       	jmp    1012b0 <alltraps>

00101ed8 <vector249>:
.globl vector249
vector249:
  pushl $0
  101ed8:	6a 00                	push   $0x0
  pushl $249
  101eda:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
  101edf:	e9 cc f3 ff ff       	jmp    1012b0 <alltraps>

00101ee4 <vector250>:
.globl vector250
vector250:
  pushl $0
  101ee4:	6a 00                	push   $0x0
  pushl $250
  101ee6:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
  101eeb:	e9 c0 f3 ff ff       	jmp    1012b0 <alltraps>

00101ef0 <vector251>:
.globl vector251
vector251:
  pushl $0
  101ef0:	6a 00                	push   $0x0
  pushl $251
  101ef2:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
  101ef7:	e9 b4 f3 ff ff       	jmp    1012b0 <alltraps>

00101efc <vector252>:
.globl vector252
vector252:
  pushl $0
  101efc:	6a 00                	push   $0x0
  pushl $252
  101efe:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
  101f03:	e9 a8 f3 ff ff       	jmp    1012b0 <alltraps>

00101f08 <vector253>:
.globl vector253
vector253:
  pushl $0
  101f08:	6a 00                	push   $0x0
  pushl $253
  101f0a:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
  101f0f:	e9 9c f3 ff ff       	jmp    1012b0 <alltraps>

00101f14 <vector254>:
.globl vector254
vector254:
  pushl $0
  101f14:	6a 00                	push   $0x0
  pushl $254
  101f16:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
  101f1b:	e9 90 f3 ff ff       	jmp    1012b0 <alltraps>

00101f20 <vector255>:
.globl vector255
vector255:
  pushl $0
  101f20:	6a 00                	push   $0x0
  pushl $255
  101f22:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
  101f27:	e9 84 f3 ff ff       	jmp    1012b0 <alltraps>

00101f2c <add_undocache>:
} bcache;
struct buf und[LOGSIZE];
int size = 0;
int t = 0;
void add_undocache(struct buf * b)
{
  101f2c:	f3 0f 1e fb          	endbr32 
  101f30:	55                   	push   %ebp
  101f31:	89 e5                	mov    %esp,%ebp
  101f33:	57                   	push   %edi
  101f34:	56                   	push   %esi
  101f35:	53                   	push   %ebx
  101f36:	83 ec 0c             	sub    $0xc,%esp
        und[t] = *b;
  101f39:	a1 2c 54 10 00       	mov    0x10542c,%eax
  101f3e:	69 c0 1c 02 00 00    	imul   $0x21c,%eax,%eax
  101f44:	8d 90 a0 ae 10 00    	lea    0x10aea0(%eax),%edx
  101f4a:	8b 45 08             	mov    0x8(%ebp),%eax
  101f4d:	89 c3                	mov    %eax,%ebx
  101f4f:	b8 87 00 00 00       	mov    $0x87,%eax
  101f54:	89 d7                	mov    %edx,%edi
  101f56:	89 de                	mov    %ebx,%esi
  101f58:	89 c1                	mov    %eax,%ecx
  101f5a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
        t = (t + 1) % LOGSIZE;
  101f5c:	a1 2c 54 10 00       	mov    0x10542c,%eax
  101f61:	8d 48 01             	lea    0x1(%eax),%ecx
  101f64:	ba 89 88 88 88       	mov    $0x88888889,%edx
  101f69:	89 c8                	mov    %ecx,%eax
  101f6b:	f7 ea                	imul   %edx
  101f6d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  101f70:	c1 f8 04             	sar    $0x4,%eax
  101f73:	89 c2                	mov    %eax,%edx
  101f75:	89 c8                	mov    %ecx,%eax
  101f77:	c1 f8 1f             	sar    $0x1f,%eax
  101f7a:	29 c2                	sub    %eax,%edx
  101f7c:	89 d0                	mov    %edx,%eax
  101f7e:	6b c0 1e             	imul   $0x1e,%eax,%eax
  101f81:	29 c1                	sub    %eax,%ecx
  101f83:	89 c8                	mov    %ecx,%eax
  101f85:	a3 2c 54 10 00       	mov    %eax,0x10542c
        if(size < LOGSIZE){
  101f8a:	a1 28 54 10 00       	mov    0x105428,%eax
  101f8f:	83 f8 1d             	cmp    $0x1d,%eax
  101f92:	7f 0f                	jg     101fa3 <add_undocache+0x77>
                size++;
  101f94:	a1 28 54 10 00       	mov    0x105428,%eax
  101f99:	83 c0 01             	add    $0x1,%eax
  101f9c:	a3 28 54 10 00       	mov    %eax,0x105428
        } else if (size > LOGSIZE) {
                cprintf("how did this happen\n");
        } else {
        }
}
  101fa1:	eb 1a                	jmp    101fbd <add_undocache+0x91>
        } else if (size > LOGSIZE) {
  101fa3:	a1 28 54 10 00       	mov    0x105428,%eax
  101fa8:	83 f8 1e             	cmp    $0x1e,%eax
  101fab:	7e 10                	jle    101fbd <add_undocache+0x91>
                cprintf("how did this happen\n");
  101fad:	83 ec 0c             	sub    $0xc,%esp
  101fb0:	68 24 45 10 00       	push   $0x104524
  101fb5:	e8 36 e1 ff ff       	call   1000f0 <cprintf>
  101fba:	83 c4 10             	add    $0x10,%esp
}
  101fbd:	90                   	nop
  101fbe:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101fc1:	5b                   	pop    %ebx
  101fc2:	5e                   	pop    %esi
  101fc3:	5f                   	pop    %edi
  101fc4:	5d                   	pop    %ebp
  101fc5:	c3                   	ret    

00101fc6 <get_old>:

struct buf* get_old(uint blockno) {
  101fc6:	f3 0f 1e fb          	endbr32 
  101fca:	55                   	push   %ebp
  101fcb:	89 e5                	mov    %esp,%ebp
  101fcd:	83 ec 10             	sub    $0x10,%esp
	int ctr = 0;
  101fd0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
        for(int i = (t - 1) % LOGSIZE; i != (t - size - 1) %LOGSIZE; i = (i-1)%LOGSIZE)
  101fd7:	a1 2c 54 10 00       	mov    0x10542c,%eax
  101fdc:	8d 48 ff             	lea    -0x1(%eax),%ecx
  101fdf:	ba 89 88 88 88       	mov    $0x88888889,%edx
  101fe4:	89 c8                	mov    %ecx,%eax
  101fe6:	f7 ea                	imul   %edx
  101fe8:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  101feb:	c1 f8 04             	sar    $0x4,%eax
  101fee:	89 c2                	mov    %eax,%edx
  101ff0:	89 c8                	mov    %ecx,%eax
  101ff2:	c1 f8 1f             	sar    $0x1f,%eax
  101ff5:	29 c2                	sub    %eax,%edx
  101ff7:	89 d0                	mov    %edx,%eax
  101ff9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  101ffc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101fff:	6b c0 1e             	imul   $0x1e,%eax,%eax
  102002:	29 c1                	sub    %eax,%ecx
  102004:	89 c8                	mov    %ecx,%eax
  102006:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102009:	eb 59                	jmp    102064 <get_old+0x9e>
        {
                if(und[i].blockno == blockno){
  10200b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10200e:	69 c0 1c 02 00 00    	imul   $0x21c,%eax,%eax
  102014:	05 a8 ae 10 00       	add    $0x10aea8,%eax
  102019:	8b 00                	mov    (%eax),%eax
  10201b:	39 45 08             	cmp    %eax,0x8(%ebp)
  10201e:	75 10                	jne    102030 <get_old+0x6a>
//			cprintf("found in %dth iteration\n", ctr);
//			cprintf("undsize = %d\n",size);
                        return &und[i];
  102020:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102023:	69 c0 1c 02 00 00    	imul   $0x21c,%eax,%eax
  102029:	05 a0 ae 10 00       	add    $0x10aea0,%eax
  10202e:	eb 75                	jmp    1020a5 <get_old+0xdf>
                }
		ctr++;
  102030:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
        for(int i = (t - 1) % LOGSIZE; i != (t - size - 1) %LOGSIZE; i = (i-1)%LOGSIZE)
  102034:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102037:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10203a:	ba 89 88 88 88       	mov    $0x88888889,%edx
  10203f:	89 c8                	mov    %ecx,%eax
  102041:	f7 ea                	imul   %edx
  102043:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  102046:	c1 f8 04             	sar    $0x4,%eax
  102049:	89 c2                	mov    %eax,%edx
  10204b:	89 c8                	mov    %ecx,%eax
  10204d:	c1 f8 1f             	sar    $0x1f,%eax
  102050:	29 c2                	sub    %eax,%edx
  102052:	89 d0                	mov    %edx,%eax
  102054:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102057:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10205a:	6b c0 1e             	imul   $0x1e,%eax,%eax
  10205d:	29 c1                	sub    %eax,%ecx
  10205f:	89 c8                	mov    %ecx,%eax
  102061:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102064:	8b 15 2c 54 10 00    	mov    0x10542c,%edx
  10206a:	a1 28 54 10 00       	mov    0x105428,%eax
  10206f:	29 c2                	sub    %eax,%edx
  102071:	89 d0                	mov    %edx,%eax
  102073:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102076:	ba 89 88 88 88       	mov    $0x88888889,%edx
  10207b:	89 c8                	mov    %ecx,%eax
  10207d:	f7 ea                	imul   %edx
  10207f:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  102082:	c1 f8 04             	sar    $0x4,%eax
  102085:	89 c2                	mov    %eax,%edx
  102087:	89 c8                	mov    %ecx,%eax
  102089:	c1 f8 1f             	sar    $0x1f,%eax
  10208c:	29 c2                	sub    %eax,%edx
  10208e:	89 d0                	mov    %edx,%eax
  102090:	6b c0 1e             	imul   $0x1e,%eax,%eax
  102093:	29 c1                	sub    %eax,%ecx
  102095:	89 c8                	mov    %ecx,%eax
  102097:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  10209a:	0f 85 6b ff ff ff    	jne    10200b <get_old+0x45>
        }
        return NULL;
  1020a0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1020a5:	c9                   	leave  
  1020a6:	c3                   	ret    

001020a7 <binit>:

void
binit(void)
{
  1020a7:	f3 0f 1e fb          	endbr32 
  1020ab:	55                   	push   %ebp
  1020ac:	89 e5                	mov    %esp,%ebp
  1020ae:	83 ec 10             	sub    $0x10,%esp
  struct buf *b;

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  1020b1:	c7 05 78 ac 10 00 68 	movl   $0x10ac68,0x10ac78
  1020b8:	ac 10 00 
  bcache.head.next = &bcache.head;
  1020bb:	c7 05 7c ac 10 00 68 	movl   $0x10ac68,0x10ac7c
  1020c2:	ac 10 00 
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
  1020c5:	c7 45 fc 20 6d 10 00 	movl   $0x106d20,-0x4(%ebp)
  1020cc:	eb 30                	jmp    1020fe <binit+0x57>
    b->next = bcache.head.next;
  1020ce:	8b 15 7c ac 10 00    	mov    0x10ac7c,%edx
  1020d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1020d7:	89 50 14             	mov    %edx,0x14(%eax)
    b->prev = &bcache.head;
  1020da:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1020dd:	c7 40 10 68 ac 10 00 	movl   $0x10ac68,0x10(%eax)
    bcache.head.next->prev = b;
  1020e4:	a1 7c ac 10 00       	mov    0x10ac7c,%eax
  1020e9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1020ec:	89 50 10             	mov    %edx,0x10(%eax)
    bcache.head.next = b;
  1020ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1020f2:	a3 7c ac 10 00       	mov    %eax,0x10ac7c
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
  1020f7:	81 45 fc 1c 02 00 00 	addl   $0x21c,-0x4(%ebp)
  1020fe:	b8 68 ac 10 00       	mov    $0x10ac68,%eax
  102103:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  102106:	72 c6                	jb     1020ce <binit+0x27>
  }
}
  102108:	90                   	nop
  102109:	90                   	nop
  10210a:	c9                   	leave  
  10210b:	c3                   	ret    

0010210c <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
  10210c:	f3 0f 1e fb          	endbr32 
  102110:	55                   	push   %ebp
  102111:	89 e5                	mov    %esp,%ebp
  102113:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
  102116:	a1 7c ac 10 00       	mov    0x10ac7c,%eax
  10211b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10211e:	eb 33                	jmp    102153 <bget+0x47>
    if(b->dev == dev && b->blockno == blockno){
  102120:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102123:	8b 40 04             	mov    0x4(%eax),%eax
  102126:	39 45 08             	cmp    %eax,0x8(%ebp)
  102129:	75 1f                	jne    10214a <bget+0x3e>
  10212b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10212e:	8b 40 08             	mov    0x8(%eax),%eax
  102131:	39 45 0c             	cmp    %eax,0xc(%ebp)
  102134:	75 14                	jne    10214a <bget+0x3e>
      b->refcnt++;
  102136:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102139:	8b 40 0c             	mov    0xc(%eax),%eax
  10213c:	8d 50 01             	lea    0x1(%eax),%edx
  10213f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102142:	89 50 0c             	mov    %edx,0xc(%eax)
      return b;
  102145:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102148:	eb 7b                	jmp    1021c5 <bget+0xb9>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
  10214a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10214d:	8b 40 14             	mov    0x14(%eax),%eax
  102150:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102153:	81 7d f4 68 ac 10 00 	cmpl   $0x10ac68,-0xc(%ebp)
  10215a:	75 c4                	jne    102120 <bget+0x14>
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
  10215c:	a1 78 ac 10 00       	mov    0x10ac78,%eax
  102161:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102164:	eb 49                	jmp    1021af <bget+0xa3>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
  102166:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102169:	8b 40 0c             	mov    0xc(%eax),%eax
  10216c:	85 c0                	test   %eax,%eax
  10216e:	75 36                	jne    1021a6 <bget+0x9a>
  102170:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102173:	8b 00                	mov    (%eax),%eax
  102175:	83 e0 04             	and    $0x4,%eax
  102178:	85 c0                	test   %eax,%eax
  10217a:	75 2a                	jne    1021a6 <bget+0x9a>
      b->dev = dev;
  10217c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10217f:	8b 55 08             	mov    0x8(%ebp),%edx
  102182:	89 50 04             	mov    %edx,0x4(%eax)
      b->blockno = blockno;
  102185:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102188:	8b 55 0c             	mov    0xc(%ebp),%edx
  10218b:	89 50 08             	mov    %edx,0x8(%eax)
      b->flags = 0;
  10218e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102191:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
      b->refcnt = 1;
  102197:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10219a:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
      return b;
  1021a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1021a4:	eb 1f                	jmp    1021c5 <bget+0xb9>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
  1021a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1021a9:	8b 40 10             	mov    0x10(%eax),%eax
  1021ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1021af:	81 7d f4 68 ac 10 00 	cmpl   $0x10ac68,-0xc(%ebp)
  1021b6:	75 ae                	jne    102166 <bget+0x5a>
    }
  }
  panic("bget: no buffers");
  1021b8:	83 ec 0c             	sub    $0xc,%esp
  1021bb:	68 39 45 10 00       	push   $0x104539
  1021c0:	e8 f4 e0 ff ff       	call   1002b9 <panic>
}
  1021c5:	c9                   	leave  
  1021c6:	c3                   	ret    

001021c7 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
  1021c7:	f3 0f 1e fb          	endbr32 
  1021cb:	55                   	push   %ebp
  1021cc:	89 e5                	mov    %esp,%ebp
  1021ce:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;
  b = bget(dev, blockno);
  1021d1:	83 ec 08             	sub    $0x8,%esp
  1021d4:	ff 75 0c             	pushl  0xc(%ebp)
  1021d7:	ff 75 08             	pushl  0x8(%ebp)
  1021da:	e8 2d ff ff ff       	call   10210c <bget>
  1021df:	83 c4 10             	add    $0x10,%esp
  1021e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((b->flags & B_VALID) == 0) {
  1021e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1021e8:	8b 00                	mov    (%eax),%eax
  1021ea:	83 e0 02             	and    $0x2,%eax
  1021ed:	85 c0                	test   %eax,%eax
  1021ef:	75 0e                	jne    1021ff <bread+0x38>
    iderw(b);
  1021f1:	83 ec 0c             	sub    $0xc,%esp
  1021f4:	ff 75 f4             	pushl  -0xc(%ebp)
  1021f7:	e8 7a 04 00 00       	call   102676 <iderw>
  1021fc:	83 c4 10             	add    $0x10,%esp
  }
  return b;
  1021ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102202:	c9                   	leave  
  102203:	c3                   	ret    

00102204 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  102204:	f3 0f 1e fb          	endbr32 
  102208:	55                   	push   %ebp
  102209:	89 e5                	mov    %esp,%ebp
  10220b:	83 ec 08             	sub    $0x8,%esp
  b->flags |= B_DIRTY;
  10220e:	8b 45 08             	mov    0x8(%ebp),%eax
  102211:	8b 00                	mov    (%eax),%eax
  102213:	83 c8 04             	or     $0x4,%eax
  102216:	89 c2                	mov    %eax,%edx
  102218:	8b 45 08             	mov    0x8(%ebp),%eax
  10221b:	89 10                	mov    %edx,(%eax)
  iderw(b);
  10221d:	83 ec 0c             	sub    $0xc,%esp
  102220:	ff 75 08             	pushl  0x8(%ebp)
  102223:	e8 4e 04 00 00       	call   102676 <iderw>
  102228:	83 c4 10             	add    $0x10,%esp
}
  10222b:	90                   	nop
  10222c:	c9                   	leave  
  10222d:	c3                   	ret    

0010222e <bread_wr>:

struct buf* 
bread_wr(uint dev, uint blockno) {
  10222e:	f3 0f 1e fb          	endbr32 
  102232:	55                   	push   %ebp
  102233:	89 e5                	mov    %esp,%ebp
  102235:	83 ec 18             	sub    $0x18,%esp
  // IMPLEMENT YOUR CODE HERE
  struct buf *b;
  b = bget(dev, blockno);
  102238:	83 ec 08             	sub    $0x8,%esp
  10223b:	ff 75 0c             	pushl  0xc(%ebp)
  10223e:	ff 75 08             	pushl  0x8(%ebp)
  102241:	e8 c6 fe ff ff       	call   10210c <bget>
  102246:	83 c4 10             	add    $0x10,%esp
  102249:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((b->flags & B_VALID) == 0) {
  10224c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10224f:	8b 00                	mov    (%eax),%eax
  102251:	83 e0 02             	and    $0x2,%eax
  102254:	85 c0                	test   %eax,%eax
  102256:	75 0e                	jne    102266 <bread_wr+0x38>
    iderw(b);
  102258:	83 ec 0c             	sub    $0xc,%esp
  10225b:	ff 75 f4             	pushl  -0xc(%ebp)
  10225e:	e8 13 04 00 00       	call   102676 <iderw>
  102263:	83 c4 10             	add    $0x10,%esp
  }
  add_undocache(b);
  102266:	83 ec 0c             	sub    $0xc,%esp
  102269:	ff 75 f4             	pushl  -0xc(%ebp)
  10226c:	e8 bb fc ff ff       	call   101f2c <add_undocache>
  102271:	83 c4 10             	add    $0x10,%esp
  return b;
  102274:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102277:	c9                   	leave  
  102278:	c3                   	ret    

00102279 <brelse>:

// Release a buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  102279:	f3 0f 1e fb          	endbr32 
  10227d:	55                   	push   %ebp
  10227e:	89 e5                	mov    %esp,%ebp
  b->refcnt--;
  102280:	8b 45 08             	mov    0x8(%ebp),%eax
  102283:	8b 40 0c             	mov    0xc(%eax),%eax
  102286:	8d 50 ff             	lea    -0x1(%eax),%edx
  102289:	8b 45 08             	mov    0x8(%ebp),%eax
  10228c:	89 50 0c             	mov    %edx,0xc(%eax)
  if (b->refcnt == 0) {
  10228f:	8b 45 08             	mov    0x8(%ebp),%eax
  102292:	8b 40 0c             	mov    0xc(%eax),%eax
  102295:	85 c0                	test   %eax,%eax
  102297:	75 47                	jne    1022e0 <brelse+0x67>
    // no one is waiting for it.
    b->next->prev = b->prev;
  102299:	8b 45 08             	mov    0x8(%ebp),%eax
  10229c:	8b 40 14             	mov    0x14(%eax),%eax
  10229f:	8b 55 08             	mov    0x8(%ebp),%edx
  1022a2:	8b 52 10             	mov    0x10(%edx),%edx
  1022a5:	89 50 10             	mov    %edx,0x10(%eax)
    b->prev->next = b->next;
  1022a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1022ab:	8b 40 10             	mov    0x10(%eax),%eax
  1022ae:	8b 55 08             	mov    0x8(%ebp),%edx
  1022b1:	8b 52 14             	mov    0x14(%edx),%edx
  1022b4:	89 50 14             	mov    %edx,0x14(%eax)
    b->next = bcache.head.next;
  1022b7:	8b 15 7c ac 10 00    	mov    0x10ac7c,%edx
  1022bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1022c0:	89 50 14             	mov    %edx,0x14(%eax)
    b->prev = &bcache.head;
  1022c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1022c6:	c7 40 10 68 ac 10 00 	movl   $0x10ac68,0x10(%eax)
    bcache.head.next->prev = b;
  1022cd:	a1 7c ac 10 00       	mov    0x10ac7c,%eax
  1022d2:	8b 55 08             	mov    0x8(%ebp),%edx
  1022d5:	89 50 10             	mov    %edx,0x10(%eax)
    bcache.head.next = b;
  1022d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1022db:	a3 7c ac 10 00       	mov    %eax,0x10ac7c
  }
}
  1022e0:	90                   	nop
  1022e1:	5d                   	pop    %ebp
  1022e2:	c3                   	ret    

001022e3 <inb>:
{
  1022e3:	55                   	push   %ebp
  1022e4:	89 e5                	mov    %esp,%ebp
  1022e6:	83 ec 14             	sub    $0x14,%esp
  1022e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1022ec:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1022f0:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1022f4:	89 c2                	mov    %eax,%edx
  1022f6:	ec                   	in     (%dx),%al
  1022f7:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
  1022fa:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
  1022fe:	c9                   	leave  
  1022ff:	c3                   	ret    

00102300 <insl>:
{
  102300:	55                   	push   %ebp
  102301:	89 e5                	mov    %esp,%ebp
  102303:	57                   	push   %edi
  102304:	53                   	push   %ebx
  asm volatile("cld; rep insl" :
  102305:	8b 55 08             	mov    0x8(%ebp),%edx
  102308:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10230b:	8b 45 10             	mov    0x10(%ebp),%eax
  10230e:	89 cb                	mov    %ecx,%ebx
  102310:	89 df                	mov    %ebx,%edi
  102312:	89 c1                	mov    %eax,%ecx
  102314:	fc                   	cld    
  102315:	f3 6d                	rep insl (%dx),%es:(%edi)
  102317:	89 c8                	mov    %ecx,%eax
  102319:	89 fb                	mov    %edi,%ebx
  10231b:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  10231e:	89 45 10             	mov    %eax,0x10(%ebp)
}
  102321:	90                   	nop
  102322:	5b                   	pop    %ebx
  102323:	5f                   	pop    %edi
  102324:	5d                   	pop    %ebp
  102325:	c3                   	ret    

00102326 <outb>:
{
  102326:	55                   	push   %ebp
  102327:	89 e5                	mov    %esp,%ebp
  102329:	83 ec 08             	sub    $0x8,%esp
  10232c:	8b 45 08             	mov    0x8(%ebp),%eax
  10232f:	8b 55 0c             	mov    0xc(%ebp),%edx
  102332:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  102336:	89 d0                	mov    %edx,%eax
  102338:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  10233b:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  10233f:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  102343:	ee                   	out    %al,(%dx)
}
  102344:	90                   	nop
  102345:	c9                   	leave  
  102346:	c3                   	ret    

00102347 <outsl>:
{
  102347:	55                   	push   %ebp
  102348:	89 e5                	mov    %esp,%ebp
  10234a:	56                   	push   %esi
  10234b:	53                   	push   %ebx
  asm volatile("cld; rep outsl" :
  10234c:	8b 55 08             	mov    0x8(%ebp),%edx
  10234f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  102352:	8b 45 10             	mov    0x10(%ebp),%eax
  102355:	89 cb                	mov    %ecx,%ebx
  102357:	89 de                	mov    %ebx,%esi
  102359:	89 c1                	mov    %eax,%ecx
  10235b:	fc                   	cld    
  10235c:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  10235e:	89 c8                	mov    %ecx,%eax
  102360:	89 f3                	mov    %esi,%ebx
  102362:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  102365:	89 45 10             	mov    %eax,0x10(%ebp)
}
  102368:	90                   	nop
  102369:	5b                   	pop    %ebx
  10236a:	5e                   	pop    %esi
  10236b:	5d                   	pop    %ebp
  10236c:	c3                   	ret    

0010236d <noop>:

static inline void
noop(void)
{
  10236d:	55                   	push   %ebp
  10236e:	89 e5                	mov    %esp,%ebp
  asm volatile("nop");
  102370:	90                   	nop
}
  102371:	90                   	nop
  102372:	5d                   	pop    %ebp
  102373:	c3                   	ret    

00102374 <idewait>:
static void idestart(struct buf*);

// Wait for IDE disk to become ready.
static int
idewait(int checkerr)
{
  102374:	f3 0f 1e fb          	endbr32 
  102378:	55                   	push   %ebp
  102379:	89 e5                	mov    %esp,%ebp
  10237b:	83 ec 10             	sub    $0x10,%esp
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY);
  10237e:	90                   	nop
  10237f:	68 f7 01 00 00       	push   $0x1f7
  102384:	e8 5a ff ff ff       	call   1022e3 <inb>
  102389:	83 c4 04             	add    $0x4,%esp
  10238c:	0f b6 c0             	movzbl %al,%eax
  10238f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  102392:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102395:	25 c0 00 00 00       	and    $0xc0,%eax
  10239a:	83 f8 40             	cmp    $0x40,%eax
  10239d:	75 e0                	jne    10237f <idewait+0xb>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
  10239f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1023a3:	74 11                	je     1023b6 <idewait+0x42>
  1023a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1023a8:	83 e0 21             	and    $0x21,%eax
  1023ab:	85 c0                	test   %eax,%eax
  1023ad:	74 07                	je     1023b6 <idewait+0x42>
    return -1;
  1023af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1023b4:	eb 05                	jmp    1023bb <idewait+0x47>
  return 0;
  1023b6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1023bb:	c9                   	leave  
  1023bc:	c3                   	ret    

001023bd <ideinit>:

void
ideinit(void)
{
  1023bd:	f3 0f 1e fb          	endbr32 
  1023c1:	55                   	push   %ebp
  1023c2:	89 e5                	mov    %esp,%ebp
  1023c4:	83 ec 18             	sub    $0x18,%esp
  int i;

  // initlock(&idelock, "ide");
  ioapicenable(IRQ_IDE, ncpu - 1);
  1023c7:	a1 e0 64 10 00       	mov    0x1064e0,%eax
  1023cc:	83 e8 01             	sub    $0x1,%eax
  1023cf:	83 ec 08             	sub    $0x8,%esp
  1023d2:	50                   	push   %eax
  1023d3:	6a 0e                	push   $0xe
  1023d5:	e8 e1 e1 ff ff       	call   1005bb <ioapicenable>
  1023da:	83 c4 10             	add    $0x10,%esp
  idewait(0);
  1023dd:	83 ec 0c             	sub    $0xc,%esp
  1023e0:	6a 00                	push   $0x0
  1023e2:	e8 8d ff ff ff       	call   102374 <idewait>
  1023e7:	83 c4 10             	add    $0x10,%esp

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  1023ea:	83 ec 08             	sub    $0x8,%esp
  1023ed:	68 f0 00 00 00       	push   $0xf0
  1023f2:	68 f6 01 00 00       	push   $0x1f6
  1023f7:	e8 2a ff ff ff       	call   102326 <outb>
  1023fc:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<1000; i++){
  1023ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102406:	eb 24                	jmp    10242c <ideinit+0x6f>
    if(inb(0x1f7) != 0){
  102408:	83 ec 0c             	sub    $0xc,%esp
  10240b:	68 f7 01 00 00       	push   $0x1f7
  102410:	e8 ce fe ff ff       	call   1022e3 <inb>
  102415:	83 c4 10             	add    $0x10,%esp
  102418:	84 c0                	test   %al,%al
  10241a:	74 0c                	je     102428 <ideinit+0x6b>
      havedisk1 = 1;
  10241c:	c7 05 34 54 10 00 01 	movl   $0x1,0x105434
  102423:	00 00 00 
      break;
  102426:	eb 0d                	jmp    102435 <ideinit+0x78>
  for(i=0; i<1000; i++){
  102428:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10242c:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  102433:	7e d3                	jle    102408 <ideinit+0x4b>
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
  102435:	83 ec 08             	sub    $0x8,%esp
  102438:	68 e0 00 00 00       	push   $0xe0
  10243d:	68 f6 01 00 00       	push   $0x1f6
  102442:	e8 df fe ff ff       	call   102326 <outb>
  102447:	83 c4 10             	add    $0x10,%esp
}
  10244a:	90                   	nop
  10244b:	c9                   	leave  
  10244c:	c3                   	ret    

0010244d <idestart>:

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  10244d:	f3 0f 1e fb          	endbr32 
  102451:	55                   	push   %ebp
  102452:	89 e5                	mov    %esp,%ebp
  102454:	83 ec 18             	sub    $0x18,%esp
  if(b == 0)
  102457:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10245b:	75 0d                	jne    10246a <idestart+0x1d>
    panic("idestart");
  10245d:	83 ec 0c             	sub    $0xc,%esp
  102460:	68 4a 45 10 00       	push   $0x10454a
  102465:	e8 4f de ff ff       	call   1002b9 <panic>
  if(b->blockno >= FSSIZE)
  10246a:	8b 45 08             	mov    0x8(%ebp),%eax
  10246d:	8b 40 08             	mov    0x8(%eax),%eax
  102470:	3d e7 03 00 00       	cmp    $0x3e7,%eax
  102475:	76 0d                	jbe    102484 <idestart+0x37>
    panic("incorrect blockno");
  102477:	83 ec 0c             	sub    $0xc,%esp
  10247a:	68 53 45 10 00       	push   $0x104553
  10247f:	e8 35 de ff ff       	call   1002b9 <panic>
  int sector_per_block =  BSIZE/SECTOR_SIZE;
  102484:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  int sector = b->blockno * sector_per_block;
  10248b:	8b 45 08             	mov    0x8(%ebp),%eax
  10248e:	8b 50 08             	mov    0x8(%eax),%edx
  102491:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102494:	0f af c2             	imul   %edx,%eax
  102497:	89 45 f0             	mov    %eax,-0x10(%ebp)
  int read_cmd = (sector_per_block == 1) ? IDE_CMD_READ :  IDE_CMD_RDMUL;
  10249a:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  10249e:	75 07                	jne    1024a7 <idestart+0x5a>
  1024a0:	b8 20 00 00 00       	mov    $0x20,%eax
  1024a5:	eb 05                	jmp    1024ac <idestart+0x5f>
  1024a7:	b8 c4 00 00 00       	mov    $0xc4,%eax
  1024ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int write_cmd = (sector_per_block == 1) ? IDE_CMD_WRITE : IDE_CMD_WRMUL;
  1024af:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  1024b3:	75 07                	jne    1024bc <idestart+0x6f>
  1024b5:	b8 30 00 00 00       	mov    $0x30,%eax
  1024ba:	eb 05                	jmp    1024c1 <idestart+0x74>
  1024bc:	b8 c5 00 00 00       	mov    $0xc5,%eax
  1024c1:	89 45 e8             	mov    %eax,-0x18(%ebp)

  if (sector_per_block > 7) panic("idestart");
  1024c4:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
  1024c8:	7e 0d                	jle    1024d7 <idestart+0x8a>
  1024ca:	83 ec 0c             	sub    $0xc,%esp
  1024cd:	68 4a 45 10 00       	push   $0x10454a
  1024d2:	e8 e2 dd ff ff       	call   1002b9 <panic>

  idewait(0);
  1024d7:	83 ec 0c             	sub    $0xc,%esp
  1024da:	6a 00                	push   $0x0
  1024dc:	e8 93 fe ff ff       	call   102374 <idewait>
  1024e1:	83 c4 10             	add    $0x10,%esp
  outb(0x3f6, 0);  // generate interrupt
  1024e4:	83 ec 08             	sub    $0x8,%esp
  1024e7:	6a 00                	push   $0x0
  1024e9:	68 f6 03 00 00       	push   $0x3f6
  1024ee:	e8 33 fe ff ff       	call   102326 <outb>
  1024f3:	83 c4 10             	add    $0x10,%esp
  outb(0x1f2, sector_per_block);  // number of sectors
  1024f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1024f9:	0f b6 c0             	movzbl %al,%eax
  1024fc:	83 ec 08             	sub    $0x8,%esp
  1024ff:	50                   	push   %eax
  102500:	68 f2 01 00 00       	push   $0x1f2
  102505:	e8 1c fe ff ff       	call   102326 <outb>
  10250a:	83 c4 10             	add    $0x10,%esp
  outb(0x1f3, sector & 0xff);
  10250d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102510:	0f b6 c0             	movzbl %al,%eax
  102513:	83 ec 08             	sub    $0x8,%esp
  102516:	50                   	push   %eax
  102517:	68 f3 01 00 00       	push   $0x1f3
  10251c:	e8 05 fe ff ff       	call   102326 <outb>
  102521:	83 c4 10             	add    $0x10,%esp
  outb(0x1f4, (sector >> 8) & 0xff);
  102524:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102527:	c1 f8 08             	sar    $0x8,%eax
  10252a:	0f b6 c0             	movzbl %al,%eax
  10252d:	83 ec 08             	sub    $0x8,%esp
  102530:	50                   	push   %eax
  102531:	68 f4 01 00 00       	push   $0x1f4
  102536:	e8 eb fd ff ff       	call   102326 <outb>
  10253b:	83 c4 10             	add    $0x10,%esp
  outb(0x1f5, (sector >> 16) & 0xff);
  10253e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102541:	c1 f8 10             	sar    $0x10,%eax
  102544:	0f b6 c0             	movzbl %al,%eax
  102547:	83 ec 08             	sub    $0x8,%esp
  10254a:	50                   	push   %eax
  10254b:	68 f5 01 00 00       	push   $0x1f5
  102550:	e8 d1 fd ff ff       	call   102326 <outb>
  102555:	83 c4 10             	add    $0x10,%esp
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  102558:	8b 45 08             	mov    0x8(%ebp),%eax
  10255b:	8b 40 04             	mov    0x4(%eax),%eax
  10255e:	c1 e0 04             	shl    $0x4,%eax
  102561:	83 e0 10             	and    $0x10,%eax
  102564:	89 c2                	mov    %eax,%edx
  102566:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102569:	c1 f8 18             	sar    $0x18,%eax
  10256c:	83 e0 0f             	and    $0xf,%eax
  10256f:	09 d0                	or     %edx,%eax
  102571:	83 c8 e0             	or     $0xffffffe0,%eax
  102574:	0f b6 c0             	movzbl %al,%eax
  102577:	83 ec 08             	sub    $0x8,%esp
  10257a:	50                   	push   %eax
  10257b:	68 f6 01 00 00       	push   $0x1f6
  102580:	e8 a1 fd ff ff       	call   102326 <outb>
  102585:	83 c4 10             	add    $0x10,%esp
  if(b->flags & B_DIRTY){
  102588:	8b 45 08             	mov    0x8(%ebp),%eax
  10258b:	8b 00                	mov    (%eax),%eax
  10258d:	83 e0 04             	and    $0x4,%eax
  102590:	85 c0                	test   %eax,%eax
  102592:	74 35                	je     1025c9 <idestart+0x17c>
    outb(0x1f7, write_cmd);
  102594:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102597:	0f b6 c0             	movzbl %al,%eax
  10259a:	83 ec 08             	sub    $0x8,%esp
  10259d:	50                   	push   %eax
  10259e:	68 f7 01 00 00       	push   $0x1f7
  1025a3:	e8 7e fd ff ff       	call   102326 <outb>
  1025a8:	83 c4 10             	add    $0x10,%esp
    outsl(0x1f0, b->data, BSIZE/4);
  1025ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1025ae:	83 c0 1c             	add    $0x1c,%eax
  1025b1:	83 ec 04             	sub    $0x4,%esp
  1025b4:	68 80 00 00 00       	push   $0x80
  1025b9:	50                   	push   %eax
  1025ba:	68 f0 01 00 00       	push   $0x1f0
  1025bf:	e8 83 fd ff ff       	call   102347 <outsl>
  1025c4:	83 c4 10             	add    $0x10,%esp
  } else {
    outb(0x1f7, read_cmd);
  }
}
  1025c7:	eb 17                	jmp    1025e0 <idestart+0x193>
    outb(0x1f7, read_cmd);
  1025c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1025cc:	0f b6 c0             	movzbl %al,%eax
  1025cf:	83 ec 08             	sub    $0x8,%esp
  1025d2:	50                   	push   %eax
  1025d3:	68 f7 01 00 00       	push   $0x1f7
  1025d8:	e8 49 fd ff ff       	call   102326 <outb>
  1025dd:	83 c4 10             	add    $0x10,%esp
}
  1025e0:	90                   	nop
  1025e1:	c9                   	leave  
  1025e2:	c3                   	ret    

001025e3 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
  1025e3:	f3 0f 1e fb          	endbr32 
  1025e7:	55                   	push   %ebp
  1025e8:	89 e5                	mov    %esp,%ebp
  1025ea:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  if((b = idequeue) == 0){
  1025ed:	a1 30 54 10 00       	mov    0x105430,%eax
  1025f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1025f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1025f9:	74 78                	je     102673 <ideintr+0x90>
    return;
  }
  idequeue = b->qnext;
  1025fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1025fe:	8b 40 18             	mov    0x18(%eax),%eax
  102601:	a3 30 54 10 00       	mov    %eax,0x105430

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
  102606:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102609:	8b 00                	mov    (%eax),%eax
  10260b:	83 e0 04             	and    $0x4,%eax
  10260e:	85 c0                	test   %eax,%eax
  102610:	75 27                	jne    102639 <ideintr+0x56>
  102612:	6a 01                	push   $0x1
  102614:	e8 5b fd ff ff       	call   102374 <idewait>
  102619:	83 c4 04             	add    $0x4,%esp
  10261c:	85 c0                	test   %eax,%eax
  10261e:	78 19                	js     102639 <ideintr+0x56>
    insl(0x1f0, b->data, BSIZE/4);
  102620:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102623:	83 c0 1c             	add    $0x1c,%eax
  102626:	68 80 00 00 00       	push   $0x80
  10262b:	50                   	push   %eax
  10262c:	68 f0 01 00 00       	push   $0x1f0
  102631:	e8 ca fc ff ff       	call   102300 <insl>
  102636:	83 c4 0c             	add    $0xc,%esp

  b->flags |= B_VALID;
  102639:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10263c:	8b 00                	mov    (%eax),%eax
  10263e:	83 c8 02             	or     $0x2,%eax
  102641:	89 c2                	mov    %eax,%edx
  102643:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102646:	89 10                	mov    %edx,(%eax)
  b->flags &= ~B_DIRTY;
  102648:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10264b:	8b 00                	mov    (%eax),%eax
  10264d:	83 e0 fb             	and    $0xfffffffb,%eax
  102650:	89 c2                	mov    %eax,%edx
  102652:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102655:	89 10                	mov    %edx,(%eax)

  // Start disk on next buf in queue.
  if(idequeue != 0)
  102657:	a1 30 54 10 00       	mov    0x105430,%eax
  10265c:	85 c0                	test   %eax,%eax
  10265e:	74 14                	je     102674 <ideintr+0x91>
    idestart(idequeue);
  102660:	a1 30 54 10 00       	mov    0x105430,%eax
  102665:	83 ec 0c             	sub    $0xc,%esp
  102668:	50                   	push   %eax
  102669:	e8 df fd ff ff       	call   10244d <idestart>
  10266e:	83 c4 10             	add    $0x10,%esp
  102671:	eb 01                	jmp    102674 <ideintr+0x91>
    return;
  102673:	90                   	nop
}
  102674:	c9                   	leave  
  102675:	c3                   	ret    

00102676 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
  102676:	f3 0f 1e fb          	endbr32 
  10267a:	55                   	push   %ebp
  10267b:	89 e5                	mov    %esp,%ebp
  10267d:	83 ec 18             	sub    $0x18,%esp
  struct buf **pp;

  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
  102680:	8b 45 08             	mov    0x8(%ebp),%eax
  102683:	8b 00                	mov    (%eax),%eax
  102685:	83 e0 06             	and    $0x6,%eax
  102688:	83 f8 02             	cmp    $0x2,%eax
  10268b:	75 0d                	jne    10269a <iderw+0x24>
    panic("iderw: nothing to do");
  10268d:	83 ec 0c             	sub    $0xc,%esp
  102690:	68 65 45 10 00       	push   $0x104565
  102695:	e8 1f dc ff ff       	call   1002b9 <panic>
  if(b->dev != 0 && !havedisk1)
  10269a:	8b 45 08             	mov    0x8(%ebp),%eax
  10269d:	8b 40 04             	mov    0x4(%eax),%eax
  1026a0:	85 c0                	test   %eax,%eax
  1026a2:	74 16                	je     1026ba <iderw+0x44>
  1026a4:	a1 34 54 10 00       	mov    0x105434,%eax
  1026a9:	85 c0                	test   %eax,%eax
  1026ab:	75 0d                	jne    1026ba <iderw+0x44>
    panic("iderw: ide disk 1 not present");
  1026ad:	83 ec 0c             	sub    $0xc,%esp
  1026b0:	68 7a 45 10 00       	push   $0x10457a
  1026b5:	e8 ff db ff ff       	call   1002b9 <panic>

  // Append b to idequeue.
  b->qnext = 0;
  1026ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1026bd:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
  1026c4:	c7 45 f4 30 54 10 00 	movl   $0x105430,-0xc(%ebp)
  1026cb:	eb 0b                	jmp    1026d8 <iderw+0x62>
  1026cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1026d0:	8b 00                	mov    (%eax),%eax
  1026d2:	83 c0 18             	add    $0x18,%eax
  1026d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1026d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1026db:	8b 00                	mov    (%eax),%eax
  1026dd:	85 c0                	test   %eax,%eax
  1026df:	75 ec                	jne    1026cd <iderw+0x57>
    ;
  *pp = b;
  1026e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1026e4:	8b 55 08             	mov    0x8(%ebp),%edx
  1026e7:	89 10                	mov    %edx,(%eax)

  // Start disk if necessary.
  if(idequeue == b)
  1026e9:	a1 30 54 10 00       	mov    0x105430,%eax
  1026ee:	39 45 08             	cmp    %eax,0x8(%ebp)
  1026f1:	75 15                	jne    102708 <iderw+0x92>
    idestart(b);
  1026f3:	83 ec 0c             	sub    $0xc,%esp
  1026f6:	ff 75 08             	pushl  0x8(%ebp)
  1026f9:	e8 4f fd ff ff       	call   10244d <idestart>
  1026fe:	83 c4 10             	add    $0x10,%esp

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID)
  102701:	eb 05                	jmp    102708 <iderw+0x92>
  {
    // Warning: If we do not call noop(), compiler generates code that does not
    // read "b->flags" again and therefore never come out of this while loop. 
    // "b->flags" is modified by the trap handler in ideintr().  
    noop();
  102703:	e8 65 fc ff ff       	call   10236d <noop>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID)
  102708:	8b 45 08             	mov    0x8(%ebp),%eax
  10270b:	8b 00                	mov    (%eax),%eax
  10270d:	83 e0 06             	and    $0x6,%eax
  102710:	83 f8 02             	cmp    $0x2,%eax
  102713:	75 ee                	jne    102703 <iderw+0x8d>
  }
}
  102715:	90                   	nop
  102716:	90                   	nop
  102717:	c9                   	leave  
  102718:	c3                   	ret    

00102719 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
  102719:	f3 0f 1e fb          	endbr32 
  10271d:	55                   	push   %ebp
  10271e:	89 e5                	mov    %esp,%ebp
  102720:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;

  bp = bread(dev, 1);
  102723:	8b 45 08             	mov    0x8(%ebp),%eax
  102726:	83 ec 08             	sub    $0x8,%esp
  102729:	6a 01                	push   $0x1
  10272b:	50                   	push   %eax
  10272c:	e8 96 fa ff ff       	call   1021c7 <bread>
  102731:	83 c4 10             	add    $0x10,%esp
  102734:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memmove(sb, bp->data, sizeof(*sb));
  102737:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10273a:	83 c0 1c             	add    $0x1c,%eax
  10273d:	83 ec 04             	sub    $0x4,%esp
  102740:	6a 1c                	push   $0x1c
  102742:	50                   	push   %eax
  102743:	ff 75 0c             	pushl  0xc(%ebp)
  102746:	e8 8c e8 ff ff       	call   100fd7 <memmove>
  10274b:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  10274e:	83 ec 0c             	sub    $0xc,%esp
  102751:	ff 75 f4             	pushl  -0xc(%ebp)
  102754:	e8 20 fb ff ff       	call   102279 <brelse>
  102759:	83 c4 10             	add    $0x10,%esp
}
  10275c:	90                   	nop
  10275d:	c9                   	leave  
  10275e:	c3                   	ret    

0010275f <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
  10275f:	f3 0f 1e fb          	endbr32 
  102763:	55                   	push   %ebp
  102764:	89 e5                	mov    %esp,%ebp
  102766:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;

  bp = bread_wr(dev, bno);
  102769:	8b 55 0c             	mov    0xc(%ebp),%edx
  10276c:	8b 45 08             	mov    0x8(%ebp),%eax
  10276f:	83 ec 08             	sub    $0x8,%esp
  102772:	52                   	push   %edx
  102773:	50                   	push   %eax
  102774:	e8 b5 fa ff ff       	call   10222e <bread_wr>
  102779:	83 c4 10             	add    $0x10,%esp
  10277c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(bp->data, 0, BSIZE);
  10277f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102782:	83 c0 1c             	add    $0x1c,%eax
  102785:	83 ec 04             	sub    $0x4,%esp
  102788:	68 00 02 00 00       	push   $0x200
  10278d:	6a 00                	push   $0x0
  10278f:	50                   	push   %eax
  102790:	e8 7b e7 ff ff       	call   100f10 <memset>
  102795:	83 c4 10             	add    $0x10,%esp
  log_write(bp);
  102798:	83 ec 0c             	sub    $0xc,%esp
  10279b:	ff 75 f4             	pushl  -0xc(%ebp)
  10279e:	e8 df 19 00 00       	call   104182 <log_write>
  1027a3:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  1027a6:	83 ec 0c             	sub    $0xc,%esp
  1027a9:	ff 75 f4             	pushl  -0xc(%ebp)
  1027ac:	e8 c8 fa ff ff       	call   102279 <brelse>
  1027b1:	83 c4 10             	add    $0x10,%esp
}
  1027b4:	90                   	nop
  1027b5:	c9                   	leave  
  1027b6:	c3                   	ret    

001027b7 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
  1027b7:	f3 0f 1e fb          	endbr32 
  1027bb:	55                   	push   %ebp
  1027bc:	89 e5                	mov    %esp,%ebp
  1027be:	83 ec 18             	sub    $0x18,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  1027c1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(b = 0; b < sb.size; b += BPB){
  1027c8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1027cf:	e9 13 01 00 00       	jmp    1028e7 <balloc+0x130>
    bp = bread_wr(dev, BBLOCK(b, sb));
  1027d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1027d7:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  1027dd:	85 c0                	test   %eax,%eax
  1027df:	0f 48 c2             	cmovs  %edx,%eax
  1027e2:	c1 f8 0c             	sar    $0xc,%eax
  1027e5:	89 c2                	mov    %eax,%edx
  1027e7:	a1 18 ee 10 00       	mov    0x10ee18,%eax
  1027ec:	01 d0                	add    %edx,%eax
  1027ee:	83 ec 08             	sub    $0x8,%esp
  1027f1:	50                   	push   %eax
  1027f2:	ff 75 08             	pushl  0x8(%ebp)
  1027f5:	e8 34 fa ff ff       	call   10222e <bread_wr>
  1027fa:	83 c4 10             	add    $0x10,%esp
  1027fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
  102800:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  102807:	e9 a6 00 00 00       	jmp    1028b2 <balloc+0xfb>
      m = 1 << (bi % 8);
  10280c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10280f:	99                   	cltd   
  102810:	c1 ea 1d             	shr    $0x1d,%edx
  102813:	01 d0                	add    %edx,%eax
  102815:	83 e0 07             	and    $0x7,%eax
  102818:	29 d0                	sub    %edx,%eax
  10281a:	ba 01 00 00 00       	mov    $0x1,%edx
  10281f:	89 c1                	mov    %eax,%ecx
  102821:	d3 e2                	shl    %cl,%edx
  102823:	89 d0                	mov    %edx,%eax
  102825:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
  102828:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10282b:	8d 50 07             	lea    0x7(%eax),%edx
  10282e:	85 c0                	test   %eax,%eax
  102830:	0f 48 c2             	cmovs  %edx,%eax
  102833:	c1 f8 03             	sar    $0x3,%eax
  102836:	89 c2                	mov    %eax,%edx
  102838:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10283b:	0f b6 44 10 1c       	movzbl 0x1c(%eax,%edx,1),%eax
  102840:	0f b6 c0             	movzbl %al,%eax
  102843:	23 45 e8             	and    -0x18(%ebp),%eax
  102846:	85 c0                	test   %eax,%eax
  102848:	75 64                	jne    1028ae <balloc+0xf7>
        bp->data[bi/8] |= m;  // Mark block in use.
  10284a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10284d:	8d 50 07             	lea    0x7(%eax),%edx
  102850:	85 c0                	test   %eax,%eax
  102852:	0f 48 c2             	cmovs  %edx,%eax
  102855:	c1 f8 03             	sar    $0x3,%eax
  102858:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10285b:	0f b6 54 02 1c       	movzbl 0x1c(%edx,%eax,1),%edx
  102860:	89 d1                	mov    %edx,%ecx
  102862:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102865:	09 ca                	or     %ecx,%edx
  102867:	89 d1                	mov    %edx,%ecx
  102869:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10286c:	88 4c 02 1c          	mov    %cl,0x1c(%edx,%eax,1)
        log_write(bp);
  102870:	83 ec 0c             	sub    $0xc,%esp
  102873:	ff 75 ec             	pushl  -0x14(%ebp)
  102876:	e8 07 19 00 00       	call   104182 <log_write>
  10287b:	83 c4 10             	add    $0x10,%esp
        brelse(bp);
  10287e:	83 ec 0c             	sub    $0xc,%esp
  102881:	ff 75 ec             	pushl  -0x14(%ebp)
  102884:	e8 f0 f9 ff ff       	call   102279 <brelse>
  102889:	83 c4 10             	add    $0x10,%esp
        bzero(dev, b + bi);
  10288c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10288f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102892:	01 c2                	add    %eax,%edx
  102894:	8b 45 08             	mov    0x8(%ebp),%eax
  102897:	83 ec 08             	sub    $0x8,%esp
  10289a:	52                   	push   %edx
  10289b:	50                   	push   %eax
  10289c:	e8 be fe ff ff       	call   10275f <bzero>
  1028a1:	83 c4 10             	add    $0x10,%esp
        return b + bi;
  1028a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1028a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028aa:	01 d0                	add    %edx,%eax
  1028ac:	eb 57                	jmp    102905 <balloc+0x14e>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
  1028ae:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  1028b2:	81 7d f0 ff 0f 00 00 	cmpl   $0xfff,-0x10(%ebp)
  1028b9:	7f 17                	jg     1028d2 <balloc+0x11b>
  1028bb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1028be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028c1:	01 d0                	add    %edx,%eax
  1028c3:	89 c2                	mov    %eax,%edx
  1028c5:	a1 00 ee 10 00       	mov    0x10ee00,%eax
  1028ca:	39 c2                	cmp    %eax,%edx
  1028cc:	0f 82 3a ff ff ff    	jb     10280c <balloc+0x55>
      }
    }
    brelse(bp);
  1028d2:	83 ec 0c             	sub    $0xc,%esp
  1028d5:	ff 75 ec             	pushl  -0x14(%ebp)
  1028d8:	e8 9c f9 ff ff       	call   102279 <brelse>
  1028dd:	83 c4 10             	add    $0x10,%esp
  for(b = 0; b < sb.size; b += BPB){
  1028e0:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  1028e7:	8b 15 00 ee 10 00    	mov    0x10ee00,%edx
  1028ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1028f0:	39 c2                	cmp    %eax,%edx
  1028f2:	0f 87 dc fe ff ff    	ja     1027d4 <balloc+0x1d>
  }
  panic("balloc: out of blocks");
  1028f8:	83 ec 0c             	sub    $0xc,%esp
  1028fb:	68 98 45 10 00       	push   $0x104598
  102900:	e8 b4 d9 ff ff       	call   1002b9 <panic>
}
  102905:	c9                   	leave  
  102906:	c3                   	ret    

00102907 <bfree>:


// Free a disk block.
static void
bfree(int dev, uint b)
{
  102907:	f3 0f 1e fb          	endbr32 
  10290b:	55                   	push   %ebp
  10290c:	89 e5                	mov    %esp,%ebp
  10290e:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  int bi, m;

  bp = bread_wr(dev, BBLOCK(b, sb));
  102911:	8b 45 0c             	mov    0xc(%ebp),%eax
  102914:	c1 e8 0c             	shr    $0xc,%eax
  102917:	89 c2                	mov    %eax,%edx
  102919:	a1 18 ee 10 00       	mov    0x10ee18,%eax
  10291e:	01 c2                	add    %eax,%edx
  102920:	8b 45 08             	mov    0x8(%ebp),%eax
  102923:	83 ec 08             	sub    $0x8,%esp
  102926:	52                   	push   %edx
  102927:	50                   	push   %eax
  102928:	e8 01 f9 ff ff       	call   10222e <bread_wr>
  10292d:	83 c4 10             	add    $0x10,%esp
  102930:	89 45 f4             	mov    %eax,-0xc(%ebp)
  bi = b % BPB;
  102933:	8b 45 0c             	mov    0xc(%ebp),%eax
  102936:	25 ff 0f 00 00       	and    $0xfff,%eax
  10293b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  m = 1 << (bi % 8);
  10293e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102941:	99                   	cltd   
  102942:	c1 ea 1d             	shr    $0x1d,%edx
  102945:	01 d0                	add    %edx,%eax
  102947:	83 e0 07             	and    $0x7,%eax
  10294a:	29 d0                	sub    %edx,%eax
  10294c:	ba 01 00 00 00       	mov    $0x1,%edx
  102951:	89 c1                	mov    %eax,%ecx
  102953:	d3 e2                	shl    %cl,%edx
  102955:	89 d0                	mov    %edx,%eax
  102957:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((bp->data[bi/8] & m) == 0)
  10295a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10295d:	8d 50 07             	lea    0x7(%eax),%edx
  102960:	85 c0                	test   %eax,%eax
  102962:	0f 48 c2             	cmovs  %edx,%eax
  102965:	c1 f8 03             	sar    $0x3,%eax
  102968:	89 c2                	mov    %eax,%edx
  10296a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10296d:	0f b6 44 10 1c       	movzbl 0x1c(%eax,%edx,1),%eax
  102972:	0f b6 c0             	movzbl %al,%eax
  102975:	23 45 ec             	and    -0x14(%ebp),%eax
  102978:	85 c0                	test   %eax,%eax
  10297a:	75 0d                	jne    102989 <bfree+0x82>
    panic("freeing free block");
  10297c:	83 ec 0c             	sub    $0xc,%esp
  10297f:	68 ae 45 10 00       	push   $0x1045ae
  102984:	e8 30 d9 ff ff       	call   1002b9 <panic>
  bp->data[bi/8] &= ~m;
  102989:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10298c:	8d 50 07             	lea    0x7(%eax),%edx
  10298f:	85 c0                	test   %eax,%eax
  102991:	0f 48 c2             	cmovs  %edx,%eax
  102994:	c1 f8 03             	sar    $0x3,%eax
  102997:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10299a:	0f b6 54 02 1c       	movzbl 0x1c(%edx,%eax,1),%edx
  10299f:	89 d1                	mov    %edx,%ecx
  1029a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1029a4:	f7 d2                	not    %edx
  1029a6:	21 ca                	and    %ecx,%edx
  1029a8:	89 d1                	mov    %edx,%ecx
  1029aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1029ad:	88 4c 02 1c          	mov    %cl,0x1c(%edx,%eax,1)
  log_write(bp);
  1029b1:	83 ec 0c             	sub    $0xc,%esp
  1029b4:	ff 75 f4             	pushl  -0xc(%ebp)
  1029b7:	e8 c6 17 00 00       	call   104182 <log_write>
  1029bc:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  1029bf:	83 ec 0c             	sub    $0xc,%esp
  1029c2:	ff 75 f4             	pushl  -0xc(%ebp)
  1029c5:	e8 af f8 ff ff       	call   102279 <brelse>
  1029ca:	83 c4 10             	add    $0x10,%esp
}
  1029cd:	90                   	nop
  1029ce:	c9                   	leave  
  1029cf:	c3                   	ret    

001029d0 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
  1029d0:	f3 0f 1e fb          	endbr32 
  1029d4:	55                   	push   %ebp
  1029d5:	89 e5                	mov    %esp,%ebp
  1029d7:	57                   	push   %edi
  1029d8:	56                   	push   %esi
  1029d9:	53                   	push   %ebx
  1029da:	83 ec 1c             	sub    $0x1c,%esp
  readsb(dev, &sb);
  1029dd:	83 ec 08             	sub    $0x8,%esp
  1029e0:	68 00 ee 10 00       	push   $0x10ee00
  1029e5:	ff 75 08             	pushl  0x8(%ebp)
  1029e8:	e8 2c fd ff ff       	call   102719 <readsb>
  1029ed:	83 c4 10             	add    $0x10,%esp
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
  1029f0:	a1 18 ee 10 00       	mov    0x10ee18,%eax
  1029f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1029f8:	8b 3d 14 ee 10 00    	mov    0x10ee14,%edi
  1029fe:	8b 35 10 ee 10 00    	mov    0x10ee10,%esi
  102a04:	8b 1d 0c ee 10 00    	mov    0x10ee0c,%ebx
  102a0a:	8b 0d 08 ee 10 00    	mov    0x10ee08,%ecx
  102a10:	8b 15 04 ee 10 00    	mov    0x10ee04,%edx
  102a16:	a1 00 ee 10 00       	mov    0x10ee00,%eax
  102a1b:	ff 75 e4             	pushl  -0x1c(%ebp)
  102a1e:	57                   	push   %edi
  102a1f:	56                   	push   %esi
  102a20:	53                   	push   %ebx
  102a21:	51                   	push   %ecx
  102a22:	52                   	push   %edx
  102a23:	50                   	push   %eax
  102a24:	68 c4 45 10 00       	push   $0x1045c4
  102a29:	e8 c2 d6 ff ff       	call   1000f0 <cprintf>
  102a2e:	83 c4 20             	add    $0x20,%esp
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
  102a31:	90                   	nop
  102a32:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102a35:	5b                   	pop    %ebx
  102a36:	5e                   	pop    %esi
  102a37:	5f                   	pop    %edi
  102a38:	5d                   	pop    %ebp
  102a39:	c3                   	ret    

00102a3a <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
  102a3a:	f3 0f 1e fb          	endbr32 
  102a3e:	55                   	push   %ebp
  102a3f:	89 e5                	mov    %esp,%ebp
  102a41:	83 ec 28             	sub    $0x28,%esp
  102a44:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a47:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
  102a4b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  102a52:	e9 9e 00 00 00       	jmp    102af5 <ialloc+0xbb>
    bp = bread_wr(dev, IBLOCK(inum, sb));
  102a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a5a:	c1 e8 03             	shr    $0x3,%eax
  102a5d:	89 c2                	mov    %eax,%edx
  102a5f:	a1 14 ee 10 00       	mov    0x10ee14,%eax
  102a64:	01 d0                	add    %edx,%eax
  102a66:	83 ec 08             	sub    $0x8,%esp
  102a69:	50                   	push   %eax
  102a6a:	ff 75 08             	pushl  0x8(%ebp)
  102a6d:	e8 bc f7 ff ff       	call   10222e <bread_wr>
  102a72:	83 c4 10             	add    $0x10,%esp
  102a75:	89 45 f0             	mov    %eax,-0x10(%ebp)
    dip = (struct dinode*)bp->data + inum%IPB;
  102a78:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a7b:	8d 50 1c             	lea    0x1c(%eax),%edx
  102a7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a81:	83 e0 07             	and    $0x7,%eax
  102a84:	c1 e0 06             	shl    $0x6,%eax
  102a87:	01 d0                	add    %edx,%eax
  102a89:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(dip->type == 0){  // a free inode
  102a8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102a8f:	0f b7 00             	movzwl (%eax),%eax
  102a92:	66 85 c0             	test   %ax,%ax
  102a95:	75 4c                	jne    102ae3 <ialloc+0xa9>
      memset(dip, 0, sizeof(*dip));
  102a97:	83 ec 04             	sub    $0x4,%esp
  102a9a:	6a 40                	push   $0x40
  102a9c:	6a 00                	push   $0x0
  102a9e:	ff 75 ec             	pushl  -0x14(%ebp)
  102aa1:	e8 6a e4 ff ff       	call   100f10 <memset>
  102aa6:	83 c4 10             	add    $0x10,%esp
      dip->type = type;
  102aa9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102aac:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
  102ab0:	66 89 10             	mov    %dx,(%eax)
      log_write(bp);   // mark it allocated on the disk
  102ab3:	83 ec 0c             	sub    $0xc,%esp
  102ab6:	ff 75 f0             	pushl  -0x10(%ebp)
  102ab9:	e8 c4 16 00 00       	call   104182 <log_write>
  102abe:	83 c4 10             	add    $0x10,%esp
      brelse(bp);
  102ac1:	83 ec 0c             	sub    $0xc,%esp
  102ac4:	ff 75 f0             	pushl  -0x10(%ebp)
  102ac7:	e8 ad f7 ff ff       	call   102279 <brelse>
  102acc:	83 c4 10             	add    $0x10,%esp
      return iget(dev, inum);
  102acf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ad2:	83 ec 08             	sub    $0x8,%esp
  102ad5:	50                   	push   %eax
  102ad6:	ff 75 08             	pushl  0x8(%ebp)
  102ad9:	e8 6c 01 00 00       	call   102c4a <iget>
  102ade:	83 c4 10             	add    $0x10,%esp
  102ae1:	eb 30                	jmp    102b13 <ialloc+0xd9>
    }
    brelse(bp);
  102ae3:	83 ec 0c             	sub    $0xc,%esp
  102ae6:	ff 75 f0             	pushl  -0x10(%ebp)
  102ae9:	e8 8b f7 ff ff       	call   102279 <brelse>
  102aee:	83 c4 10             	add    $0x10,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
  102af1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  102af5:	8b 15 08 ee 10 00    	mov    0x10ee08,%edx
  102afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102afe:	39 c2                	cmp    %eax,%edx
  102b00:	0f 87 51 ff ff ff    	ja     102a57 <ialloc+0x1d>
  }
  panic("ialloc: no inodes");
  102b06:	83 ec 0c             	sub    $0xc,%esp
  102b09:	68 17 46 10 00       	push   $0x104617
  102b0e:	e8 a6 d7 ff ff       	call   1002b9 <panic>
}
  102b13:	c9                   	leave  
  102b14:	c3                   	ret    

00102b15 <iput>:
// be recycled.
// If that was the last reference and the inode has no links
// to it, free the inode (and its content) on disk.
void
iput(struct inode *ip)
{
  102b15:	f3 0f 1e fb          	endbr32 
  102b19:	55                   	push   %ebp
  102b1a:	89 e5                	mov    %esp,%ebp
  102b1c:	83 ec 18             	sub    $0x18,%esp
  if(ip->valid && ip->nlink == 0){
  102b1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b22:	8b 40 0c             	mov    0xc(%eax),%eax
  102b25:	85 c0                	test   %eax,%eax
  102b27:	74 4a                	je     102b73 <iput+0x5e>
  102b29:	8b 45 08             	mov    0x8(%ebp),%eax
  102b2c:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  102b30:	66 85 c0             	test   %ax,%ax
  102b33:	75 3e                	jne    102b73 <iput+0x5e>
    int r = ip->ref;
  102b35:	8b 45 08             	mov    0x8(%ebp),%eax
  102b38:	8b 40 08             	mov    0x8(%eax),%eax
  102b3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(r == 1){
  102b3e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  102b42:	75 2f                	jne    102b73 <iput+0x5e>
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
  102b44:	83 ec 0c             	sub    $0xc,%esp
  102b47:	ff 75 08             	pushl  0x8(%ebp)
  102b4a:	e8 d1 03 00 00       	call   102f20 <itrunc>
  102b4f:	83 c4 10             	add    $0x10,%esp
      ip->type = 0;
  102b52:	8b 45 08             	mov    0x8(%ebp),%eax
  102b55:	66 c7 40 10 00 00    	movw   $0x0,0x10(%eax)
      iupdate(ip);
  102b5b:	83 ec 0c             	sub    $0xc,%esp
  102b5e:	ff 75 08             	pushl  0x8(%ebp)
  102b61:	e8 1f 00 00 00       	call   102b85 <iupdate>
  102b66:	83 c4 10             	add    $0x10,%esp
      ip->valid = 0;
  102b69:	8b 45 08             	mov    0x8(%ebp),%eax
  102b6c:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    }
  }
  ip->ref--;
  102b73:	8b 45 08             	mov    0x8(%ebp),%eax
  102b76:	8b 40 08             	mov    0x8(%eax),%eax
  102b79:	8d 50 ff             	lea    -0x1(%eax),%edx
  102b7c:	8b 45 08             	mov    0x8(%ebp),%eax
  102b7f:	89 50 08             	mov    %edx,0x8(%eax)
}
  102b82:	90                   	nop
  102b83:	c9                   	leave  
  102b84:	c3                   	ret    

00102b85 <iupdate>:
// Copy a modified in-memory inode to disk.
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
void
iupdate(struct inode *ip)
{
  102b85:	f3 0f 1e fb          	endbr32 
  102b89:	55                   	push   %ebp
  102b8a:	89 e5                	mov    %esp,%ebp
  102b8c:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  struct dinode *dip;

  bp = bread_wr(ip->dev, IBLOCK(ip->inum, sb));
  102b8f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b92:	8b 40 04             	mov    0x4(%eax),%eax
  102b95:	c1 e8 03             	shr    $0x3,%eax
  102b98:	89 c2                	mov    %eax,%edx
  102b9a:	a1 14 ee 10 00       	mov    0x10ee14,%eax
  102b9f:	01 c2                	add    %eax,%edx
  102ba1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ba4:	8b 00                	mov    (%eax),%eax
  102ba6:	83 ec 08             	sub    $0x8,%esp
  102ba9:	52                   	push   %edx
  102baa:	50                   	push   %eax
  102bab:	e8 7e f6 ff ff       	call   10222e <bread_wr>
  102bb0:	83 c4 10             	add    $0x10,%esp
  102bb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  102bb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bb9:	8d 50 1c             	lea    0x1c(%eax),%edx
  102bbc:	8b 45 08             	mov    0x8(%ebp),%eax
  102bbf:	8b 40 04             	mov    0x4(%eax),%eax
  102bc2:	83 e0 07             	and    $0x7,%eax
  102bc5:	c1 e0 06             	shl    $0x6,%eax
  102bc8:	01 d0                	add    %edx,%eax
  102bca:	89 45 f0             	mov    %eax,-0x10(%ebp)
  dip->type = ip->type;
  102bcd:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd0:	0f b7 50 10          	movzwl 0x10(%eax),%edx
  102bd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bd7:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
  102bda:	8b 45 08             	mov    0x8(%ebp),%eax
  102bdd:	0f b7 50 12          	movzwl 0x12(%eax),%edx
  102be1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102be4:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
  102be8:	8b 45 08             	mov    0x8(%ebp),%eax
  102beb:	0f b7 50 14          	movzwl 0x14(%eax),%edx
  102bef:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bf2:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
  102bf6:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf9:	0f b7 50 16          	movzwl 0x16(%eax),%edx
  102bfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c00:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
  102c04:	8b 45 08             	mov    0x8(%ebp),%eax
  102c07:	8b 50 18             	mov    0x18(%eax),%edx
  102c0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c0d:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  102c10:	8b 45 08             	mov    0x8(%ebp),%eax
  102c13:	8d 50 1c             	lea    0x1c(%eax),%edx
  102c16:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c19:	83 c0 0c             	add    $0xc,%eax
  102c1c:	83 ec 04             	sub    $0x4,%esp
  102c1f:	6a 34                	push   $0x34
  102c21:	52                   	push   %edx
  102c22:	50                   	push   %eax
  102c23:	e8 af e3 ff ff       	call   100fd7 <memmove>
  102c28:	83 c4 10             	add    $0x10,%esp
  log_write(bp);
  102c2b:	83 ec 0c             	sub    $0xc,%esp
  102c2e:	ff 75 f4             	pushl  -0xc(%ebp)
  102c31:	e8 4c 15 00 00       	call   104182 <log_write>
  102c36:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  102c39:	83 ec 0c             	sub    $0xc,%esp
  102c3c:	ff 75 f4             	pushl  -0xc(%ebp)
  102c3f:	e8 35 f6 ff ff       	call   102279 <brelse>
  102c44:	83 c4 10             	add    $0x10,%esp
}
  102c47:	90                   	nop
  102c48:	c9                   	leave  
  102c49:	c3                   	ret    

00102c4a <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
struct inode*
iget(uint dev, uint inum)
{
  102c4a:	f3 0f 1e fb          	endbr32 
  102c4e:	55                   	push   %ebp
  102c4f:	89 e5                	mov    %esp,%ebp
  102c51:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip, *empty;

  // Is the inode already cached?
  empty = 0;
  102c54:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
  102c5b:	c7 45 f4 20 ee 10 00 	movl   $0x10ee20,-0xc(%ebp)
  102c62:	eb 4d                	jmp    102cb1 <iget+0x67>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
  102c64:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c67:	8b 40 08             	mov    0x8(%eax),%eax
  102c6a:	85 c0                	test   %eax,%eax
  102c6c:	7e 29                	jle    102c97 <iget+0x4d>
  102c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c71:	8b 00                	mov    (%eax),%eax
  102c73:	39 45 08             	cmp    %eax,0x8(%ebp)
  102c76:	75 1f                	jne    102c97 <iget+0x4d>
  102c78:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c7b:	8b 40 04             	mov    0x4(%eax),%eax
  102c7e:	39 45 0c             	cmp    %eax,0xc(%ebp)
  102c81:	75 14                	jne    102c97 <iget+0x4d>
      ip->ref++;
  102c83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c86:	8b 40 08             	mov    0x8(%eax),%eax
  102c89:	8d 50 01             	lea    0x1(%eax),%edx
  102c8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c8f:	89 50 08             	mov    %edx,0x8(%eax)
      return ip;
  102c92:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c95:	eb 64                	jmp    102cfb <iget+0xb1>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
  102c97:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102c9b:	75 10                	jne    102cad <iget+0x63>
  102c9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ca0:	8b 40 08             	mov    0x8(%eax),%eax
  102ca3:	85 c0                	test   %eax,%eax
  102ca5:	75 06                	jne    102cad <iget+0x63>
      empty = ip;
  102ca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102caa:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
  102cad:	83 45 f4 50          	addl   $0x50,-0xc(%ebp)
  102cb1:	81 7d f4 c0 fd 10 00 	cmpl   $0x10fdc0,-0xc(%ebp)
  102cb8:	72 aa                	jb     102c64 <iget+0x1a>
  }

  // Recycle an inode cache entry.
  if(empty == 0)
  102cba:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102cbe:	75 0d                	jne    102ccd <iget+0x83>
    panic("iget: no inodes");
  102cc0:	83 ec 0c             	sub    $0xc,%esp
  102cc3:	68 29 46 10 00       	push   $0x104629
  102cc8:	e8 ec d5 ff ff       	call   1002b9 <panic>

  ip = empty;
  102ccd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cd0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  ip->dev = dev;
  102cd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102cd6:	8b 55 08             	mov    0x8(%ebp),%edx
  102cd9:	89 10                	mov    %edx,(%eax)
  ip->inum = inum;
  102cdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102cde:	8b 55 0c             	mov    0xc(%ebp),%edx
  102ce1:	89 50 04             	mov    %edx,0x4(%eax)
  ip->ref = 1;
  102ce4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ce7:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  ip->valid = 0;
  102cee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102cf1:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)

  return ip;
  102cf8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102cfb:	c9                   	leave  
  102cfc:	c3                   	ret    

00102cfd <iread>:

// Reads the inode from disk if necessary.
void
iread(struct inode *ip)
{
  102cfd:	f3 0f 1e fb          	endbr32 
  102d01:	55                   	push   %ebp
  102d02:	89 e5                	mov    %esp,%ebp
  102d04:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
  102d07:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102d0b:	74 0a                	je     102d17 <iread+0x1a>
  102d0d:	8b 45 08             	mov    0x8(%ebp),%eax
  102d10:	8b 40 08             	mov    0x8(%eax),%eax
  102d13:	85 c0                	test   %eax,%eax
  102d15:	7f 0d                	jg     102d24 <iread+0x27>
    panic("iread");
  102d17:	83 ec 0c             	sub    $0xc,%esp
  102d1a:	68 39 46 10 00       	push   $0x104639
  102d1f:	e8 95 d5 ff ff       	call   1002b9 <panic>

  if(ip->valid == 0){
  102d24:	8b 45 08             	mov    0x8(%ebp),%eax
  102d27:	8b 40 0c             	mov    0xc(%eax),%eax
  102d2a:	85 c0                	test   %eax,%eax
  102d2c:	0f 85 cd 00 00 00    	jne    102dff <iread+0x102>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  102d32:	8b 45 08             	mov    0x8(%ebp),%eax
  102d35:	8b 40 04             	mov    0x4(%eax),%eax
  102d38:	c1 e8 03             	shr    $0x3,%eax
  102d3b:	89 c2                	mov    %eax,%edx
  102d3d:	a1 14 ee 10 00       	mov    0x10ee14,%eax
  102d42:	01 c2                	add    %eax,%edx
  102d44:	8b 45 08             	mov    0x8(%ebp),%eax
  102d47:	8b 00                	mov    (%eax),%eax
  102d49:	83 ec 08             	sub    $0x8,%esp
  102d4c:	52                   	push   %edx
  102d4d:	50                   	push   %eax
  102d4e:	e8 74 f4 ff ff       	call   1021c7 <bread>
  102d53:	83 c4 10             	add    $0x10,%esp
  102d56:	89 45 f4             	mov    %eax,-0xc(%ebp)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
  102d59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d5c:	8d 50 1c             	lea    0x1c(%eax),%edx
  102d5f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d62:	8b 40 04             	mov    0x4(%eax),%eax
  102d65:	83 e0 07             	and    $0x7,%eax
  102d68:	c1 e0 06             	shl    $0x6,%eax
  102d6b:	01 d0                	add    %edx,%eax
  102d6d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    ip->type = dip->type;
  102d70:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d73:	0f b7 10             	movzwl (%eax),%edx
  102d76:	8b 45 08             	mov    0x8(%ebp),%eax
  102d79:	66 89 50 10          	mov    %dx,0x10(%eax)
    ip->major = dip->major;
  102d7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d80:	0f b7 50 02          	movzwl 0x2(%eax),%edx
  102d84:	8b 45 08             	mov    0x8(%ebp),%eax
  102d87:	66 89 50 12          	mov    %dx,0x12(%eax)
    ip->minor = dip->minor;
  102d8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d8e:	0f b7 50 04          	movzwl 0x4(%eax),%edx
  102d92:	8b 45 08             	mov    0x8(%ebp),%eax
  102d95:	66 89 50 14          	mov    %dx,0x14(%eax)
    ip->nlink = dip->nlink;
  102d99:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d9c:	0f b7 50 06          	movzwl 0x6(%eax),%edx
  102da0:	8b 45 08             	mov    0x8(%ebp),%eax
  102da3:	66 89 50 16          	mov    %dx,0x16(%eax)
    ip->size = dip->size;
  102da7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102daa:	8b 50 08             	mov    0x8(%eax),%edx
  102dad:	8b 45 08             	mov    0x8(%ebp),%eax
  102db0:	89 50 18             	mov    %edx,0x18(%eax)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
  102db3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102db6:	8d 50 0c             	lea    0xc(%eax),%edx
  102db9:	8b 45 08             	mov    0x8(%ebp),%eax
  102dbc:	83 c0 1c             	add    $0x1c,%eax
  102dbf:	83 ec 04             	sub    $0x4,%esp
  102dc2:	6a 34                	push   $0x34
  102dc4:	52                   	push   %edx
  102dc5:	50                   	push   %eax
  102dc6:	e8 0c e2 ff ff       	call   100fd7 <memmove>
  102dcb:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  102dce:	83 ec 0c             	sub    $0xc,%esp
  102dd1:	ff 75 f4             	pushl  -0xc(%ebp)
  102dd4:	e8 a0 f4 ff ff       	call   102279 <brelse>
  102dd9:	83 c4 10             	add    $0x10,%esp
    ip->valid = 1;
  102ddc:	8b 45 08             	mov    0x8(%ebp),%eax
  102ddf:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
    if(ip->type == 0)
  102de6:	8b 45 08             	mov    0x8(%ebp),%eax
  102de9:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  102ded:	66 85 c0             	test   %ax,%ax
  102df0:	75 0d                	jne    102dff <iread+0x102>
      panic("iread: no type");
  102df2:	83 ec 0c             	sub    $0xc,%esp
  102df5:	68 3f 46 10 00       	push   $0x10463f
  102dfa:	e8 ba d4 ff ff       	call   1002b9 <panic>
  }
}
  102dff:	90                   	nop
  102e00:	c9                   	leave  
  102e01:	c3                   	ret    

00102e02 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
  102e02:	f3 0f 1e fb          	endbr32 
  102e06:	55                   	push   %ebp
  102e07:	89 e5                	mov    %esp,%ebp
  102e09:	83 ec 18             	sub    $0x18,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
  102e0c:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
  102e10:	77 42                	ja     102e54 <bmap+0x52>
    if((addr = ip->addrs[bn]) == 0)
  102e12:	8b 45 08             	mov    0x8(%ebp),%eax
  102e15:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e18:	83 c2 04             	add    $0x4,%edx
  102e1b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102e1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e22:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102e26:	75 24                	jne    102e4c <bmap+0x4a>
      ip->addrs[bn] = addr = balloc(ip->dev);
  102e28:	8b 45 08             	mov    0x8(%ebp),%eax
  102e2b:	8b 00                	mov    (%eax),%eax
  102e2d:	83 ec 0c             	sub    $0xc,%esp
  102e30:	50                   	push   %eax
  102e31:	e8 81 f9 ff ff       	call   1027b7 <balloc>
  102e36:	83 c4 10             	add    $0x10,%esp
  102e39:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e3c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e3f:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e42:	8d 4a 04             	lea    0x4(%edx),%ecx
  102e45:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e48:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    return addr;
  102e4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e4f:	e9 ca 00 00 00       	jmp    102f1e <bmap+0x11c>
  }
  bn -= NDIRECT;
  102e54:	83 6d 0c 0c          	subl   $0xc,0xc(%ebp)

  if(bn < NINDIRECT){
  102e58:	83 7d 0c 7f          	cmpl   $0x7f,0xc(%ebp)
  102e5c:	0f 87 af 00 00 00    	ja     102f11 <bmap+0x10f>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
  102e62:	8b 45 08             	mov    0x8(%ebp),%eax
  102e65:	8b 40 4c             	mov    0x4c(%eax),%eax
  102e68:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e6b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102e6f:	75 1d                	jne    102e8e <bmap+0x8c>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
  102e71:	8b 45 08             	mov    0x8(%ebp),%eax
  102e74:	8b 00                	mov    (%eax),%eax
  102e76:	83 ec 0c             	sub    $0xc,%esp
  102e79:	50                   	push   %eax
  102e7a:	e8 38 f9 ff ff       	call   1027b7 <balloc>
  102e7f:	83 c4 10             	add    $0x10,%esp
  102e82:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e85:	8b 45 08             	mov    0x8(%ebp),%eax
  102e88:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e8b:	89 50 4c             	mov    %edx,0x4c(%eax)
    bp = bread_wr(ip->dev, addr);
  102e8e:	8b 45 08             	mov    0x8(%ebp),%eax
  102e91:	8b 00                	mov    (%eax),%eax
  102e93:	83 ec 08             	sub    $0x8,%esp
  102e96:	ff 75 f4             	pushl  -0xc(%ebp)
  102e99:	50                   	push   %eax
  102e9a:	e8 8f f3 ff ff       	call   10222e <bread_wr>
  102e9f:	83 c4 10             	add    $0x10,%esp
  102ea2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    a = (uint*)bp->data;
  102ea5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ea8:	83 c0 1c             	add    $0x1c,%eax
  102eab:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((addr = a[bn]) == 0){
  102eae:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eb1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102eb8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ebb:	01 d0                	add    %edx,%eax
  102ebd:	8b 00                	mov    (%eax),%eax
  102ebf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ec2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102ec6:	75 36                	jne    102efe <bmap+0xfc>
      a[bn] = addr = balloc(ip->dev);
  102ec8:	8b 45 08             	mov    0x8(%ebp),%eax
  102ecb:	8b 00                	mov    (%eax),%eax
  102ecd:	83 ec 0c             	sub    $0xc,%esp
  102ed0:	50                   	push   %eax
  102ed1:	e8 e1 f8 ff ff       	call   1027b7 <balloc>
  102ed6:	83 c4 10             	add    $0x10,%esp
  102ed9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102edc:	8b 45 0c             	mov    0xc(%ebp),%eax
  102edf:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102ee6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ee9:	01 c2                	add    %eax,%edx
  102eeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102eee:	89 02                	mov    %eax,(%edx)
      log_write(bp);
  102ef0:	83 ec 0c             	sub    $0xc,%esp
  102ef3:	ff 75 f0             	pushl  -0x10(%ebp)
  102ef6:	e8 87 12 00 00       	call   104182 <log_write>
  102efb:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  102efe:	83 ec 0c             	sub    $0xc,%esp
  102f01:	ff 75 f0             	pushl  -0x10(%ebp)
  102f04:	e8 70 f3 ff ff       	call   102279 <brelse>
  102f09:	83 c4 10             	add    $0x10,%esp
    return addr;
  102f0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102f0f:	eb 0d                	jmp    102f1e <bmap+0x11c>
  }

  panic("bmap: out of range");
  102f11:	83 ec 0c             	sub    $0xc,%esp
  102f14:	68 4e 46 10 00       	push   $0x10464e
  102f19:	e8 9b d3 ff ff       	call   1002b9 <panic>
}
  102f1e:	c9                   	leave  
  102f1f:	c3                   	ret    

00102f20 <itrunc>:
// to it (no directory entries referring to it)
// and has no in-memory reference to it (is
// not an open file or current directory).
static void
itrunc(struct inode *ip)
{
  102f20:	f3 0f 1e fb          	endbr32 
  102f24:	55                   	push   %ebp
  102f25:	89 e5                	mov    %esp,%ebp
  102f27:	83 ec 18             	sub    $0x18,%esp
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
  102f2a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102f31:	eb 45                	jmp    102f78 <itrunc+0x58>
    if(ip->addrs[i]){
  102f33:	8b 45 08             	mov    0x8(%ebp),%eax
  102f36:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f39:	83 c2 04             	add    $0x4,%edx
  102f3c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102f40:	85 c0                	test   %eax,%eax
  102f42:	74 30                	je     102f74 <itrunc+0x54>
      bfree(ip->dev, ip->addrs[i]);
  102f44:	8b 45 08             	mov    0x8(%ebp),%eax
  102f47:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f4a:	83 c2 04             	add    $0x4,%edx
  102f4d:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102f51:	8b 55 08             	mov    0x8(%ebp),%edx
  102f54:	8b 12                	mov    (%edx),%edx
  102f56:	83 ec 08             	sub    $0x8,%esp
  102f59:	50                   	push   %eax
  102f5a:	52                   	push   %edx
  102f5b:	e8 a7 f9 ff ff       	call   102907 <bfree>
  102f60:	83 c4 10             	add    $0x10,%esp
      ip->addrs[i] = 0;
  102f63:	8b 45 08             	mov    0x8(%ebp),%eax
  102f66:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f69:	83 c2 04             	add    $0x4,%edx
  102f6c:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
  102f73:	00 
  for(i = 0; i < NDIRECT; i++){
  102f74:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  102f78:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
  102f7c:	7e b5                	jle    102f33 <itrunc+0x13>
    }
  }

  if(ip->addrs[NDIRECT]){
  102f7e:	8b 45 08             	mov    0x8(%ebp),%eax
  102f81:	8b 40 4c             	mov    0x4c(%eax),%eax
  102f84:	85 c0                	test   %eax,%eax
  102f86:	0f 84 a1 00 00 00    	je     10302d <itrunc+0x10d>
    bp = bread_wr(ip->dev, ip->addrs[NDIRECT]);
  102f8c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f8f:	8b 50 4c             	mov    0x4c(%eax),%edx
  102f92:	8b 45 08             	mov    0x8(%ebp),%eax
  102f95:	8b 00                	mov    (%eax),%eax
  102f97:	83 ec 08             	sub    $0x8,%esp
  102f9a:	52                   	push   %edx
  102f9b:	50                   	push   %eax
  102f9c:	e8 8d f2 ff ff       	call   10222e <bread_wr>
  102fa1:	83 c4 10             	add    $0x10,%esp
  102fa4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    a = (uint*)bp->data;
  102fa7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102faa:	83 c0 1c             	add    $0x1c,%eax
  102fad:	89 45 e8             	mov    %eax,-0x18(%ebp)
    for(j = 0; j < NINDIRECT; j++){
  102fb0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  102fb7:	eb 3c                	jmp    102ff5 <itrunc+0xd5>
      if(a[j])
  102fb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fbc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102fc3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102fc6:	01 d0                	add    %edx,%eax
  102fc8:	8b 00                	mov    (%eax),%eax
  102fca:	85 c0                	test   %eax,%eax
  102fcc:	74 23                	je     102ff1 <itrunc+0xd1>
        bfree(ip->dev, a[j]);
  102fce:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fd1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102fd8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102fdb:	01 d0                	add    %edx,%eax
  102fdd:	8b 00                	mov    (%eax),%eax
  102fdf:	8b 55 08             	mov    0x8(%ebp),%edx
  102fe2:	8b 12                	mov    (%edx),%edx
  102fe4:	83 ec 08             	sub    $0x8,%esp
  102fe7:	50                   	push   %eax
  102fe8:	52                   	push   %edx
  102fe9:	e8 19 f9 ff ff       	call   102907 <bfree>
  102fee:	83 c4 10             	add    $0x10,%esp
    for(j = 0; j < NINDIRECT; j++){
  102ff1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  102ff5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ff8:	83 f8 7f             	cmp    $0x7f,%eax
  102ffb:	76 bc                	jbe    102fb9 <itrunc+0x99>
    }
    brelse(bp);
  102ffd:	83 ec 0c             	sub    $0xc,%esp
  103000:	ff 75 ec             	pushl  -0x14(%ebp)
  103003:	e8 71 f2 ff ff       	call   102279 <brelse>
  103008:	83 c4 10             	add    $0x10,%esp
    bfree(ip->dev, ip->addrs[NDIRECT]);
  10300b:	8b 45 08             	mov    0x8(%ebp),%eax
  10300e:	8b 40 4c             	mov    0x4c(%eax),%eax
  103011:	8b 55 08             	mov    0x8(%ebp),%edx
  103014:	8b 12                	mov    (%edx),%edx
  103016:	83 ec 08             	sub    $0x8,%esp
  103019:	50                   	push   %eax
  10301a:	52                   	push   %edx
  10301b:	e8 e7 f8 ff ff       	call   102907 <bfree>
  103020:	83 c4 10             	add    $0x10,%esp
    ip->addrs[NDIRECT] = 0;
  103023:	8b 45 08             	mov    0x8(%ebp),%eax
  103026:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
  }

  ip->size = 0;
  10302d:	8b 45 08             	mov    0x8(%ebp),%eax
  103030:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  iupdate(ip);
  103037:	83 ec 0c             	sub    $0xc,%esp
  10303a:	ff 75 08             	pushl  0x8(%ebp)
  10303d:	e8 43 fb ff ff       	call   102b85 <iupdate>
  103042:	83 c4 10             	add    $0x10,%esp
}
  103045:	90                   	nop
  103046:	c9                   	leave  
  103047:	c3                   	ret    

00103048 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
  103048:	f3 0f 1e fb          	endbr32 
  10304c:	55                   	push   %ebp
  10304d:	89 e5                	mov    %esp,%ebp
  st->dev = ip->dev;
  10304f:	8b 45 08             	mov    0x8(%ebp),%eax
  103052:	8b 00                	mov    (%eax),%eax
  103054:	89 c2                	mov    %eax,%edx
  103056:	8b 45 0c             	mov    0xc(%ebp),%eax
  103059:	89 50 04             	mov    %edx,0x4(%eax)
  st->ino = ip->inum;
  10305c:	8b 45 08             	mov    0x8(%ebp),%eax
  10305f:	8b 50 04             	mov    0x4(%eax),%edx
  103062:	8b 45 0c             	mov    0xc(%ebp),%eax
  103065:	89 50 08             	mov    %edx,0x8(%eax)
  st->type = ip->type;
  103068:	8b 45 08             	mov    0x8(%ebp),%eax
  10306b:	0f b7 50 10          	movzwl 0x10(%eax),%edx
  10306f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103072:	66 89 10             	mov    %dx,(%eax)
  st->nlink = ip->nlink;
  103075:	8b 45 08             	mov    0x8(%ebp),%eax
  103078:	0f b7 50 16          	movzwl 0x16(%eax),%edx
  10307c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10307f:	66 89 50 0c          	mov    %dx,0xc(%eax)
  st->size = ip->size;
  103083:	8b 45 08             	mov    0x8(%ebp),%eax
  103086:	8b 50 18             	mov    0x18(%eax),%edx
  103089:	8b 45 0c             	mov    0xc(%ebp),%eax
  10308c:	89 50 10             	mov    %edx,0x10(%eax)
}
  10308f:	90                   	nop
  103090:	5d                   	pop    %ebp
  103091:	c3                   	ret    

00103092 <readi>:

// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
  103092:	f3 0f 1e fb          	endbr32 
  103096:	55                   	push   %ebp
  103097:	89 e5                	mov    %esp,%ebp
  103099:	83 ec 18             	sub    $0x18,%esp
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off || ip->nlink < 1)
  10309c:	8b 45 08             	mov    0x8(%ebp),%eax
  10309f:	8b 40 18             	mov    0x18(%eax),%eax
  1030a2:	39 45 10             	cmp    %eax,0x10(%ebp)
  1030a5:	77 19                	ja     1030c0 <readi+0x2e>
  1030a7:	8b 55 10             	mov    0x10(%ebp),%edx
  1030aa:	8b 45 14             	mov    0x14(%ebp),%eax
  1030ad:	01 d0                	add    %edx,%eax
  1030af:	39 45 10             	cmp    %eax,0x10(%ebp)
  1030b2:	77 0c                	ja     1030c0 <readi+0x2e>
  1030b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b7:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  1030bb:	66 85 c0             	test   %ax,%ax
  1030be:	7f 0a                	jg     1030ca <readi+0x38>
    return -1;
  1030c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1030c5:	e9 c2 00 00 00       	jmp    10318c <readi+0xfa>
  if(off + n > ip->size)
  1030ca:	8b 55 10             	mov    0x10(%ebp),%edx
  1030cd:	8b 45 14             	mov    0x14(%ebp),%eax
  1030d0:	01 c2                	add    %eax,%edx
  1030d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d5:	8b 40 18             	mov    0x18(%eax),%eax
  1030d8:	39 c2                	cmp    %eax,%edx
  1030da:	76 0c                	jbe    1030e8 <readi+0x56>
    n = ip->size - off;
  1030dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1030df:	8b 40 18             	mov    0x18(%eax),%eax
  1030e2:	2b 45 10             	sub    0x10(%ebp),%eax
  1030e5:	89 45 14             	mov    %eax,0x14(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
  1030e8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1030ef:	e9 89 00 00 00       	jmp    10317d <readi+0xeb>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
  1030f4:	8b 45 10             	mov    0x10(%ebp),%eax
  1030f7:	c1 e8 09             	shr    $0x9,%eax
  1030fa:	83 ec 08             	sub    $0x8,%esp
  1030fd:	50                   	push   %eax
  1030fe:	ff 75 08             	pushl  0x8(%ebp)
  103101:	e8 fc fc ff ff       	call   102e02 <bmap>
  103106:	83 c4 10             	add    $0x10,%esp
  103109:	8b 55 08             	mov    0x8(%ebp),%edx
  10310c:	8b 12                	mov    (%edx),%edx
  10310e:	83 ec 08             	sub    $0x8,%esp
  103111:	50                   	push   %eax
  103112:	52                   	push   %edx
  103113:	e8 af f0 ff ff       	call   1021c7 <bread>
  103118:	83 c4 10             	add    $0x10,%esp
  10311b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
  10311e:	8b 45 10             	mov    0x10(%ebp),%eax
  103121:	25 ff 01 00 00       	and    $0x1ff,%eax
  103126:	ba 00 02 00 00       	mov    $0x200,%edx
  10312b:	29 c2                	sub    %eax,%edx
  10312d:	8b 45 14             	mov    0x14(%ebp),%eax
  103130:	2b 45 f4             	sub    -0xc(%ebp),%eax
  103133:	39 c2                	cmp    %eax,%edx
  103135:	0f 46 c2             	cmovbe %edx,%eax
  103138:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(dst, bp->data + off%BSIZE, m);
  10313b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10313e:	8d 50 1c             	lea    0x1c(%eax),%edx
  103141:	8b 45 10             	mov    0x10(%ebp),%eax
  103144:	25 ff 01 00 00       	and    $0x1ff,%eax
  103149:	01 d0                	add    %edx,%eax
  10314b:	83 ec 04             	sub    $0x4,%esp
  10314e:	ff 75 ec             	pushl  -0x14(%ebp)
  103151:	50                   	push   %eax
  103152:	ff 75 0c             	pushl  0xc(%ebp)
  103155:	e8 7d de ff ff       	call   100fd7 <memmove>
  10315a:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  10315d:	83 ec 0c             	sub    $0xc,%esp
  103160:	ff 75 f0             	pushl  -0x10(%ebp)
  103163:	e8 11 f1 ff ff       	call   102279 <brelse>
  103168:	83 c4 10             	add    $0x10,%esp
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
  10316b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10316e:	01 45 f4             	add    %eax,-0xc(%ebp)
  103171:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103174:	01 45 10             	add    %eax,0x10(%ebp)
  103177:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10317a:	01 45 0c             	add    %eax,0xc(%ebp)
  10317d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103180:	3b 45 14             	cmp    0x14(%ebp),%eax
  103183:	0f 82 6b ff ff ff    	jb     1030f4 <readi+0x62>
  }
  return n;
  103189:	8b 45 14             	mov    0x14(%ebp),%eax
}
  10318c:	c9                   	leave  
  10318d:	c3                   	ret    

0010318e <writei>:

// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
  10318e:	f3 0f 1e fb          	endbr32 
  103192:	55                   	push   %ebp
  103193:	89 e5                	mov    %esp,%ebp
  103195:	83 ec 18             	sub    $0x18,%esp
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
  103198:	8b 45 08             	mov    0x8(%ebp),%eax
  10319b:	8b 40 18             	mov    0x18(%eax),%eax
  10319e:	39 45 10             	cmp    %eax,0x10(%ebp)
  1031a1:	77 0d                	ja     1031b0 <writei+0x22>
  1031a3:	8b 55 10             	mov    0x10(%ebp),%edx
  1031a6:	8b 45 14             	mov    0x14(%ebp),%eax
  1031a9:	01 d0                	add    %edx,%eax
  1031ab:	39 45 10             	cmp    %eax,0x10(%ebp)
  1031ae:	76 0a                	jbe    1031ba <writei+0x2c>
    return -1;
  1031b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1031b5:	e9 f3 00 00 00       	jmp    1032ad <writei+0x11f>
  if(off + n > MAXFILE*BSIZE)
  1031ba:	8b 55 10             	mov    0x10(%ebp),%edx
  1031bd:	8b 45 14             	mov    0x14(%ebp),%eax
  1031c0:	01 d0                	add    %edx,%eax
  1031c2:	3d 00 18 01 00       	cmp    $0x11800,%eax
  1031c7:	76 0a                	jbe    1031d3 <writei+0x45>
    return -1;
  1031c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1031ce:	e9 da 00 00 00       	jmp    1032ad <writei+0x11f>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
  1031d3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1031da:	e9 97 00 00 00       	jmp    103276 <writei+0xe8>
    bp = bread_wr(ip->dev, bmap(ip, off/BSIZE));
  1031df:	8b 45 10             	mov    0x10(%ebp),%eax
  1031e2:	c1 e8 09             	shr    $0x9,%eax
  1031e5:	83 ec 08             	sub    $0x8,%esp
  1031e8:	50                   	push   %eax
  1031e9:	ff 75 08             	pushl  0x8(%ebp)
  1031ec:	e8 11 fc ff ff       	call   102e02 <bmap>
  1031f1:	83 c4 10             	add    $0x10,%esp
  1031f4:	8b 55 08             	mov    0x8(%ebp),%edx
  1031f7:	8b 12                	mov    (%edx),%edx
  1031f9:	83 ec 08             	sub    $0x8,%esp
  1031fc:	50                   	push   %eax
  1031fd:	52                   	push   %edx
  1031fe:	e8 2b f0 ff ff       	call   10222e <bread_wr>
  103203:	83 c4 10             	add    $0x10,%esp
  103206:	89 45 f0             	mov    %eax,-0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
  103209:	8b 45 10             	mov    0x10(%ebp),%eax
  10320c:	25 ff 01 00 00       	and    $0x1ff,%eax
  103211:	ba 00 02 00 00       	mov    $0x200,%edx
  103216:	29 c2                	sub    %eax,%edx
  103218:	8b 45 14             	mov    0x14(%ebp),%eax
  10321b:	2b 45 f4             	sub    -0xc(%ebp),%eax
  10321e:	39 c2                	cmp    %eax,%edx
  103220:	0f 46 c2             	cmovbe %edx,%eax
  103223:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(bp->data + off%BSIZE, src, m);
  103226:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103229:	8d 50 1c             	lea    0x1c(%eax),%edx
  10322c:	8b 45 10             	mov    0x10(%ebp),%eax
  10322f:	25 ff 01 00 00       	and    $0x1ff,%eax
  103234:	01 d0                	add    %edx,%eax
  103236:	83 ec 04             	sub    $0x4,%esp
  103239:	ff 75 ec             	pushl  -0x14(%ebp)
  10323c:	ff 75 0c             	pushl  0xc(%ebp)
  10323f:	50                   	push   %eax
  103240:	e8 92 dd ff ff       	call   100fd7 <memmove>
  103245:	83 c4 10             	add    $0x10,%esp
    log_write(bp);
  103248:	83 ec 0c             	sub    $0xc,%esp
  10324b:	ff 75 f0             	pushl  -0x10(%ebp)
  10324e:	e8 2f 0f 00 00       	call   104182 <log_write>
  103253:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  103256:	83 ec 0c             	sub    $0xc,%esp
  103259:	ff 75 f0             	pushl  -0x10(%ebp)
  10325c:	e8 18 f0 ff ff       	call   102279 <brelse>
  103261:	83 c4 10             	add    $0x10,%esp
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
  103264:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103267:	01 45 f4             	add    %eax,-0xc(%ebp)
  10326a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10326d:	01 45 10             	add    %eax,0x10(%ebp)
  103270:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103273:	01 45 0c             	add    %eax,0xc(%ebp)
  103276:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103279:	3b 45 14             	cmp    0x14(%ebp),%eax
  10327c:	0f 82 5d ff ff ff    	jb     1031df <writei+0x51>
  }

  if(n > 0 && off > ip->size){
  103282:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  103286:	74 22                	je     1032aa <writei+0x11c>
  103288:	8b 45 08             	mov    0x8(%ebp),%eax
  10328b:	8b 40 18             	mov    0x18(%eax),%eax
  10328e:	39 45 10             	cmp    %eax,0x10(%ebp)
  103291:	76 17                	jbe    1032aa <writei+0x11c>
    ip->size = off;
  103293:	8b 45 08             	mov    0x8(%ebp),%eax
  103296:	8b 55 10             	mov    0x10(%ebp),%edx
  103299:	89 50 18             	mov    %edx,0x18(%eax)
    iupdate(ip);
  10329c:	83 ec 0c             	sub    $0xc,%esp
  10329f:	ff 75 08             	pushl  0x8(%ebp)
  1032a2:	e8 de f8 ff ff       	call   102b85 <iupdate>
  1032a7:	83 c4 10             	add    $0x10,%esp
  }
  return n;
  1032aa:	8b 45 14             	mov    0x14(%ebp),%eax
}
  1032ad:	c9                   	leave  
  1032ae:	c3                   	ret    

001032af <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
  1032af:	f3 0f 1e fb          	endbr32 
  1032b3:	55                   	push   %ebp
  1032b4:	89 e5                	mov    %esp,%ebp
  1032b6:	83 ec 08             	sub    $0x8,%esp
  return strncmp(s, t, DIRSIZ);
  1032b9:	83 ec 04             	sub    $0x4,%esp
  1032bc:	6a 0e                	push   $0xe
  1032be:	ff 75 0c             	pushl  0xc(%ebp)
  1032c1:	ff 75 08             	pushl  0x8(%ebp)
  1032c4:	e8 ac dd ff ff       	call   101075 <strncmp>
  1032c9:	83 c4 10             	add    $0x10,%esp
}
  1032cc:	c9                   	leave  
  1032cd:	c3                   	ret    

001032ce <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
  1032ce:	f3 0f 1e fb          	endbr32 
  1032d2:	55                   	push   %ebp
  1032d3:	89 e5                	mov    %esp,%ebp
  1032d5:	83 ec 28             	sub    $0x28,%esp
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
  1032d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1032db:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  1032df:	66 83 f8 01          	cmp    $0x1,%ax
  1032e3:	74 0d                	je     1032f2 <dirlookup+0x24>
    panic("dirlookup not DIR");
  1032e5:	83 ec 0c             	sub    $0xc,%esp
  1032e8:	68 61 46 10 00       	push   $0x104661
  1032ed:	e8 c7 cf ff ff       	call   1002b9 <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
  1032f2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1032f9:	eb 7b                	jmp    103376 <dirlookup+0xa8>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  1032fb:	6a 10                	push   $0x10
  1032fd:	ff 75 f4             	pushl  -0xc(%ebp)
  103300:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103303:	50                   	push   %eax
  103304:	ff 75 08             	pushl  0x8(%ebp)
  103307:	e8 86 fd ff ff       	call   103092 <readi>
  10330c:	83 c4 10             	add    $0x10,%esp
  10330f:	83 f8 10             	cmp    $0x10,%eax
  103312:	74 0d                	je     103321 <dirlookup+0x53>
      panic("dirlookup read");
  103314:	83 ec 0c             	sub    $0xc,%esp
  103317:	68 73 46 10 00       	push   $0x104673
  10331c:	e8 98 cf ff ff       	call   1002b9 <panic>
    if(de.inum == 0)
  103321:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  103325:	66 85 c0             	test   %ax,%ax
  103328:	74 47                	je     103371 <dirlookup+0xa3>
      continue;
    if(namecmp(name, de.name) == 0){
  10332a:	83 ec 08             	sub    $0x8,%esp
  10332d:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103330:	83 c0 02             	add    $0x2,%eax
  103333:	50                   	push   %eax
  103334:	ff 75 0c             	pushl  0xc(%ebp)
  103337:	e8 73 ff ff ff       	call   1032af <namecmp>
  10333c:	83 c4 10             	add    $0x10,%esp
  10333f:	85 c0                	test   %eax,%eax
  103341:	75 2f                	jne    103372 <dirlookup+0xa4>
      // entry matches path element
      if(poff)
  103343:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103347:	74 08                	je     103351 <dirlookup+0x83>
        *poff = off;
  103349:	8b 45 10             	mov    0x10(%ebp),%eax
  10334c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10334f:	89 10                	mov    %edx,(%eax)
      inum = de.inum;
  103351:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  103355:	0f b7 c0             	movzwl %ax,%eax
  103358:	89 45 f0             	mov    %eax,-0x10(%ebp)
      return iget(dp->dev, inum);
  10335b:	8b 45 08             	mov    0x8(%ebp),%eax
  10335e:	8b 00                	mov    (%eax),%eax
  103360:	83 ec 08             	sub    $0x8,%esp
  103363:	ff 75 f0             	pushl  -0x10(%ebp)
  103366:	50                   	push   %eax
  103367:	e8 de f8 ff ff       	call   102c4a <iget>
  10336c:	83 c4 10             	add    $0x10,%esp
  10336f:	eb 19                	jmp    10338a <dirlookup+0xbc>
      continue;
  103371:	90                   	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
  103372:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
  103376:	8b 45 08             	mov    0x8(%ebp),%eax
  103379:	8b 40 18             	mov    0x18(%eax),%eax
  10337c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  10337f:	0f 82 76 ff ff ff    	jb     1032fb <dirlookup+0x2d>
    }
  }

  return 0;
  103385:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10338a:	c9                   	leave  
  10338b:	c3                   	ret    

0010338c <dirlink>:


// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
  10338c:	f3 0f 1e fb          	endbr32 
  103390:	55                   	push   %ebp
  103391:	89 e5                	mov    %esp,%ebp
  103393:	83 ec 28             	sub    $0x28,%esp
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
  103396:	83 ec 04             	sub    $0x4,%esp
  103399:	6a 00                	push   $0x0
  10339b:	ff 75 0c             	pushl  0xc(%ebp)
  10339e:	ff 75 08             	pushl  0x8(%ebp)
  1033a1:	e8 28 ff ff ff       	call   1032ce <dirlookup>
  1033a6:	83 c4 10             	add    $0x10,%esp
  1033a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033ac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1033b0:	74 18                	je     1033ca <dirlink+0x3e>
    iput(ip);
  1033b2:	83 ec 0c             	sub    $0xc,%esp
  1033b5:	ff 75 f0             	pushl  -0x10(%ebp)
  1033b8:	e8 58 f7 ff ff       	call   102b15 <iput>
  1033bd:	83 c4 10             	add    $0x10,%esp
    return -1;
  1033c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1033c5:	e9 9c 00 00 00       	jmp    103466 <dirlink+0xda>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
  1033ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1033d1:	eb 39                	jmp    10340c <dirlink+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  1033d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1033d6:	6a 10                	push   $0x10
  1033d8:	50                   	push   %eax
  1033d9:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1033dc:	50                   	push   %eax
  1033dd:	ff 75 08             	pushl  0x8(%ebp)
  1033e0:	e8 ad fc ff ff       	call   103092 <readi>
  1033e5:	83 c4 10             	add    $0x10,%esp
  1033e8:	83 f8 10             	cmp    $0x10,%eax
  1033eb:	74 0d                	je     1033fa <dirlink+0x6e>
      panic("dirlink read");
  1033ed:	83 ec 0c             	sub    $0xc,%esp
  1033f0:	68 82 46 10 00       	push   $0x104682
  1033f5:	e8 bf ce ff ff       	call   1002b9 <panic>
    if(de.inum == 0)
  1033fa:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  1033fe:	66 85 c0             	test   %ax,%ax
  103401:	74 18                	je     10341b <dirlink+0x8f>
  for(off = 0; off < dp->size; off += sizeof(de)){
  103403:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103406:	83 c0 10             	add    $0x10,%eax
  103409:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10340c:	8b 45 08             	mov    0x8(%ebp),%eax
  10340f:	8b 50 18             	mov    0x18(%eax),%edx
  103412:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103415:	39 c2                	cmp    %eax,%edx
  103417:	77 ba                	ja     1033d3 <dirlink+0x47>
  103419:	eb 01                	jmp    10341c <dirlink+0x90>
      break;
  10341b:	90                   	nop
  }

  strncpy(de.name, name, DIRSIZ);
  10341c:	83 ec 04             	sub    $0x4,%esp
  10341f:	6a 0e                	push   $0xe
  103421:	ff 75 0c             	pushl  0xc(%ebp)
  103424:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103427:	83 c0 02             	add    $0x2,%eax
  10342a:	50                   	push   %eax
  10342b:	e8 9f dc ff ff       	call   1010cf <strncpy>
  103430:	83 c4 10             	add    $0x10,%esp
  de.inum = inum;
  103433:	8b 45 10             	mov    0x10(%ebp),%eax
  103436:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  10343a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10343d:	6a 10                	push   $0x10
  10343f:	50                   	push   %eax
  103440:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103443:	50                   	push   %eax
  103444:	ff 75 08             	pushl  0x8(%ebp)
  103447:	e8 42 fd ff ff       	call   10318e <writei>
  10344c:	83 c4 10             	add    $0x10,%esp
  10344f:	83 f8 10             	cmp    $0x10,%eax
  103452:	74 0d                	je     103461 <dirlink+0xd5>
    panic("dirlink");
  103454:	83 ec 0c             	sub    $0xc,%esp
  103457:	68 8f 46 10 00       	push   $0x10468f
  10345c:	e8 58 ce ff ff       	call   1002b9 <panic>

  return 0;
  103461:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103466:	c9                   	leave  
  103467:	c3                   	ret    

00103468 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
  103468:	f3 0f 1e fb          	endbr32 
  10346c:	55                   	push   %ebp
  10346d:	89 e5                	mov    %esp,%ebp
  10346f:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int len;

  while(*path == '/')
  103472:	eb 04                	jmp    103478 <skipelem+0x10>
    path++;
  103474:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path == '/')
  103478:	8b 45 08             	mov    0x8(%ebp),%eax
  10347b:	0f b6 00             	movzbl (%eax),%eax
  10347e:	3c 2f                	cmp    $0x2f,%al
  103480:	74 f2                	je     103474 <skipelem+0xc>
  if(*path == 0)
  103482:	8b 45 08             	mov    0x8(%ebp),%eax
  103485:	0f b6 00             	movzbl (%eax),%eax
  103488:	84 c0                	test   %al,%al
  10348a:	75 07                	jne    103493 <skipelem+0x2b>
    return 0;
  10348c:	b8 00 00 00 00       	mov    $0x0,%eax
  103491:	eb 77                	jmp    10350a <skipelem+0xa2>
  s = path;
  103493:	8b 45 08             	mov    0x8(%ebp),%eax
  103496:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(*path != '/' && *path != 0)
  103499:	eb 04                	jmp    10349f <skipelem+0x37>
    path++;
  10349b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path != '/' && *path != 0)
  10349f:	8b 45 08             	mov    0x8(%ebp),%eax
  1034a2:	0f b6 00             	movzbl (%eax),%eax
  1034a5:	3c 2f                	cmp    $0x2f,%al
  1034a7:	74 0a                	je     1034b3 <skipelem+0x4b>
  1034a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ac:	0f b6 00             	movzbl (%eax),%eax
  1034af:	84 c0                	test   %al,%al
  1034b1:	75 e8                	jne    10349b <skipelem+0x33>
  len = path - s;
  1034b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b6:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1034b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(len >= DIRSIZ)
  1034bc:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1034c0:	7e 15                	jle    1034d7 <skipelem+0x6f>
    memmove(name, s, DIRSIZ);
  1034c2:	83 ec 04             	sub    $0x4,%esp
  1034c5:	6a 0e                	push   $0xe
  1034c7:	ff 75 f4             	pushl  -0xc(%ebp)
  1034ca:	ff 75 0c             	pushl  0xc(%ebp)
  1034cd:	e8 05 db ff ff       	call   100fd7 <memmove>
  1034d2:	83 c4 10             	add    $0x10,%esp
  1034d5:	eb 26                	jmp    1034fd <skipelem+0x95>
  else {
    memmove(name, s, len);
  1034d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034da:	83 ec 04             	sub    $0x4,%esp
  1034dd:	50                   	push   %eax
  1034de:	ff 75 f4             	pushl  -0xc(%ebp)
  1034e1:	ff 75 0c             	pushl  0xc(%ebp)
  1034e4:	e8 ee da ff ff       	call   100fd7 <memmove>
  1034e9:	83 c4 10             	add    $0x10,%esp
    name[len] = 0;
  1034ec:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1034ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034f2:	01 d0                	add    %edx,%eax
  1034f4:	c6 00 00             	movb   $0x0,(%eax)
  }
  while(*path == '/')
  1034f7:	eb 04                	jmp    1034fd <skipelem+0x95>
    path++;
  1034f9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path == '/')
  1034fd:	8b 45 08             	mov    0x8(%ebp),%eax
  103500:	0f b6 00             	movzbl (%eax),%eax
  103503:	3c 2f                	cmp    $0x2f,%al
  103505:	74 f2                	je     1034f9 <skipelem+0x91>
  return path;
  103507:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10350a:	c9                   	leave  
  10350b:	c3                   	ret    

0010350c <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
  10350c:	f3 0f 1e fb          	endbr32 
  103510:	55                   	push   %ebp
  103511:	89 e5                	mov    %esp,%ebp
  103513:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip, *next;

  ip = iget(ROOTDEV, ROOTINO);
  103516:	83 ec 08             	sub    $0x8,%esp
  103519:	6a 01                	push   $0x1
  10351b:	6a 01                	push   $0x1
  10351d:	e8 28 f7 ff ff       	call   102c4a <iget>
  103522:	83 c4 10             	add    $0x10,%esp
  103525:	89 45 f4             	mov    %eax,-0xc(%ebp)

  while((path = skipelem(path, name)) != 0){
  103528:	e9 90 00 00 00       	jmp    1035bd <namex+0xb1>
    iread(ip);
  10352d:	83 ec 0c             	sub    $0xc,%esp
  103530:	ff 75 f4             	pushl  -0xc(%ebp)
  103533:	e8 c5 f7 ff ff       	call   102cfd <iread>
  103538:	83 c4 10             	add    $0x10,%esp
    if(ip->type != T_DIR){
  10353b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10353e:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103542:	66 83 f8 01          	cmp    $0x1,%ax
  103546:	74 18                	je     103560 <namex+0x54>
      iput(ip);
  103548:	83 ec 0c             	sub    $0xc,%esp
  10354b:	ff 75 f4             	pushl  -0xc(%ebp)
  10354e:	e8 c2 f5 ff ff       	call   102b15 <iput>
  103553:	83 c4 10             	add    $0x10,%esp
      return 0;
  103556:	b8 00 00 00 00       	mov    $0x0,%eax
  10355b:	e9 99 00 00 00       	jmp    1035f9 <namex+0xed>
    }
    if(nameiparent && *path == '\0'){
  103560:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103564:	74 12                	je     103578 <namex+0x6c>
  103566:	8b 45 08             	mov    0x8(%ebp),%eax
  103569:	0f b6 00             	movzbl (%eax),%eax
  10356c:	84 c0                	test   %al,%al
  10356e:	75 08                	jne    103578 <namex+0x6c>
      // Stop one level early.
      return ip;
  103570:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103573:	e9 81 00 00 00       	jmp    1035f9 <namex+0xed>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
  103578:	83 ec 04             	sub    $0x4,%esp
  10357b:	6a 00                	push   $0x0
  10357d:	ff 75 10             	pushl  0x10(%ebp)
  103580:	ff 75 f4             	pushl  -0xc(%ebp)
  103583:	e8 46 fd ff ff       	call   1032ce <dirlookup>
  103588:	83 c4 10             	add    $0x10,%esp
  10358b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10358e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103592:	75 15                	jne    1035a9 <namex+0x9d>
      iput(ip);
  103594:	83 ec 0c             	sub    $0xc,%esp
  103597:	ff 75 f4             	pushl  -0xc(%ebp)
  10359a:	e8 76 f5 ff ff       	call   102b15 <iput>
  10359f:	83 c4 10             	add    $0x10,%esp
      return 0;
  1035a2:	b8 00 00 00 00       	mov    $0x0,%eax
  1035a7:	eb 50                	jmp    1035f9 <namex+0xed>
    }
    iput(ip);
  1035a9:	83 ec 0c             	sub    $0xc,%esp
  1035ac:	ff 75 f4             	pushl  -0xc(%ebp)
  1035af:	e8 61 f5 ff ff       	call   102b15 <iput>
  1035b4:	83 c4 10             	add    $0x10,%esp
    ip = next;
  1035b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1035ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while((path = skipelem(path, name)) != 0){
  1035bd:	83 ec 08             	sub    $0x8,%esp
  1035c0:	ff 75 10             	pushl  0x10(%ebp)
  1035c3:	ff 75 08             	pushl  0x8(%ebp)
  1035c6:	e8 9d fe ff ff       	call   103468 <skipelem>
  1035cb:	83 c4 10             	add    $0x10,%esp
  1035ce:	89 45 08             	mov    %eax,0x8(%ebp)
  1035d1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1035d5:	0f 85 52 ff ff ff    	jne    10352d <namex+0x21>
  }
  if(nameiparent){
  1035db:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1035df:	74 15                	je     1035f6 <namex+0xea>
    iput(ip);
  1035e1:	83 ec 0c             	sub    $0xc,%esp
  1035e4:	ff 75 f4             	pushl  -0xc(%ebp)
  1035e7:	e8 29 f5 ff ff       	call   102b15 <iput>
  1035ec:	83 c4 10             	add    $0x10,%esp
    return 0;
  1035ef:	b8 00 00 00 00       	mov    $0x0,%eax
  1035f4:	eb 03                	jmp    1035f9 <namex+0xed>
  }
  return ip;
  1035f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1035f9:	c9                   	leave  
  1035fa:	c3                   	ret    

001035fb <namei>:

struct inode*
namei(char *path)
{
  1035fb:	f3 0f 1e fb          	endbr32 
  1035ff:	55                   	push   %ebp
  103600:	89 e5                	mov    %esp,%ebp
  103602:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
  103605:	83 ec 04             	sub    $0x4,%esp
  103608:	8d 45 ea             	lea    -0x16(%ebp),%eax
  10360b:	50                   	push   %eax
  10360c:	6a 00                	push   $0x0
  10360e:	ff 75 08             	pushl  0x8(%ebp)
  103611:	e8 f6 fe ff ff       	call   10350c <namex>
  103616:	83 c4 10             	add    $0x10,%esp
}
  103619:	c9                   	leave  
  10361a:	c3                   	ret    

0010361b <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
  10361b:	f3 0f 1e fb          	endbr32 
  10361f:	55                   	push   %ebp
  103620:	89 e5                	mov    %esp,%ebp
  103622:	83 ec 08             	sub    $0x8,%esp
  return namex(path, 1, name);
  103625:	83 ec 04             	sub    $0x4,%esp
  103628:	ff 75 0c             	pushl  0xc(%ebp)
  10362b:	6a 01                	push   $0x1
  10362d:	ff 75 08             	pushl  0x8(%ebp)
  103630:	e8 d7 fe ff ff       	call   10350c <namex>
  103635:	83 c4 10             	add    $0x10,%esp
}
  103638:	c9                   	leave  
  103639:	c3                   	ret    

0010363a <filealloc>:
} ftable;

// Allocate a file structure.
struct file*
filealloc(void)
{
  10363a:	f3 0f 1e fb          	endbr32 
  10363e:	55                   	push   %ebp
  10363f:	89 e5                	mov    %esp,%ebp
  103641:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  for(f = ftable.file; f < ftable.file + NFILE; f++){
  103644:	c7 45 fc c0 fd 10 00 	movl   $0x10fdc0,-0x4(%ebp)
  10364b:	eb 1d                	jmp    10366a <filealloc+0x30>
    if(f->ref == 0){
  10364d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103650:	8b 40 04             	mov    0x4(%eax),%eax
  103653:	85 c0                	test   %eax,%eax
  103655:	75 0f                	jne    103666 <filealloc+0x2c>
      f->ref = 1;
  103657:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10365a:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
      return f;
  103661:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103664:	eb 13                	jmp    103679 <filealloc+0x3f>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
  103666:	83 45 fc 14          	addl   $0x14,-0x4(%ebp)
  10366a:	b8 90 05 11 00       	mov    $0x110590,%eax
  10366f:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  103672:	72 d9                	jb     10364d <filealloc+0x13>
    }
  }
  return 0;
  103674:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103679:	c9                   	leave  
  10367a:	c3                   	ret    

0010367b <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
  10367b:	f3 0f 1e fb          	endbr32 
  10367f:	55                   	push   %ebp
  103680:	89 e5                	mov    %esp,%ebp
  103682:	83 ec 08             	sub    $0x8,%esp
  if(f->ref < 1)
  103685:	8b 45 08             	mov    0x8(%ebp),%eax
  103688:	8b 40 04             	mov    0x4(%eax),%eax
  10368b:	85 c0                	test   %eax,%eax
  10368d:	7f 0d                	jg     10369c <filedup+0x21>
    panic("filedup");
  10368f:	83 ec 0c             	sub    $0xc,%esp
  103692:	68 97 46 10 00       	push   $0x104697
  103697:	e8 1d cc ff ff       	call   1002b9 <panic>
  f->ref++;
  10369c:	8b 45 08             	mov    0x8(%ebp),%eax
  10369f:	8b 40 04             	mov    0x4(%eax),%eax
  1036a2:	8d 50 01             	lea    0x1(%eax),%edx
  1036a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1036a8:	89 50 04             	mov    %edx,0x4(%eax)
  return f;
  1036ab:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1036ae:	c9                   	leave  
  1036af:	c3                   	ret    

001036b0 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
  1036b0:	f3 0f 1e fb          	endbr32 
  1036b4:	55                   	push   %ebp
  1036b5:	89 e5                	mov    %esp,%ebp
  1036b7:	83 ec 28             	sub    $0x28,%esp
  struct file ff;

  if(f->ref < 1)
  1036ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1036bd:	8b 40 04             	mov    0x4(%eax),%eax
  1036c0:	85 c0                	test   %eax,%eax
  1036c2:	7f 0d                	jg     1036d1 <fileclose+0x21>
    panic("fileclose");
  1036c4:	83 ec 0c             	sub    $0xc,%esp
  1036c7:	68 9f 46 10 00       	push   $0x10469f
  1036cc:	e8 e8 cb ff ff       	call   1002b9 <panic>
  if(--f->ref > 0){
  1036d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1036d4:	8b 40 04             	mov    0x4(%eax),%eax
  1036d7:	8d 50 ff             	lea    -0x1(%eax),%edx
  1036da:	8b 45 08             	mov    0x8(%ebp),%eax
  1036dd:	89 50 04             	mov    %edx,0x4(%eax)
  1036e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1036e3:	8b 40 04             	mov    0x4(%eax),%eax
  1036e6:	85 c0                	test   %eax,%eax
  1036e8:	7f 56                	jg     103740 <fileclose+0x90>
    return;
  }
  ff = *f;
  1036ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1036ed:	8b 10                	mov    (%eax),%edx
  1036ef:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1036f2:	8b 50 04             	mov    0x4(%eax),%edx
  1036f5:	89 55 e8             	mov    %edx,-0x18(%ebp)
  1036f8:	8b 50 08             	mov    0x8(%eax),%edx
  1036fb:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1036fe:	8b 50 0c             	mov    0xc(%eax),%edx
  103701:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103704:	8b 40 10             	mov    0x10(%eax),%eax
  103707:	89 45 f4             	mov    %eax,-0xc(%ebp)
  f->ref = 0;
  10370a:	8b 45 08             	mov    0x8(%ebp),%eax
  10370d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  f->type = FD_NONE;
  103714:	8b 45 08             	mov    0x8(%ebp),%eax
  103717:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(ff.type == FD_INODE){
  10371d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103720:	83 f8 01             	cmp    $0x1,%eax
  103723:	75 1c                	jne    103741 <fileclose+0x91>
    begin_op();
  103725:	e8 0d 0a 00 00       	call   104137 <begin_op>
    iput(ff.ip);
  10372a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10372d:	83 ec 0c             	sub    $0xc,%esp
  103730:	50                   	push   %eax
  103731:	e8 df f3 ff ff       	call   102b15 <iput>
  103736:	83 c4 10             	add    $0x10,%esp
    end_op();
  103739:	e8 03 0a 00 00       	call   104141 <end_op>
  10373e:	eb 01                	jmp    103741 <fileclose+0x91>
    return;
  103740:	90                   	nop
  }
}
  103741:	c9                   	leave  
  103742:	c3                   	ret    

00103743 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
  103743:	f3 0f 1e fb          	endbr32 
  103747:	55                   	push   %ebp
  103748:	89 e5                	mov    %esp,%ebp
  10374a:	83 ec 08             	sub    $0x8,%esp
  if(f->type == FD_INODE){
  10374d:	8b 45 08             	mov    0x8(%ebp),%eax
  103750:	8b 00                	mov    (%eax),%eax
  103752:	83 f8 01             	cmp    $0x1,%eax
  103755:	75 2e                	jne    103785 <filestat+0x42>
    iread(f->ip);
  103757:	8b 45 08             	mov    0x8(%ebp),%eax
  10375a:	8b 40 0c             	mov    0xc(%eax),%eax
  10375d:	83 ec 0c             	sub    $0xc,%esp
  103760:	50                   	push   %eax
  103761:	e8 97 f5 ff ff       	call   102cfd <iread>
  103766:	83 c4 10             	add    $0x10,%esp
    stati(f->ip, st);
  103769:	8b 45 08             	mov    0x8(%ebp),%eax
  10376c:	8b 40 0c             	mov    0xc(%eax),%eax
  10376f:	83 ec 08             	sub    $0x8,%esp
  103772:	ff 75 0c             	pushl  0xc(%ebp)
  103775:	50                   	push   %eax
  103776:	e8 cd f8 ff ff       	call   103048 <stati>
  10377b:	83 c4 10             	add    $0x10,%esp
    return 0;
  10377e:	b8 00 00 00 00       	mov    $0x0,%eax
  103783:	eb 05                	jmp    10378a <filestat+0x47>
  }
  return -1;
  103785:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  10378a:	c9                   	leave  
  10378b:	c3                   	ret    

0010378c <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
  10378c:	f3 0f 1e fb          	endbr32 
  103790:	55                   	push   %ebp
  103791:	89 e5                	mov    %esp,%ebp
  103793:	83 ec 18             	sub    $0x18,%esp
  int r;

  if(f->readable == 0)
  103796:	8b 45 08             	mov    0x8(%ebp),%eax
  103799:	0f b6 40 08          	movzbl 0x8(%eax),%eax
  10379d:	84 c0                	test   %al,%al
  10379f:	75 07                	jne    1037a8 <fileread+0x1c>
    return -1;
  1037a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1037a6:	eb 65                	jmp    10380d <fileread+0x81>
  if(f->type == FD_INODE){
  1037a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1037ab:	8b 00                	mov    (%eax),%eax
  1037ad:	83 f8 01             	cmp    $0x1,%eax
  1037b0:	75 4e                	jne    103800 <fileread+0x74>
    iread(f->ip);
  1037b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1037b5:	8b 40 0c             	mov    0xc(%eax),%eax
  1037b8:	83 ec 0c             	sub    $0xc,%esp
  1037bb:	50                   	push   %eax
  1037bc:	e8 3c f5 ff ff       	call   102cfd <iread>
  1037c1:	83 c4 10             	add    $0x10,%esp
    if((r = readi(f->ip, addr, f->off, n)) > 0)
  1037c4:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1037c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1037ca:	8b 50 10             	mov    0x10(%eax),%edx
  1037cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1037d0:	8b 40 0c             	mov    0xc(%eax),%eax
  1037d3:	51                   	push   %ecx
  1037d4:	52                   	push   %edx
  1037d5:	ff 75 0c             	pushl  0xc(%ebp)
  1037d8:	50                   	push   %eax
  1037d9:	e8 b4 f8 ff ff       	call   103092 <readi>
  1037de:	83 c4 10             	add    $0x10,%esp
  1037e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1037e4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1037e8:	7e 11                	jle    1037fb <fileread+0x6f>
      f->off += r;
  1037ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1037ed:	8b 50 10             	mov    0x10(%eax),%edx
  1037f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1037f3:	01 c2                	add    %eax,%edx
  1037f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1037f8:	89 50 10             	mov    %edx,0x10(%eax)
    return r;
  1037fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1037fe:	eb 0d                	jmp    10380d <fileread+0x81>
  }
  panic("fileread");
  103800:	83 ec 0c             	sub    $0xc,%esp
  103803:	68 a9 46 10 00       	push   $0x1046a9
  103808:	e8 ac ca ff ff       	call   1002b9 <panic>
}
  10380d:	c9                   	leave  
  10380e:	c3                   	ret    

0010380f <filewrite>:

// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
  10380f:	f3 0f 1e fb          	endbr32 
  103813:	55                   	push   %ebp
  103814:	89 e5                	mov    %esp,%ebp
  103816:	53                   	push   %ebx
  103817:	83 ec 14             	sub    $0x14,%esp
  int r;

  if(f->writable == 0)
  10381a:	8b 45 08             	mov    0x8(%ebp),%eax
  10381d:	0f b6 40 09          	movzbl 0x9(%eax),%eax
  103821:	84 c0                	test   %al,%al
  103823:	75 0a                	jne    10382f <filewrite+0x20>
    return -1;
  103825:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10382a:	e9 e2 00 00 00       	jmp    103911 <filewrite+0x102>
  if(f->type == FD_INODE){
  10382f:	8b 45 08             	mov    0x8(%ebp),%eax
  103832:	8b 00                	mov    (%eax),%eax
  103834:	83 f8 01             	cmp    $0x1,%eax
  103837:	0f 85 c7 00 00 00    	jne    103904 <filewrite+0xf5>
    // write a few blocks at a time
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
  10383d:	c7 45 ec 00 06 00 00 	movl   $0x600,-0x14(%ebp)
    int i = 0;
  103844:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while(i < n){
  10384b:	e9 91 00 00 00       	jmp    1038e1 <filewrite+0xd2>
      int n1 = n - i;
  103850:	8b 45 10             	mov    0x10(%ebp),%eax
  103853:	2b 45 f4             	sub    -0xc(%ebp),%eax
  103856:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if(n1 > max)
  103859:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10385c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10385f:	7e 06                	jle    103867 <filewrite+0x58>
        n1 = max;
  103861:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103864:	89 45 f0             	mov    %eax,-0x10(%ebp)

			begin_op();
  103867:	e8 cb 08 00 00       	call   104137 <begin_op>
      iread(f->ip);
  10386c:	8b 45 08             	mov    0x8(%ebp),%eax
  10386f:	8b 40 0c             	mov    0xc(%eax),%eax
  103872:	83 ec 0c             	sub    $0xc,%esp
  103875:	50                   	push   %eax
  103876:	e8 82 f4 ff ff       	call   102cfd <iread>
  10387b:	83 c4 10             	add    $0x10,%esp
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
  10387e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  103881:	8b 45 08             	mov    0x8(%ebp),%eax
  103884:	8b 50 10             	mov    0x10(%eax),%edx
  103887:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10388a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10388d:	01 c3                	add    %eax,%ebx
  10388f:	8b 45 08             	mov    0x8(%ebp),%eax
  103892:	8b 40 0c             	mov    0xc(%eax),%eax
  103895:	51                   	push   %ecx
  103896:	52                   	push   %edx
  103897:	53                   	push   %ebx
  103898:	50                   	push   %eax
  103899:	e8 f0 f8 ff ff       	call   10318e <writei>
  10389e:	83 c4 10             	add    $0x10,%esp
  1038a1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1038a4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1038a8:	7e 11                	jle    1038bb <filewrite+0xac>
        f->off += r;
  1038aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1038ad:	8b 50 10             	mov    0x10(%eax),%edx
  1038b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1038b3:	01 c2                	add    %eax,%edx
  1038b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1038b8:	89 50 10             	mov    %edx,0x10(%eax)
      end_op();
  1038bb:	e8 81 08 00 00       	call   104141 <end_op>

      if(r < 0)
  1038c0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1038c4:	78 29                	js     1038ef <filewrite+0xe0>
        break;
      if(r != n1)
  1038c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1038c9:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  1038cc:	74 0d                	je     1038db <filewrite+0xcc>
        panic("short filewrite");
  1038ce:	83 ec 0c             	sub    $0xc,%esp
  1038d1:	68 b2 46 10 00       	push   $0x1046b2
  1038d6:	e8 de c9 ff ff       	call   1002b9 <panic>
      i += r;
  1038db:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1038de:	01 45 f4             	add    %eax,-0xc(%ebp)
    while(i < n){
  1038e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1038e4:	3b 45 10             	cmp    0x10(%ebp),%eax
  1038e7:	0f 8c 63 ff ff ff    	jl     103850 <filewrite+0x41>
  1038ed:	eb 01                	jmp    1038f0 <filewrite+0xe1>
        break;
  1038ef:	90                   	nop
    }
    return i == n ? n : -1;
  1038f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1038f3:	3b 45 10             	cmp    0x10(%ebp),%eax
  1038f6:	75 05                	jne    1038fd <filewrite+0xee>
  1038f8:	8b 45 10             	mov    0x10(%ebp),%eax
  1038fb:	eb 14                	jmp    103911 <filewrite+0x102>
  1038fd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103902:	eb 0d                	jmp    103911 <filewrite+0x102>
  }
  panic("filewrite");
  103904:	83 ec 0c             	sub    $0xc,%esp
  103907:	68 c2 46 10 00       	push   $0x1046c2
  10390c:	e8 a8 c9 ff ff       	call   1002b9 <panic>
}
  103911:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103914:	c9                   	leave  
  103915:	c3                   	ret    

00103916 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
int
isdirempty(struct inode *dp)
{
  103916:	f3 0f 1e fb          	endbr32 
  10391a:	55                   	push   %ebp
  10391b:	89 e5                	mov    %esp,%ebp
  10391d:	83 ec 28             	sub    $0x28,%esp
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
  103920:	c7 45 f4 20 00 00 00 	movl   $0x20,-0xc(%ebp)
  103927:	eb 40                	jmp    103969 <isdirempty+0x53>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  103929:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10392c:	6a 10                	push   $0x10
  10392e:	50                   	push   %eax
  10392f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  103932:	50                   	push   %eax
  103933:	ff 75 08             	pushl  0x8(%ebp)
  103936:	e8 57 f7 ff ff       	call   103092 <readi>
  10393b:	83 c4 10             	add    $0x10,%esp
  10393e:	83 f8 10             	cmp    $0x10,%eax
  103941:	74 0d                	je     103950 <isdirempty+0x3a>
      panic("isdirempty: readi");
  103943:	83 ec 0c             	sub    $0xc,%esp
  103946:	68 cc 46 10 00       	push   $0x1046cc
  10394b:	e8 69 c9 ff ff       	call   1002b9 <panic>
    if(de.inum != 0)
  103950:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  103954:	66 85 c0             	test   %ax,%ax
  103957:	74 07                	je     103960 <isdirempty+0x4a>
      return 0;
  103959:	b8 00 00 00 00       	mov    $0x0,%eax
  10395e:	eb 1b                	jmp    10397b <isdirempty+0x65>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
  103960:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103963:	83 c0 10             	add    $0x10,%eax
  103966:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103969:	8b 45 08             	mov    0x8(%ebp),%eax
  10396c:	8b 50 18             	mov    0x18(%eax),%edx
  10396f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103972:	39 c2                	cmp    %eax,%edx
  103974:	77 b3                	ja     103929 <isdirempty+0x13>
  }
  return 1;
  103976:	b8 01 00 00 00       	mov    $0x1,%eax
}
  10397b:	c9                   	leave  
  10397c:	c3                   	ret    

0010397d <unlink>:

int
unlink(char* path, char* name)
{
  10397d:	f3 0f 1e fb          	endbr32 
  103981:	55                   	push   %ebp
  103982:	89 e5                	mov    %esp,%ebp
  103984:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip, *dp;
  struct dirent de;
  uint off;

	begin_op();
  103987:	e8 ab 07 00 00       	call   104137 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
  10398c:	83 ec 08             	sub    $0x8,%esp
  10398f:	ff 75 0c             	pushl  0xc(%ebp)
  103992:	ff 75 08             	pushl  0x8(%ebp)
  103995:	e8 81 fc ff ff       	call   10361b <nameiparent>
  10399a:	83 c4 10             	add    $0x10,%esp
  10399d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1039a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1039a4:	75 0f                	jne    1039b5 <unlink+0x38>
    end_op();
  1039a6:	e8 96 07 00 00       	call   104141 <end_op>
    return -1;
  1039ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1039b0:	e9 8c 01 00 00       	jmp    103b41 <unlink+0x1c4>
  }

  iread(dp);
  1039b5:	83 ec 0c             	sub    $0xc,%esp
  1039b8:	ff 75 f4             	pushl  -0xc(%ebp)
  1039bb:	e8 3d f3 ff ff       	call   102cfd <iread>
  1039c0:	83 c4 10             	add    $0x10,%esp

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
  1039c3:	83 ec 08             	sub    $0x8,%esp
  1039c6:	68 de 46 10 00       	push   $0x1046de
  1039cb:	ff 75 0c             	pushl  0xc(%ebp)
  1039ce:	e8 dc f8 ff ff       	call   1032af <namecmp>
  1039d3:	83 c4 10             	add    $0x10,%esp
  1039d6:	85 c0                	test   %eax,%eax
  1039d8:	0f 84 47 01 00 00    	je     103b25 <unlink+0x1a8>
  1039de:	83 ec 08             	sub    $0x8,%esp
  1039e1:	68 e0 46 10 00       	push   $0x1046e0
  1039e6:	ff 75 0c             	pushl  0xc(%ebp)
  1039e9:	e8 c1 f8 ff ff       	call   1032af <namecmp>
  1039ee:	83 c4 10             	add    $0x10,%esp
  1039f1:	85 c0                	test   %eax,%eax
  1039f3:	0f 84 2c 01 00 00    	je     103b25 <unlink+0x1a8>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
  1039f9:	83 ec 04             	sub    $0x4,%esp
  1039fc:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1039ff:	50                   	push   %eax
  103a00:	ff 75 0c             	pushl  0xc(%ebp)
  103a03:	ff 75 f4             	pushl  -0xc(%ebp)
  103a06:	e8 c3 f8 ff ff       	call   1032ce <dirlookup>
  103a0b:	83 c4 10             	add    $0x10,%esp
  103a0e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103a11:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103a15:	0f 84 0d 01 00 00    	je     103b28 <unlink+0x1ab>
    goto bad;
  iread(ip);
  103a1b:	83 ec 0c             	sub    $0xc,%esp
  103a1e:	ff 75 f0             	pushl  -0x10(%ebp)
  103a21:	e8 d7 f2 ff ff       	call   102cfd <iread>
  103a26:	83 c4 10             	add    $0x10,%esp

  if(ip->nlink < 1)
  103a29:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103a2c:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  103a30:	66 85 c0             	test   %ax,%ax
  103a33:	7f 0d                	jg     103a42 <unlink+0xc5>
    panic("unlink: nlink < 1");
  103a35:	83 ec 0c             	sub    $0xc,%esp
  103a38:	68 e3 46 10 00       	push   $0x1046e3
  103a3d:	e8 77 c8 ff ff       	call   1002b9 <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
  103a42:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103a45:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103a49:	66 83 f8 01          	cmp    $0x1,%ax
  103a4d:	75 25                	jne    103a74 <unlink+0xf7>
  103a4f:	83 ec 0c             	sub    $0xc,%esp
  103a52:	ff 75 f0             	pushl  -0x10(%ebp)
  103a55:	e8 bc fe ff ff       	call   103916 <isdirempty>
  103a5a:	83 c4 10             	add    $0x10,%esp
  103a5d:	85 c0                	test   %eax,%eax
  103a5f:	75 13                	jne    103a74 <unlink+0xf7>
    iput(ip);
  103a61:	83 ec 0c             	sub    $0xc,%esp
  103a64:	ff 75 f0             	pushl  -0x10(%ebp)
  103a67:	e8 a9 f0 ff ff       	call   102b15 <iput>
  103a6c:	83 c4 10             	add    $0x10,%esp
    goto bad;
  103a6f:	e9 b5 00 00 00       	jmp    103b29 <unlink+0x1ac>
  }

  memset(&de, 0, sizeof(de));
  103a74:	83 ec 04             	sub    $0x4,%esp
  103a77:	6a 10                	push   $0x10
  103a79:	6a 00                	push   $0x0
  103a7b:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103a7e:	50                   	push   %eax
  103a7f:	e8 8c d4 ff ff       	call   100f10 <memset>
  103a84:	83 c4 10             	add    $0x10,%esp
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  103a87:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103a8a:	6a 10                	push   $0x10
  103a8c:	50                   	push   %eax
  103a8d:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103a90:	50                   	push   %eax
  103a91:	ff 75 f4             	pushl  -0xc(%ebp)
  103a94:	e8 f5 f6 ff ff       	call   10318e <writei>
  103a99:	83 c4 10             	add    $0x10,%esp
  103a9c:	83 f8 10             	cmp    $0x10,%eax
  103a9f:	74 0d                	je     103aae <unlink+0x131>
    panic("unlink: writei");
  103aa1:	83 ec 0c             	sub    $0xc,%esp
  103aa4:	68 f5 46 10 00       	push   $0x1046f5
  103aa9:	e8 0b c8 ff ff       	call   1002b9 <panic>
  if(ip->type == T_DIR){
  103aae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ab1:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103ab5:	66 83 f8 01          	cmp    $0x1,%ax
  103ab9:	75 21                	jne    103adc <unlink+0x15f>
    dp->nlink--;
  103abb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103abe:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  103ac2:	83 e8 01             	sub    $0x1,%eax
  103ac5:	89 c2                	mov    %eax,%edx
  103ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103aca:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
  103ace:	83 ec 0c             	sub    $0xc,%esp
  103ad1:	ff 75 f4             	pushl  -0xc(%ebp)
  103ad4:	e8 ac f0 ff ff       	call   102b85 <iupdate>
  103ad9:	83 c4 10             	add    $0x10,%esp
  }
  iput(dp);
  103adc:	83 ec 0c             	sub    $0xc,%esp
  103adf:	ff 75 f4             	pushl  -0xc(%ebp)
  103ae2:	e8 2e f0 ff ff       	call   102b15 <iput>
  103ae7:	83 c4 10             	add    $0x10,%esp

  ip->nlink--;
  103aea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103aed:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  103af1:	83 e8 01             	sub    $0x1,%eax
  103af4:	89 c2                	mov    %eax,%edx
  103af6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103af9:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
  103afd:	83 ec 0c             	sub    $0xc,%esp
  103b00:	ff 75 f0             	pushl  -0x10(%ebp)
  103b03:	e8 7d f0 ff ff       	call   102b85 <iupdate>
  103b08:	83 c4 10             	add    $0x10,%esp
  iput(ip);
  103b0b:	83 ec 0c             	sub    $0xc,%esp
  103b0e:	ff 75 f0             	pushl  -0x10(%ebp)
  103b11:	e8 ff ef ff ff       	call   102b15 <iput>
  103b16:	83 c4 10             	add    $0x10,%esp

  end_op();
  103b19:	e8 23 06 00 00       	call   104141 <end_op>
  return 0;
  103b1e:	b8 00 00 00 00       	mov    $0x0,%eax
  103b23:	eb 1c                	jmp    103b41 <unlink+0x1c4>
    goto bad;
  103b25:	90                   	nop
  103b26:	eb 01                	jmp    103b29 <unlink+0x1ac>
    goto bad;
  103b28:	90                   	nop

bad:
  iput(dp);
  103b29:	83 ec 0c             	sub    $0xc,%esp
  103b2c:	ff 75 f4             	pushl  -0xc(%ebp)
  103b2f:	e8 e1 ef ff ff       	call   102b15 <iput>
  103b34:	83 c4 10             	add    $0x10,%esp
  end_op();
  103b37:	e8 05 06 00 00       	call   104141 <end_op>
  return -1;
  103b3c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  103b41:	c9                   	leave  
  103b42:	c3                   	ret    

00103b43 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
  103b43:	f3 0f 1e fb          	endbr32 
  103b47:	55                   	push   %ebp
  103b48:	89 e5                	mov    %esp,%ebp
  103b4a:	83 ec 38             	sub    $0x38,%esp
  103b4d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  103b50:	8b 55 10             	mov    0x10(%ebp),%edx
  103b53:	8b 45 14             	mov    0x14(%ebp),%eax
  103b56:	66 89 4d d4          	mov    %cx,-0x2c(%ebp)
  103b5a:	66 89 55 d0          	mov    %dx,-0x30(%ebp)
  103b5e:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
  103b62:	83 ec 08             	sub    $0x8,%esp
  103b65:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  103b68:	50                   	push   %eax
  103b69:	ff 75 08             	pushl  0x8(%ebp)
  103b6c:	e8 aa fa ff ff       	call   10361b <nameiparent>
  103b71:	83 c4 10             	add    $0x10,%esp
  103b74:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103b77:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103b7b:	75 0a                	jne    103b87 <create+0x44>
    return 0;
  103b7d:	b8 00 00 00 00       	mov    $0x0,%eax
  103b82:	e9 8e 01 00 00       	jmp    103d15 <create+0x1d2>
  iread(dp);
  103b87:	83 ec 0c             	sub    $0xc,%esp
  103b8a:	ff 75 f4             	pushl  -0xc(%ebp)
  103b8d:	e8 6b f1 ff ff       	call   102cfd <iread>
  103b92:	83 c4 10             	add    $0x10,%esp

  if((ip = dirlookup(dp, name, 0)) != 0){
  103b95:	83 ec 04             	sub    $0x4,%esp
  103b98:	6a 00                	push   $0x0
  103b9a:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  103b9d:	50                   	push   %eax
  103b9e:	ff 75 f4             	pushl  -0xc(%ebp)
  103ba1:	e8 28 f7 ff ff       	call   1032ce <dirlookup>
  103ba6:	83 c4 10             	add    $0x10,%esp
  103ba9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103bac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103bb0:	74 50                	je     103c02 <create+0xbf>
    iput(dp);
  103bb2:	83 ec 0c             	sub    $0xc,%esp
  103bb5:	ff 75 f4             	pushl  -0xc(%ebp)
  103bb8:	e8 58 ef ff ff       	call   102b15 <iput>
  103bbd:	83 c4 10             	add    $0x10,%esp
    iread(ip);
  103bc0:	83 ec 0c             	sub    $0xc,%esp
  103bc3:	ff 75 f0             	pushl  -0x10(%ebp)
  103bc6:	e8 32 f1 ff ff       	call   102cfd <iread>
  103bcb:	83 c4 10             	add    $0x10,%esp
    if(type == T_FILE && ip->type == T_FILE)
  103bce:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
  103bd3:	75 15                	jne    103bea <create+0xa7>
  103bd5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103bd8:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103bdc:	66 83 f8 02          	cmp    $0x2,%ax
  103be0:	75 08                	jne    103bea <create+0xa7>
      return ip;
  103be2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103be5:	e9 2b 01 00 00       	jmp    103d15 <create+0x1d2>
    iput(ip);
  103bea:	83 ec 0c             	sub    $0xc,%esp
  103bed:	ff 75 f0             	pushl  -0x10(%ebp)
  103bf0:	e8 20 ef ff ff       	call   102b15 <iput>
  103bf5:	83 c4 10             	add    $0x10,%esp
    return 0;
  103bf8:	b8 00 00 00 00       	mov    $0x0,%eax
  103bfd:	e9 13 01 00 00       	jmp    103d15 <create+0x1d2>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
  103c02:	0f bf 55 d4          	movswl -0x2c(%ebp),%edx
  103c06:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103c09:	8b 00                	mov    (%eax),%eax
  103c0b:	83 ec 08             	sub    $0x8,%esp
  103c0e:	52                   	push   %edx
  103c0f:	50                   	push   %eax
  103c10:	e8 25 ee ff ff       	call   102a3a <ialloc>
  103c15:	83 c4 10             	add    $0x10,%esp
  103c18:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103c1b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103c1f:	75 0d                	jne    103c2e <create+0xeb>
    panic("create: ialloc");
  103c21:	83 ec 0c             	sub    $0xc,%esp
  103c24:	68 04 47 10 00       	push   $0x104704
  103c29:	e8 8b c6 ff ff       	call   1002b9 <panic>

  iread(ip);
  103c2e:	83 ec 0c             	sub    $0xc,%esp
  103c31:	ff 75 f0             	pushl  -0x10(%ebp)
  103c34:	e8 c4 f0 ff ff       	call   102cfd <iread>
  103c39:	83 c4 10             	add    $0x10,%esp
  ip->major = major;
  103c3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c3f:	0f b7 55 d0          	movzwl -0x30(%ebp),%edx
  103c43:	66 89 50 12          	mov    %dx,0x12(%eax)
  ip->minor = minor;
  103c47:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c4a:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
  103c4e:	66 89 50 14          	mov    %dx,0x14(%eax)
  ip->nlink = 1;
  103c52:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c55:	66 c7 40 16 01 00    	movw   $0x1,0x16(%eax)
  iupdate(ip);
  103c5b:	83 ec 0c             	sub    $0xc,%esp
  103c5e:	ff 75 f0             	pushl  -0x10(%ebp)
  103c61:	e8 1f ef ff ff       	call   102b85 <iupdate>
  103c66:	83 c4 10             	add    $0x10,%esp

  if(type == T_DIR){  // Create . and .. entries.
  103c69:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
  103c6e:	75 6a                	jne    103cda <create+0x197>
    dp->nlink++;  // for ".."
  103c70:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103c73:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  103c77:	83 c0 01             	add    $0x1,%eax
  103c7a:	89 c2                	mov    %eax,%edx
  103c7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103c7f:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
  103c83:	83 ec 0c             	sub    $0xc,%esp
  103c86:	ff 75 f4             	pushl  -0xc(%ebp)
  103c89:	e8 f7 ee ff ff       	call   102b85 <iupdate>
  103c8e:	83 c4 10             	add    $0x10,%esp
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
  103c91:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c94:	8b 40 04             	mov    0x4(%eax),%eax
  103c97:	83 ec 04             	sub    $0x4,%esp
  103c9a:	50                   	push   %eax
  103c9b:	68 de 46 10 00       	push   $0x1046de
  103ca0:	ff 75 f0             	pushl  -0x10(%ebp)
  103ca3:	e8 e4 f6 ff ff       	call   10338c <dirlink>
  103ca8:	83 c4 10             	add    $0x10,%esp
  103cab:	85 c0                	test   %eax,%eax
  103cad:	78 1e                	js     103ccd <create+0x18a>
  103caf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103cb2:	8b 40 04             	mov    0x4(%eax),%eax
  103cb5:	83 ec 04             	sub    $0x4,%esp
  103cb8:	50                   	push   %eax
  103cb9:	68 e0 46 10 00       	push   $0x1046e0
  103cbe:	ff 75 f0             	pushl  -0x10(%ebp)
  103cc1:	e8 c6 f6 ff ff       	call   10338c <dirlink>
  103cc6:	83 c4 10             	add    $0x10,%esp
  103cc9:	85 c0                	test   %eax,%eax
  103ccb:	79 0d                	jns    103cda <create+0x197>
      panic("create dots");
  103ccd:	83 ec 0c             	sub    $0xc,%esp
  103cd0:	68 13 47 10 00       	push   $0x104713
  103cd5:	e8 df c5 ff ff       	call   1002b9 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
  103cda:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103cdd:	8b 40 04             	mov    0x4(%eax),%eax
  103ce0:	83 ec 04             	sub    $0x4,%esp
  103ce3:	50                   	push   %eax
  103ce4:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  103ce7:	50                   	push   %eax
  103ce8:	ff 75 f4             	pushl  -0xc(%ebp)
  103ceb:	e8 9c f6 ff ff       	call   10338c <dirlink>
  103cf0:	83 c4 10             	add    $0x10,%esp
  103cf3:	85 c0                	test   %eax,%eax
  103cf5:	79 0d                	jns    103d04 <create+0x1c1>
    panic("create: dirlink");
  103cf7:	83 ec 0c             	sub    $0xc,%esp
  103cfa:	68 1f 47 10 00       	push   $0x10471f
  103cff:	e8 b5 c5 ff ff       	call   1002b9 <panic>

  iput(dp);
  103d04:	83 ec 0c             	sub    $0xc,%esp
  103d07:	ff 75 f4             	pushl  -0xc(%ebp)
  103d0a:	e8 06 ee ff ff       	call   102b15 <iput>
  103d0f:	83 c4 10             	add    $0x10,%esp

  return ip;
  103d12:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  103d15:	c9                   	leave  
  103d16:	c3                   	ret    

00103d17 <open>:


struct file*
open(char* path, int omode)
{
  103d17:	f3 0f 1e fb          	endbr32 
  103d1b:	55                   	push   %ebp
  103d1c:	89 e5                	mov    %esp,%ebp
  103d1e:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;

  begin_op();
  103d21:	e8 11 04 00 00       	call   104137 <begin_op>

  if(omode & O_CREATE){
  103d26:	8b 45 0c             	mov    0xc(%ebp),%eax
  103d29:	25 00 02 00 00       	and    $0x200,%eax
  103d2e:	85 c0                	test   %eax,%eax
  103d30:	74 29                	je     103d5b <open+0x44>
    ip = create(path, T_FILE, 0, 0);
  103d32:	6a 00                	push   $0x0
  103d34:	6a 00                	push   $0x0
  103d36:	6a 02                	push   $0x2
  103d38:	ff 75 08             	pushl  0x8(%ebp)
  103d3b:	e8 03 fe ff ff       	call   103b43 <create>
  103d40:	83 c4 10             	add    $0x10,%esp
  103d43:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ip == 0){
  103d46:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103d4a:	75 73                	jne    103dbf <open+0xa8>
      end_op();
  103d4c:	e8 f0 03 00 00       	call   104141 <end_op>
      return 0;
  103d51:	b8 00 00 00 00       	mov    $0x0,%eax
  103d56:	e9 eb 00 00 00       	jmp    103e46 <open+0x12f>
    }
  } else {
    if((ip = namei(path)) == 0){
  103d5b:	83 ec 0c             	sub    $0xc,%esp
  103d5e:	ff 75 08             	pushl  0x8(%ebp)
  103d61:	e8 95 f8 ff ff       	call   1035fb <namei>
  103d66:	83 c4 10             	add    $0x10,%esp
  103d69:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103d6c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103d70:	75 0f                	jne    103d81 <open+0x6a>
      end_op();
  103d72:	e8 ca 03 00 00       	call   104141 <end_op>
      return 0;
  103d77:	b8 00 00 00 00       	mov    $0x0,%eax
  103d7c:	e9 c5 00 00 00       	jmp    103e46 <open+0x12f>
    }
    iread(ip);
  103d81:	83 ec 0c             	sub    $0xc,%esp
  103d84:	ff 75 f4             	pushl  -0xc(%ebp)
  103d87:	e8 71 ef ff ff       	call   102cfd <iread>
  103d8c:	83 c4 10             	add    $0x10,%esp
    if(ip->type == T_DIR && omode != O_RDONLY){
  103d8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103d92:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103d96:	66 83 f8 01          	cmp    $0x1,%ax
  103d9a:	75 23                	jne    103dbf <open+0xa8>
  103d9c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103da0:	74 1d                	je     103dbf <open+0xa8>
      iput(ip);
  103da2:	83 ec 0c             	sub    $0xc,%esp
  103da5:	ff 75 f4             	pushl  -0xc(%ebp)
  103da8:	e8 68 ed ff ff       	call   102b15 <iput>
  103dad:	83 c4 10             	add    $0x10,%esp
      end_op();
  103db0:	e8 8c 03 00 00       	call   104141 <end_op>
      return 0;
  103db5:	b8 00 00 00 00       	mov    $0x0,%eax
  103dba:	e9 87 00 00 00       	jmp    103e46 <open+0x12f>
    }
  }

  struct file* f;
  if((f = filealloc()) == 0) { 
  103dbf:	e8 76 f8 ff ff       	call   10363a <filealloc>
  103dc4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103dc7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103dcb:	75 1a                	jne    103de7 <open+0xd0>
    iput(ip);
  103dcd:	83 ec 0c             	sub    $0xc,%esp
  103dd0:	ff 75 f4             	pushl  -0xc(%ebp)
  103dd3:	e8 3d ed ff ff       	call   102b15 <iput>
  103dd8:	83 c4 10             	add    $0x10,%esp
    end_op();
  103ddb:	e8 61 03 00 00       	call   104141 <end_op>
    return 0;
  103de0:	b8 00 00 00 00       	mov    $0x0,%eax
  103de5:	eb 5f                	jmp    103e46 <open+0x12f>
  }

  f->type = FD_INODE;
  103de7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103dea:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  f->ip = ip;
  103df0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103df3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103df6:	89 50 0c             	mov    %edx,0xc(%eax)
  f->off = 0;
  103df9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103dfc:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  f->readable = !(omode & O_WRONLY);
  103e03:	8b 45 0c             	mov    0xc(%ebp),%eax
  103e06:	83 e0 01             	and    $0x1,%eax
  103e09:	85 c0                	test   %eax,%eax
  103e0b:	0f 94 c0             	sete   %al
  103e0e:	89 c2                	mov    %eax,%edx
  103e10:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103e13:	88 50 08             	mov    %dl,0x8(%eax)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  103e16:	8b 45 0c             	mov    0xc(%ebp),%eax
  103e19:	83 e0 01             	and    $0x1,%eax
  103e1c:	85 c0                	test   %eax,%eax
  103e1e:	75 0a                	jne    103e2a <open+0x113>
  103e20:	8b 45 0c             	mov    0xc(%ebp),%eax
  103e23:	83 e0 02             	and    $0x2,%eax
  103e26:	85 c0                	test   %eax,%eax
  103e28:	74 07                	je     103e31 <open+0x11a>
  103e2a:	b8 01 00 00 00       	mov    $0x1,%eax
  103e2f:	eb 05                	jmp    103e36 <open+0x11f>
  103e31:	b8 00 00 00 00       	mov    $0x0,%eax
  103e36:	89 c2                	mov    %eax,%edx
  103e38:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103e3b:	88 50 09             	mov    %dl,0x9(%eax)
  end_op();
  103e3e:	e8 fe 02 00 00       	call   104141 <end_op>
  return f;
  103e43:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  103e46:	c9                   	leave  
  103e47:	c3                   	ret    

00103e48 <mkdir>:

int mkdir(char *path)
{
  103e48:	f3 0f 1e fb          	endbr32 
  103e4c:	55                   	push   %ebp
  103e4d:	89 e5                	mov    %esp,%ebp
  103e4f:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;

  begin_op();
  103e52:	e8 e0 02 00 00       	call   104137 <begin_op>
  if((ip = create(path, T_DIR, 0, 0)) == 0){
  103e57:	6a 00                	push   $0x0
  103e59:	6a 00                	push   $0x0
  103e5b:	6a 01                	push   $0x1
  103e5d:	ff 75 08             	pushl  0x8(%ebp)
  103e60:	e8 de fc ff ff       	call   103b43 <create>
  103e65:	83 c4 10             	add    $0x10,%esp
  103e68:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103e6b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103e6f:	75 0c                	jne    103e7d <mkdir+0x35>
    end_op();
  103e71:	e8 cb 02 00 00       	call   104141 <end_op>
    return -1;
  103e76:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103e7b:	eb 18                	jmp    103e95 <mkdir+0x4d>
  }
  iput(ip);
  103e7d:	83 ec 0c             	sub    $0xc,%esp
  103e80:	ff 75 f4             	pushl  -0xc(%ebp)
  103e83:	e8 8d ec ff ff       	call   102b15 <iput>
  103e88:	83 c4 10             	add    $0x10,%esp
  end_op();
  103e8b:	e8 b1 02 00 00       	call   104141 <end_op>
  return 0;
  103e90:	b8 00 00 00 00       	mov    $0x0,%eax
  103e95:	c9                   	leave  
  103e96:	c3                   	ret    

00103e97 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
  103e97:	f3 0f 1e fb          	endbr32 
  103e9b:	55                   	push   %ebp
  103e9c:	89 e5                	mov    %esp,%ebp
  103e9e:	83 ec 28             	sub    $0x28,%esp
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  readsb(dev, &sb);
  103ea1:	83 ec 08             	sub    $0x8,%esp
  103ea4:	8d 45 dc             	lea    -0x24(%ebp),%eax
  103ea7:	50                   	push   %eax
  103ea8:	ff 75 08             	pushl  0x8(%ebp)
  103eab:	e8 69 e8 ff ff       	call   102719 <readsb>
  103eb0:	83 c4 10             	add    $0x10,%esp
  log.start = sb.logstart;
  103eb3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103eb6:	a3 a0 05 11 00       	mov    %eax,0x1105a0
  log.size = sb.nlog;
  103ebb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103ebe:	a3 a4 05 11 00       	mov    %eax,0x1105a4
  log.dev = dev;
  103ec3:	8b 45 08             	mov    0x8(%ebp),%eax
  103ec6:	a3 ac 05 11 00       	mov    %eax,0x1105ac
  recover_from_log();
  103ecb:	e8 41 02 00 00       	call   104111 <recover_from_log>
}
  103ed0:	90                   	nop
  103ed1:	c9                   	leave  
  103ed2:	c3                   	ret    

00103ed3 <restore_from_log>:

// Copy committed blocks from log to their home location
static void
restore_from_log(void)
{
  103ed3:	f3 0f 1e fb          	endbr32 
  103ed7:	55                   	push   %ebp
  103ed8:	89 e5                	mov    %esp,%ebp
  103eda:	83 ec 18             	sub    $0x18,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
  103edd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103ee4:	e9 95 00 00 00       	jmp    103f7e <restore_from_log+0xab>
        // we are supposed to write from the buffer  get the new values from cache.
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
  103ee9:	8b 15 a0 05 11 00    	mov    0x1105a0,%edx
  103eef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103ef2:	01 d0                	add    %edx,%eax
  103ef4:	83 c0 01             	add    $0x1,%eax
  103ef7:	89 c2                	mov    %eax,%edx
  103ef9:	a1 ac 05 11 00       	mov    0x1105ac,%eax
  103efe:	83 ec 08             	sub    $0x8,%esp
  103f01:	52                   	push   %edx
  103f02:	50                   	push   %eax
  103f03:	e8 bf e2 ff ff       	call   1021c7 <bread>
  103f08:	83 c4 10             	add    $0x10,%esp
  103f0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
  103f0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103f11:	83 c0 04             	add    $0x4,%eax
  103f14:	8b 04 85 a4 05 11 00 	mov    0x1105a4(,%eax,4),%eax
  103f1b:	89 c2                	mov    %eax,%edx
  103f1d:	a1 ac 05 11 00       	mov    0x1105ac,%eax
  103f22:	83 ec 08             	sub    $0x8,%esp
  103f25:	52                   	push   %edx
  103f26:	50                   	push   %eax
  103f27:	e8 9b e2 ff ff       	call   1021c7 <bread>
  103f2c:	83 c4 10             	add    $0x10,%esp
  103f2f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
  103f32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103f35:	8d 50 1c             	lea    0x1c(%eax),%edx
  103f38:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103f3b:	83 c0 1c             	add    $0x1c,%eax
  103f3e:	83 ec 04             	sub    $0x4,%esp
  103f41:	68 00 02 00 00       	push   $0x200
  103f46:	52                   	push   %edx
  103f47:	50                   	push   %eax
  103f48:	e8 8a d0 ff ff       	call   100fd7 <memmove>
  103f4d:	83 c4 10             	add    $0x10,%esp
    bwrite(dbuf);  // write dst to disk
  103f50:	83 ec 0c             	sub    $0xc,%esp
  103f53:	ff 75 ec             	pushl  -0x14(%ebp)
  103f56:	e8 a9 e2 ff ff       	call   102204 <bwrite>
  103f5b:	83 c4 10             	add    $0x10,%esp
    brelse(lbuf);
  103f5e:	83 ec 0c             	sub    $0xc,%esp
  103f61:	ff 75 f0             	pushl  -0x10(%ebp)
  103f64:	e8 10 e3 ff ff       	call   102279 <brelse>
  103f69:	83 c4 10             	add    $0x10,%esp
    brelse(dbuf);
  103f6c:	83 ec 0c             	sub    $0xc,%esp
  103f6f:	ff 75 ec             	pushl  -0x14(%ebp)
  103f72:	e8 02 e3 ff ff       	call   102279 <brelse>
  103f77:	83 c4 10             	add    $0x10,%esp
  for (tail = 0; tail < log.lh.n; tail++) {
  103f7a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103f7e:	a1 b0 05 11 00       	mov    0x1105b0,%eax
  103f83:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103f86:	0f 8c 5d ff ff ff    	jl     103ee9 <restore_from_log+0x16>
  }
}
  103f8c:	90                   	nop
  103f8d:	90                   	nop
  103f8e:	c9                   	leave  
  103f8f:	c3                   	ret    

00103f90 <install_trans>:
static void
install_trans(void)
{
  103f90:	f3 0f 1e fb          	endbr32 
  103f94:	55                   	push   %ebp
  103f95:	89 e5                	mov    %esp,%ebp
  103f97:	83 ec 18             	sub    $0x18,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
  103f9a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103fa1:	eb 61                	jmp    104004 <install_trans+0x74>
      if (tail == log.lh.n/2) panic("[UNDOLOG] Panic in install_trans type 5");
    }
        // we are supposed to write from the buffer  get the new values from cache.
    //struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
                // This must be in the cache right now.
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
  103fa3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103fa6:	83 c0 04             	add    $0x4,%eax
  103fa9:	8b 04 85 a4 05 11 00 	mov    0x1105a4(,%eax,4),%eax
  103fb0:	89 c2                	mov    %eax,%edx
  103fb2:	a1 ac 05 11 00       	mov    0x1105ac,%eax
  103fb7:	83 ec 08             	sub    $0x8,%esp
  103fba:	52                   	push   %edx
  103fbb:	50                   	push   %eax
  103fbc:	e8 06 e2 ff ff       	call   1021c7 <bread>
  103fc1:	83 c4 10             	add    $0x10,%esp
  103fc4:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if((dbuf->flags & (B_DIRTY|B_VALID)) != (B_DIRTY|B_VALID)){
  103fc7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103fca:	8b 00                	mov    (%eax),%eax
  103fcc:	83 e0 06             	and    $0x6,%eax
  103fcf:	83 f8 06             	cmp    $0x6,%eax
  103fd2:	74 10                	je     103fe4 <install_trans+0x54>
		cprintf("Flag issue\n");
  103fd4:	83 ec 0c             	sub    $0xc,%esp
  103fd7:	68 2f 47 10 00       	push   $0x10472f
  103fdc:	e8 0f c1 ff ff       	call   1000f0 <cprintf>
  103fe1:	83 c4 10             	add    $0x10,%esp
                }
    //memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
  103fe4:	83 ec 0c             	sub    $0xc,%esp
  103fe7:	ff 75 f0             	pushl  -0x10(%ebp)
  103fea:	e8 15 e2 ff ff       	call   102204 <bwrite>
  103fef:	83 c4 10             	add    $0x10,%esp
    //brelse(lbuf);
    brelse(dbuf);
  103ff2:	83 ec 0c             	sub    $0xc,%esp
  103ff5:	ff 75 f0             	pushl  -0x10(%ebp)
  103ff8:	e8 7c e2 ff ff       	call   102279 <brelse>
  103ffd:	83 c4 10             	add    $0x10,%esp
  for (tail = 0; tail < log.lh.n; tail++) {
  104000:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  104004:	a1 b0 05 11 00       	mov    0x1105b0,%eax
  104009:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  10400c:	7c 95                	jl     103fa3 <install_trans+0x13>
  }
}
  10400e:	90                   	nop
  10400f:	90                   	nop
  104010:	c9                   	leave  
  104011:	c3                   	ret    

00104012 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  104012:	f3 0f 1e fb          	endbr32 
  104016:	55                   	push   %ebp
  104017:	89 e5                	mov    %esp,%ebp
  104019:	83 ec 18             	sub    $0x18,%esp
  struct buf *buf = bread(log.dev, log.start);
  10401c:	a1 a0 05 11 00       	mov    0x1105a0,%eax
  104021:	89 c2                	mov    %eax,%edx
  104023:	a1 ac 05 11 00       	mov    0x1105ac,%eax
  104028:	83 ec 08             	sub    $0x8,%esp
  10402b:	52                   	push   %edx
  10402c:	50                   	push   %eax
  10402d:	e8 95 e1 ff ff       	call   1021c7 <bread>
  104032:	83 c4 10             	add    $0x10,%esp
  104035:	89 45 f0             	mov    %eax,-0x10(%ebp)
  struct logheader *lh = (struct logheader *) (buf->data);
  104038:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10403b:	83 c0 1c             	add    $0x1c,%eax
  10403e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int i;
  log.lh.n = lh->n;
  104041:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104044:	8b 00                	mov    (%eax),%eax
  104046:	a3 b0 05 11 00       	mov    %eax,0x1105b0
  for (i = 0; i < log.lh.n; i++) {
  10404b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  104052:	eb 1b                	jmp    10406f <read_head+0x5d>
    log.lh.block[i] = lh->block[i];
  104054:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104057:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10405a:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  10405e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  104061:	83 c2 04             	add    $0x4,%edx
  104064:	89 04 95 a4 05 11 00 	mov    %eax,0x1105a4(,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
  10406b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10406f:	a1 b0 05 11 00       	mov    0x1105b0,%eax
  104074:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  104077:	7c db                	jl     104054 <read_head+0x42>
  }
  brelse(buf);
  104079:	83 ec 0c             	sub    $0xc,%esp
  10407c:	ff 75 f0             	pushl  -0x10(%ebp)
  10407f:	e8 f5 e1 ff ff       	call   102279 <brelse>
  104084:	83 c4 10             	add    $0x10,%esp
}
  104087:	90                   	nop
  104088:	c9                   	leave  
  104089:	c3                   	ret    

0010408a <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  10408a:	f3 0f 1e fb          	endbr32 
  10408e:	55                   	push   %ebp
  10408f:	89 e5                	mov    %esp,%ebp
  104091:	83 ec 18             	sub    $0x18,%esp
  struct buf *buf = bread(log.dev, log.start);
  104094:	a1 a0 05 11 00       	mov    0x1105a0,%eax
  104099:	89 c2                	mov    %eax,%edx
  10409b:	a1 ac 05 11 00       	mov    0x1105ac,%eax
  1040a0:	83 ec 08             	sub    $0x8,%esp
  1040a3:	52                   	push   %edx
  1040a4:	50                   	push   %eax
  1040a5:	e8 1d e1 ff ff       	call   1021c7 <bread>
  1040aa:	83 c4 10             	add    $0x10,%esp
  1040ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
  struct logheader *hb = (struct logheader *) (buf->data);
  1040b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1040b3:	83 c0 1c             	add    $0x1c,%eax
  1040b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int i;
  hb->n = log.lh.n;
  1040b9:	8b 15 b0 05 11 00    	mov    0x1105b0,%edx
  1040bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1040c2:	89 10                	mov    %edx,(%eax)
  for (i = 0; i < log.lh.n; i++) {
  1040c4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1040cb:	eb 1b                	jmp    1040e8 <write_head+0x5e>
    hb->block[i] = log.lh.block[i];
  1040cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1040d0:	83 c0 04             	add    $0x4,%eax
  1040d3:	8b 0c 85 a4 05 11 00 	mov    0x1105a4(,%eax,4),%ecx
  1040da:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1040dd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1040e0:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
  1040e4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1040e8:	a1 b0 05 11 00       	mov    0x1105b0,%eax
  1040ed:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1040f0:	7c db                	jl     1040cd <write_head+0x43>
  }
  bwrite(buf);
  1040f2:	83 ec 0c             	sub    $0xc,%esp
  1040f5:	ff 75 f0             	pushl  -0x10(%ebp)
  1040f8:	e8 07 e1 ff ff       	call   102204 <bwrite>
  1040fd:	83 c4 10             	add    $0x10,%esp
  brelse(buf);
  104100:	83 ec 0c             	sub    $0xc,%esp
  104103:	ff 75 f0             	pushl  -0x10(%ebp)
  104106:	e8 6e e1 ff ff       	call   102279 <brelse>
  10410b:	83 c4 10             	add    $0x10,%esp
}
  10410e:	90                   	nop
  10410f:	c9                   	leave  
  104110:	c3                   	ret    

00104111 <recover_from_log>:

static void
recover_from_log(void)
{
  104111:	f3 0f 1e fb          	endbr32 
  104115:	55                   	push   %ebp
  104116:	89 e5                	mov    %esp,%ebp
  104118:	83 ec 08             	sub    $0x8,%esp
  read_head();
  10411b:	e8 f2 fe ff ff       	call   104012 <read_head>
  restore_from_log(); // if committed, copy from log to disk
  104120:	e8 ae fd ff ff       	call   103ed3 <restore_from_log>
  log.lh.n = 0;
  104125:	c7 05 b0 05 11 00 00 	movl   $0x0,0x1105b0
  10412c:	00 00 00 
  write_head(); // clear the log
  10412f:	e8 56 ff ff ff       	call   10408a <write_head>
}
  104134:	90                   	nop
  104135:	c9                   	leave  
  104136:	c3                   	ret    

00104137 <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
  104137:	f3 0f 1e fb          	endbr32 
  10413b:	55                   	push   %ebp
  10413c:	89 e5                	mov    %esp,%ebp
  
}
  10413e:	90                   	nop
  10413f:	5d                   	pop    %ebp
  104140:	c3                   	ret    

00104141 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
  104141:	f3 0f 1e fb          	endbr32 
  104145:	55                   	push   %ebp
  104146:	89 e5                	mov    %esp,%ebp
  104148:	83 ec 08             	sub    $0x8,%esp
  // call commit w/o holding locks, since not allowed
  // to sleep with locks.
  commit();
  10414b:	e8 03 00 00 00       	call   104153 <commit>
}
  104150:	90                   	nop
  104151:	c9                   	leave  
  104152:	c3                   	ret    

00104153 <commit>:

/* DO NOT MODIFY THIS FUNCTION*/
static void
commit()
{
  104153:	f3 0f 1e fb          	endbr32 
  104157:	55                   	push   %ebp
  104158:	89 e5                	mov    %esp,%ebp
  10415a:	83 ec 08             	sub    $0x8,%esp
  if (log.lh.n > 0) {
  10415d:	a1 b0 05 11 00       	mov    0x1105b0,%eax
  104162:	85 c0                	test   %eax,%eax
  104164:	7e 19                	jle    10417f <commit+0x2c>
    if (PANIC_1) {
      panic("[UNDOLOG] Panic in commit type 1");
    }
    write_head();    // Write header to disk 
  104166:	e8 1f ff ff ff       	call   10408a <write_head>
    if (PANIC_2) {
      panic("[UNDOLOG] Panic in commit type 2");
    }
    install_trans(); // Now install writes to home locations    
  10416b:	e8 20 fe ff ff       	call   103f90 <install_trans>
    if (PANIC_3) {
      panic("[UNDOLOG] Panic in commit type 3");
    }
    log.lh.n = 0;
  104170:	c7 05 b0 05 11 00 00 	movl   $0x0,0x1105b0
  104177:	00 00 00 
    write_head();    // Erase the transaction from the log 
  10417a:	e8 0b ff ff ff       	call   10408a <write_head>
    if (PANIC_4) {
      panic("[UNDOLOG] Panic in commit type 4");
    }  
  }
}
  10417f:	90                   	nop
  104180:	c9                   	leave  
  104181:	c3                   	ret    

00104182 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
  104182:	f3 0f 1e fb          	endbr32 
  104186:	55                   	push   %ebp
  104187:	89 e5                	mov    %esp,%ebp
  104189:	83 ec 18             	sub    $0x18,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
  10418c:	a1 b0 05 11 00       	mov    0x1105b0,%eax
  104191:	83 f8 1d             	cmp    $0x1d,%eax
  104194:	7f 12                	jg     1041a8 <log_write+0x26>
  104196:	a1 b0 05 11 00       	mov    0x1105b0,%eax
  10419b:	8b 15 a4 05 11 00    	mov    0x1105a4,%edx
  1041a1:	83 ea 01             	sub    $0x1,%edx
  1041a4:	39 d0                	cmp    %edx,%eax
  1041a6:	7c 0d                	jl     1041b5 <log_write+0x33>
    panic("too big a transaction");
  1041a8:	83 ec 0c             	sub    $0xc,%esp
  1041ab:	68 3b 47 10 00       	push   $0x10473b
  1041b0:	e8 04 c1 ff ff       	call   1002b9 <panic>
  for (i = 0; i < log.lh.n; i++) {
  1041b5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1041bc:	eb 1d                	jmp    1041db <log_write+0x59>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
  1041be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1041c1:	83 c0 04             	add    $0x4,%eax
  1041c4:	8b 04 85 a4 05 11 00 	mov    0x1105a4(,%eax,4),%eax
  1041cb:	89 c2                	mov    %eax,%edx
  1041cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1041d0:	8b 40 08             	mov    0x8(%eax),%eax
  1041d3:	39 c2                	cmp    %eax,%edx
  1041d5:	74 10                	je     1041e7 <log_write+0x65>
  for (i = 0; i < log.lh.n; i++) {
  1041d7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1041db:	a1 b0 05 11 00       	mov    0x1105b0,%eax
  1041e0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1041e3:	7c d9                	jl     1041be <log_write+0x3c>
  1041e5:	eb 01                	jmp    1041e8 <log_write+0x66>
      break;
  1041e7:	90                   	nop
  }
  log.lh.block[i] = b->blockno;
  1041e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1041eb:	8b 40 08             	mov    0x8(%eax),%eax
  1041ee:	89 c2                	mov    %eax,%edx
  1041f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1041f3:	83 c0 04             	add    $0x4,%eax
  1041f6:	89 14 85 a4 05 11 00 	mov    %edx,0x1105a4(,%eax,4)
  if (i == log.lh.n)
  1041fd:	a1 b0 05 11 00       	mov    0x1105b0,%eax
  104202:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  104205:	75 0d                	jne    104214 <log_write+0x92>
    log.lh.n++;
  104207:	a1 b0 05 11 00       	mov    0x1105b0,%eax
  10420c:	83 c0 01             	add    $0x1,%eax
  10420f:	a3 b0 05 11 00       	mov    %eax,0x1105b0

  b->flags |= B_DIRTY; // prevent eviction
  104214:	8b 45 08             	mov    0x8(%ebp),%eax
  104217:	8b 00                	mov    (%eax),%eax
  104219:	83 c8 04             	or     $0x4,%eax
  10421c:	89 c2                	mov    %eax,%edx
  10421e:	8b 45 08             	mov    0x8(%ebp),%eax
  104221:	89 10                	mov    %edx,(%eax)
        struct buf * old = get_old(b->blockno);
  104223:	8b 45 08             	mov    0x8(%ebp),%eax
  104226:	8b 40 08             	mov    0x8(%eax),%eax
  104229:	83 ec 0c             	sub    $0xc,%esp
  10422c:	50                   	push   %eax
  10422d:	e8 94 dd ff ff       	call   101fc6 <get_old>
  104232:	83 c4 10             	add    $0x10,%esp
  104235:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(old == NULL){
  104238:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10423c:	75 2c                	jne    10426a <log_write+0xe8>
		cprintf("disk was fetched");
  10423e:	83 ec 0c             	sub    $0xc,%esp
  104241:	68 51 47 10 00       	push   $0x104751
  104246:	e8 a5 be ff ff       	call   1000f0 <cprintf>
  10424b:	83 c4 10             	add    $0x10,%esp
                old = bread(log.dev, b->blockno);
  10424e:	8b 45 08             	mov    0x8(%ebp),%eax
  104251:	8b 40 08             	mov    0x8(%eax),%eax
  104254:	8b 15 ac 05 11 00    	mov    0x1105ac,%edx
  10425a:	83 ec 08             	sub    $0x8,%esp
  10425d:	50                   	push   %eax
  10425e:	52                   	push   %edx
  10425f:	e8 63 df ff ff       	call   1021c7 <bread>
  104264:	83 c4 10             	add    $0x10,%esp
  104267:	89 45 f0             	mov    %eax,-0x10(%ebp)
        }
        if(old->blockno != b->blockno){
  10426a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10426d:	8b 50 08             	mov    0x8(%eax),%edx
  104270:	8b 45 08             	mov    0x8(%ebp),%eax
  104273:	8b 40 08             	mov    0x8(%eax),%eax
  104276:	39 c2                	cmp    %eax,%edx
  104278:	74 10                	je     10428a <log_write+0x108>
                cprintf("block no dont match");
  10427a:	83 ec 0c             	sub    $0xc,%esp
  10427d:	68 62 47 10 00       	push   $0x104762
  104282:	e8 69 be ff ff       	call   1000f0 <cprintf>
  104287:	83 c4 10             	add    $0x10,%esp
        }
        struct buf * to = bread(log.dev, log.start + i + 1);
  10428a:	8b 15 a0 05 11 00    	mov    0x1105a0,%edx
  104290:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104293:	01 d0                	add    %edx,%eax
  104295:	83 c0 01             	add    $0x1,%eax
  104298:	89 c2                	mov    %eax,%edx
  10429a:	a1 ac 05 11 00       	mov    0x1105ac,%eax
  10429f:	83 ec 08             	sub    $0x8,%esp
  1042a2:	52                   	push   %edx
  1042a3:	50                   	push   %eax
  1042a4:	e8 1e df ff ff       	call   1021c7 <bread>
  1042a9:	83 c4 10             	add    $0x10,%esp
  1042ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
        memmove(to->data, old->data, BSIZE);
  1042af:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1042b2:	8d 50 1c             	lea    0x1c(%eax),%edx
  1042b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1042b8:	83 c0 1c             	add    $0x1c,%eax
  1042bb:	83 ec 04             	sub    $0x4,%esp
  1042be:	68 00 02 00 00       	push   $0x200
  1042c3:	52                   	push   %edx
  1042c4:	50                   	push   %eax
  1042c5:	e8 0d cd ff ff       	call   100fd7 <memmove>
  1042ca:	83 c4 10             	add    $0x10,%esp
        bwrite(to);
  1042cd:	83 ec 0c             	sub    $0xc,%esp
  1042d0:	ff 75 ec             	pushl  -0x14(%ebp)
  1042d3:	e8 2c df ff ff       	call   102204 <bwrite>
  1042d8:	83 c4 10             	add    $0x10,%esp
        brelse(to);
  1042db:	83 ec 0c             	sub    $0xc,%esp
  1042de:	ff 75 ec             	pushl  -0x14(%ebp)
  1042e1:	e8 93 df ff ff       	call   102279 <brelse>
  1042e6:	83 c4 10             	add    $0x10,%esp
}
  1042e9:	90                   	nop
  1042ea:	c9                   	leave  
  1042eb:	c3                   	ret    
