
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
  10000c:	bc 10 dc 10 00       	mov    $0x10dc10,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
  100011:	b8 74 08 10 00       	mov    $0x100874,%eax
  jmp *%eax
  100016:	ff e0                	jmp    *%eax

00100018 <outw>:
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  100018:	55                   	push   %ebp
  100019:	89 e5                	mov    %esp,%ebp
  10001b:	83 ec 08             	sub    $0x8,%esp
  10001e:	8b 55 08             	mov    0x8(%ebp),%edx
  100021:	8b 45 0c             	mov    0xc(%ebp),%eax
  100024:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100028:	66 89 45 f8          	mov    %ax,-0x8(%ebp)

  10002c:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  100030:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100034:	66 ef                	out    %ax,(%dx)
  if(sign)
  100036:	90                   	nop
  100037:	c9                   	leave
  100038:	c3                   	ret

00100039 <cli>:
      consputc(c);
      break;
    }
  }
}

  100039:	55                   	push   %ebp
  10003a:	89 e5                	mov    %esp,%ebp
void
  10003c:	fa                   	cli
halt(void)
  10003d:	90                   	nop
  10003e:	5d                   	pop    %ebp
  10003f:	c3                   	ret

00100040 <printint>:
{
  100040:	55                   	push   %ebp
  100041:	89 e5                	mov    %esp,%ebp
  100043:	83 ec 28             	sub    $0x28,%esp
  if(sign && (sign = xx < 0))
  100046:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10004a:	74 1c                	je     100068 <printint+0x28>
  10004c:	8b 45 08             	mov    0x8(%ebp),%eax
  10004f:	c1 e8 1f             	shr    $0x1f,%eax
  100052:	0f b6 c0             	movzbl %al,%eax
  100055:	89 45 10             	mov    %eax,0x10(%ebp)
  100058:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10005c:	74 0a                	je     100068 <printint+0x28>
    x = -xx;
  10005e:	8b 45 08             	mov    0x8(%ebp),%eax
  100061:	f7 d8                	neg    %eax
  100063:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100066:	eb 06                	jmp    10006e <printint+0x2e>
    x = xx;
  100068:	8b 45 08             	mov    0x8(%ebp),%eax
  10006b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  i = 0;
  10006e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    buf[i++] = digits[x % base];
  100075:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100078:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10007b:	ba 00 00 00 00       	mov    $0x0,%edx
  100080:	f7 f1                	div    %ecx
  100082:	89 d1                	mov    %edx,%ecx
  100084:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100087:	8d 50 01             	lea    0x1(%eax),%edx
  10008a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10008d:	0f b6 91 00 50 10 00 	movzbl 0x105000(%ecx),%edx
  100094:	88 54 05 e0          	mov    %dl,-0x20(%ebp,%eax,1)
  }while((x /= base) != 0);
  100098:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10009b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10009e:	ba 00 00 00 00       	mov    $0x0,%edx
  1000a3:	f7 f1                	div    %ecx
  1000a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1000a8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1000ac:	75 c7                	jne    100075 <printint+0x35>
  if(sign)
  1000ae:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1000b2:	74 2a                	je     1000de <printint+0x9e>
    buf[i++] = '-';
  1000b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000b7:	8d 50 01             	lea    0x1(%eax),%edx
  1000ba:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1000bd:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)
  while(--i >= 0)
  1000c2:	eb 1a                	jmp    1000de <printint+0x9e>
    consputc(buf[i]);
  1000c4:	8d 55 e0             	lea    -0x20(%ebp),%edx
  1000c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000ca:	01 d0                	add    %edx,%eax
  1000cc:	0f b6 00             	movzbl (%eax),%eax
  1000cf:	0f be c0             	movsbl %al,%eax
  1000d2:	83 ec 0c             	sub    $0xc,%esp
  1000d5:	50                   	push   %eax
  1000d6:	e8 60 02 00 00       	call   10033b <consputc>
  1000db:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
  1000de:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1000e2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1000e6:	79 dc                	jns    1000c4 <printint+0x84>
}
  1000e8:	90                   	nop
  1000e9:	90                   	nop
  1000ea:	c9                   	leave
  1000eb:	c3                   	ret

001000ec <cprintf>:
{
  1000ec:	55                   	push   %ebp
  1000ed:	89 e5                	mov    %esp,%ebp
  1000ef:	83 ec 18             	sub    $0x18,%esp
  if (fmt == 0)
  1000f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1000f5:	85 c0                	test   %eax,%eax
  1000f7:	0f 84 63 01 00 00    	je     100260 <cprintf+0x174>
  argp = (uint*)(void*)(&fmt + 1);
  1000fd:	8d 45 0c             	lea    0xc(%ebp),%eax
  100100:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
  100103:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10010a:	e9 2f 01 00 00       	jmp    10023e <cprintf+0x152>
    if(c != '%'){
  10010f:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
  100113:	74 13                	je     100128 <cprintf+0x3c>
      consputc(c);
  100115:	83 ec 0c             	sub    $0xc,%esp
  100118:	ff 75 e8             	push   -0x18(%ebp)
  10011b:	e8 1b 02 00 00       	call   10033b <consputc>
  100120:	83 c4 10             	add    $0x10,%esp
      continue;
  100123:	e9 12 01 00 00       	jmp    10023a <cprintf+0x14e>
    c = fmt[++i] & 0xff;
  100128:	8b 55 08             	mov    0x8(%ebp),%edx
  10012b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10012f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100132:	01 d0                	add    %edx,%eax
  100134:	0f b6 00             	movzbl (%eax),%eax
  100137:	0f be c0             	movsbl %al,%eax
  10013a:	25 ff 00 00 00       	and    $0xff,%eax
  10013f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(c == 0)
  100142:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  100146:	0f 84 17 01 00 00    	je     100263 <cprintf+0x177>
    switch(c){
  10014c:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
  100150:	74 5e                	je     1001b0 <cprintf+0xc4>
  100152:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
  100156:	0f 8f c2 00 00 00    	jg     10021e <cprintf+0x132>
  10015c:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
  100160:	74 6b                	je     1001cd <cprintf+0xe1>
  100162:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
  100166:	0f 8f b2 00 00 00    	jg     10021e <cprintf+0x132>
  10016c:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
  100170:	74 3e                	je     1001b0 <cprintf+0xc4>
  100172:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
  100176:	0f 8f a2 00 00 00    	jg     10021e <cprintf+0x132>
  10017c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
  100180:	0f 84 89 00 00 00    	je     10020f <cprintf+0x123>
  100186:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
  10018a:	0f 85 8e 00 00 00    	jne    10021e <cprintf+0x132>
      printint(*argp++, 10, 1);
  100190:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100193:	8d 50 04             	lea    0x4(%eax),%edx
  100196:	89 55 f0             	mov    %edx,-0x10(%ebp)
  100199:	8b 00                	mov    (%eax),%eax
  10019b:	83 ec 04             	sub    $0x4,%esp
  10019e:	6a 01                	push   $0x1
  1001a0:	6a 0a                	push   $0xa
  1001a2:	50                   	push   %eax
  1001a3:	e8 98 fe ff ff       	call   100040 <printint>
  1001a8:	83 c4 10             	add    $0x10,%esp
      break;
  1001ab:	e9 8a 00 00 00       	jmp    10023a <cprintf+0x14e>
      printint(*argp++, 16, 0);
  1001b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1001b3:	8d 50 04             	lea    0x4(%eax),%edx
  1001b6:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1001b9:	8b 00                	mov    (%eax),%eax
  1001bb:	83 ec 04             	sub    $0x4,%esp
  1001be:	6a 00                	push   $0x0
  1001c0:	6a 10                	push   $0x10
  1001c2:	50                   	push   %eax
  1001c3:	e8 78 fe ff ff       	call   100040 <printint>
  1001c8:	83 c4 10             	add    $0x10,%esp
      break;
  1001cb:	eb 6d                	jmp    10023a <cprintf+0x14e>
      if((s = (char*)*argp++) == 0)
  1001cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1001d0:	8d 50 04             	lea    0x4(%eax),%edx
  1001d3:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1001d6:	8b 00                	mov    (%eax),%eax
  1001d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1001db:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  1001df:	75 22                	jne    100203 <cprintf+0x117>
        s = "(null)";
  1001e1:	c7 45 ec bc 40 10 00 	movl   $0x1040bc,-0x14(%ebp)
      for(; *s; s++)
  1001e8:	eb 19                	jmp    100203 <cprintf+0x117>
        consputc(*s);
  1001ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1001ed:	0f b6 00             	movzbl (%eax),%eax
  1001f0:	0f be c0             	movsbl %al,%eax
  1001f3:	83 ec 0c             	sub    $0xc,%esp
  1001f6:	50                   	push   %eax
  1001f7:	e8 3f 01 00 00       	call   10033b <consputc>
  1001fc:	83 c4 10             	add    $0x10,%esp
      for(; *s; s++)
  1001ff:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100203:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100206:	0f b6 00             	movzbl (%eax),%eax
  100209:	84 c0                	test   %al,%al
  10020b:	75 dd                	jne    1001ea <cprintf+0xfe>
      break;
  10020d:	eb 2b                	jmp    10023a <cprintf+0x14e>
      consputc('%');
  10020f:	83 ec 0c             	sub    $0xc,%esp
  100212:	6a 25                	push   $0x25
  100214:	e8 22 01 00 00       	call   10033b <consputc>
  100219:	83 c4 10             	add    $0x10,%esp
      break;
  10021c:	eb 1c                	jmp    10023a <cprintf+0x14e>
      consputc('%');
  10021e:	83 ec 0c             	sub    $0xc,%esp
  100221:	6a 25                	push   $0x25
  100223:	e8 13 01 00 00       	call   10033b <consputc>
  100228:	83 c4 10             	add    $0x10,%esp
      consputc(c);
  10022b:	83 ec 0c             	sub    $0xc,%esp
  10022e:	ff 75 e8             	push   -0x18(%ebp)
  100231:	e8 05 01 00 00       	call   10033b <consputc>
  100236:	83 c4 10             	add    $0x10,%esp
      break;
  100239:	90                   	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
  10023a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10023e:	8b 55 08             	mov    0x8(%ebp),%edx
  100241:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100244:	01 d0                	add    %edx,%eax
  100246:	0f b6 00             	movzbl (%eax),%eax
  100249:	0f be c0             	movsbl %al,%eax
  10024c:	25 ff 00 00 00       	and    $0xff,%eax
  100251:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100254:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  100258:	0f 85 b1 fe ff ff    	jne    10010f <cprintf+0x23>
  10025e:	eb 04                	jmp    100264 <cprintf+0x178>
    return;
  100260:	90                   	nop
  100261:	eb 01                	jmp    100264 <cprintf+0x178>
      break;
  100263:	90                   	nop
}
  100264:	c9                   	leave
  100265:	c3                   	ret

00100266 <halt>:
{
  100266:	55                   	push   %ebp
  100267:	89 e5                	mov    %esp,%ebp
  100269:	83 ec 08             	sub    $0x8,%esp
  cprintf("Bye COL%d!\n\0", 331);
  10026c:	83 ec 08             	sub    $0x8,%esp
  10026f:	68 4b 01 00 00       	push   $0x14b
  100274:	68 c3 40 10 00       	push   $0x1040c3
  100279:	e8 6e fe ff ff       	call   1000ec <cprintf>
  10027e:	83 c4 10             	add    $0x10,%esp
  outw(0x602, 0x2000);
  100281:	83 ec 08             	sub    $0x8,%esp
  100284:	68 00 20 00 00       	push   $0x2000
  100289:	68 02 06 00 00       	push   $0x602
  10028e:	e8 85 fd ff ff       	call   100018 <outw>
  100293:	83 c4 10             	add    $0x10,%esp
  // For older versions of QEMU, 
  outw(0xB002, 0x2000);
  100296:	83 ec 08             	sub    $0x8,%esp
  100299:	68 00 20 00 00       	push   $0x2000
  10029e:	68 02 b0 00 00       	push   $0xb002
  1002a3:	e8 70 fd ff ff       	call   100018 <outw>
  1002a8:	83 c4 10             	add    $0x10,%esp
  for(;;);
  1002ab:	90                   	nop
  1002ac:	eb fd                	jmp    1002ab <halt+0x45>

001002ae <panic>:
}

void
panic(char *s)
{
  1002ae:	55                   	push   %ebp
  1002af:	89 e5                	mov    %esp,%ebp
  1002b1:	83 ec 38             	sub    $0x38,%esp
  int i;
  uint pcs[10];

  cli();
  1002b4:	e8 80 fd ff ff       	call   100039 <cli>
  cprintf("lapicid %d: panic: ", lapicid());
  1002b9:	e8 62 04 00 00       	call   100720 <lapicid>
  1002be:	83 ec 08             	sub    $0x8,%esp
  1002c1:	50                   	push   %eax
  1002c2:	68 d0 40 10 00       	push   $0x1040d0
  1002c7:	e8 20 fe ff ff       	call   1000ec <cprintf>
  1002cc:	83 c4 10             	add    $0x10,%esp
  cprintf(s);
  1002cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1002d2:	83 ec 0c             	sub    $0xc,%esp
  1002d5:	50                   	push   %eax
  1002d6:	e8 11 fe ff ff       	call   1000ec <cprintf>
  1002db:	83 c4 10             	add    $0x10,%esp
  cprintf("\n");
  1002de:	83 ec 0c             	sub    $0xc,%esp
  1002e1:	68 e4 40 10 00       	push   $0x1040e4
  1002e6:	e8 01 fe ff ff       	call   1000ec <cprintf>
  1002eb:	83 c4 10             	add    $0x10,%esp
  getcallerpcs(&s, pcs);
  1002ee:	83 ec 08             	sub    $0x8,%esp
  1002f1:	8d 45 cc             	lea    -0x34(%ebp),%eax
  1002f4:	50                   	push   %eax
  1002f5:	8d 45 08             	lea    0x8(%ebp),%eax
  1002f8:	50                   	push   %eax
  1002f9:	e8 b2 0e 00 00       	call   1011b0 <getcallerpcs>
  1002fe:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
  100301:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100308:	eb 1c                	jmp    100326 <panic+0x78>
    cprintf(" %p", pcs[i]);
  10030a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10030d:	8b 44 85 cc          	mov    -0x34(%ebp,%eax,4),%eax
  100311:	83 ec 08             	sub    $0x8,%esp
  100314:	50                   	push   %eax
  100315:	68 e6 40 10 00       	push   $0x1040e6
  10031a:	e8 cd fd ff ff       	call   1000ec <cprintf>
  10031f:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
  100322:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100326:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  10032a:	7e de                	jle    10030a <panic+0x5c>
  panicked = 1; // freeze other CPU
  10032c:	c7 05 ac 54 10 00 01 	movl   $0x1,0x1054ac
  100333:	00 00 00 
  halt();
  100336:	e8 2b ff ff ff       	call   100266 <halt>

0010033b <consputc>:

#define BACKSPACE 0x100

void
consputc(int c)
{
  10033b:	55                   	push   %ebp
  10033c:	89 e5                	mov    %esp,%ebp
  10033e:	83 ec 08             	sub    $0x8,%esp
  if(c == BACKSPACE){
  100341:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
  100348:	75 29                	jne    100373 <consputc+0x38>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  10034a:	83 ec 0c             	sub    $0xc,%esp
  10034d:	6a 08                	push   $0x8
  10034f:	e8 5f 0a 00 00       	call   100db3 <uartputc>
  100354:	83 c4 10             	add    $0x10,%esp
  100357:	83 ec 0c             	sub    $0xc,%esp
  10035a:	6a 20                	push   $0x20
  10035c:	e8 52 0a 00 00       	call   100db3 <uartputc>
  100361:	83 c4 10             	add    $0x10,%esp
  100364:	83 ec 0c             	sub    $0xc,%esp
  100367:	6a 08                	push   $0x8
  100369:	e8 45 0a 00 00       	call   100db3 <uartputc>
  10036e:	83 c4 10             	add    $0x10,%esp
  } else
    uartputc(c);
}
  100371:	eb 0e                	jmp    100381 <consputc+0x46>
    uartputc(c);
  100373:	83 ec 0c             	sub    $0xc,%esp
  100376:	ff 75 08             	push   0x8(%ebp)
  100379:	e8 35 0a 00 00       	call   100db3 <uartputc>
  10037e:	83 c4 10             	add    $0x10,%esp
}
  100381:	90                   	nop
  100382:	c9                   	leave
  100383:	c3                   	ret

00100384 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
  100384:	55                   	push   %ebp
  100385:	89 e5                	mov    %esp,%ebp
  100387:	83 ec 18             	sub    $0x18,%esp
  int c;

  while((c = getc()) >= 0){
  10038a:	e9 26 01 00 00       	jmp    1004b5 <consoleintr+0x131>
    switch(c){
  10038f:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%ebp)
  100393:	74 67                	je     1003fc <consoleintr+0x78>
  100395:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%ebp)
  100399:	0f 8f 92 00 00 00    	jg     100431 <consoleintr+0xad>
  10039f:	83 7d f4 08          	cmpl   $0x8,-0xc(%ebp)
  1003a3:	74 57                	je     1003fc <consoleintr+0x78>
  1003a5:	83 7d f4 15          	cmpl   $0x15,-0xc(%ebp)
  1003a9:	0f 85 82 00 00 00    	jne    100431 <consoleintr+0xad>
    case C('U'):  // Kill line.
      while(input.e != input.w &&
  1003af:	eb 1d                	jmp    1003ce <consoleintr+0x4a>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
  1003b1:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  1003b6:	83 e8 01             	sub    $0x1,%eax
  1003b9:	a3 a8 54 10 00       	mov    %eax,0x1054a8
        consputc(BACKSPACE);
  1003be:	83 ec 0c             	sub    $0xc,%esp
  1003c1:	68 00 01 00 00       	push   $0x100
  1003c6:	e8 70 ff ff ff       	call   10033b <consputc>
  1003cb:	83 c4 10             	add    $0x10,%esp
      while(input.e != input.w &&
  1003ce:	8b 15 a8 54 10 00    	mov    0x1054a8,%edx
  1003d4:	a1 a4 54 10 00       	mov    0x1054a4,%eax
  1003d9:	39 c2                	cmp    %eax,%edx
  1003db:	0f 84 cd 00 00 00    	je     1004ae <consoleintr+0x12a>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
  1003e1:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  1003e6:	83 e8 01             	sub    $0x1,%eax
  1003e9:	83 e0 7f             	and    $0x7f,%eax
  1003ec:	0f b6 80 20 54 10 00 	movzbl 0x105420(%eax),%eax
      while(input.e != input.w &&
  1003f3:	3c 0a                	cmp    $0xa,%al
  1003f5:	75 ba                	jne    1003b1 <consoleintr+0x2d>
      }
      break;
  1003f7:	e9 b2 00 00 00       	jmp    1004ae <consoleintr+0x12a>
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
  1003fc:	8b 15 a8 54 10 00    	mov    0x1054a8,%edx
  100402:	a1 a4 54 10 00       	mov    0x1054a4,%eax
  100407:	39 c2                	cmp    %eax,%edx
  100409:	0f 84 a2 00 00 00    	je     1004b1 <consoleintr+0x12d>
        input.e--;
  10040f:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  100414:	83 e8 01             	sub    $0x1,%eax
  100417:	a3 a8 54 10 00       	mov    %eax,0x1054a8
        consputc(BACKSPACE);
  10041c:	83 ec 0c             	sub    $0xc,%esp
  10041f:	68 00 01 00 00       	push   $0x100
  100424:	e8 12 ff ff ff       	call   10033b <consputc>
  100429:	83 c4 10             	add    $0x10,%esp
      }
      break;
  10042c:	e9 80 00 00 00       	jmp    1004b1 <consoleintr+0x12d>
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
  100431:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100435:	74 7d                	je     1004b4 <consoleintr+0x130>
  100437:	8b 15 a8 54 10 00    	mov    0x1054a8,%edx
  10043d:	a1 a0 54 10 00       	mov    0x1054a0,%eax
  100442:	29 c2                	sub    %eax,%edx
  100444:	83 fa 7f             	cmp    $0x7f,%edx
  100447:	77 6b                	ja     1004b4 <consoleintr+0x130>
        c = (c == '\r') ? '\n' : c;
  100449:	83 7d f4 0d          	cmpl   $0xd,-0xc(%ebp)
  10044d:	74 05                	je     100454 <consoleintr+0xd0>
  10044f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100452:	eb 05                	jmp    100459 <consoleintr+0xd5>
  100454:	b8 0a 00 00 00       	mov    $0xa,%eax
  100459:	89 45 f4             	mov    %eax,-0xc(%ebp)
        input.buf[input.e++ % INPUT_BUF] = c;
  10045c:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  100461:	8d 50 01             	lea    0x1(%eax),%edx
  100464:	89 15 a8 54 10 00    	mov    %edx,0x1054a8
  10046a:	83 e0 7f             	and    $0x7f,%eax
  10046d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100470:	88 90 20 54 10 00    	mov    %dl,0x105420(%eax)
        consputc(c);
  100476:	83 ec 0c             	sub    $0xc,%esp
  100479:	ff 75 f4             	push   -0xc(%ebp)
  10047c:	e8 ba fe ff ff       	call   10033b <consputc>
  100481:	83 c4 10             	add    $0x10,%esp
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
  100484:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
  100488:	74 18                	je     1004a2 <consoleintr+0x11e>
  10048a:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
  10048e:	74 12                	je     1004a2 <consoleintr+0x11e>
  100490:	8b 15 a8 54 10 00    	mov    0x1054a8,%edx
  100496:	a1 a0 54 10 00       	mov    0x1054a0,%eax
  10049b:	83 e8 80             	sub    $0xffffff80,%eax
  10049e:	39 c2                	cmp    %eax,%edx
  1004a0:	75 12                	jne    1004b4 <consoleintr+0x130>
          input.w = input.e;
  1004a2:	a1 a8 54 10 00       	mov    0x1054a8,%eax
  1004a7:	a3 a4 54 10 00       	mov    %eax,0x1054a4
        }
      }
      break;
  1004ac:	eb 06                	jmp    1004b4 <consoleintr+0x130>
      break;
  1004ae:	90                   	nop
  1004af:	eb 04                	jmp    1004b5 <consoleintr+0x131>
      break;
  1004b1:	90                   	nop
  1004b2:	eb 01                	jmp    1004b5 <consoleintr+0x131>
      break;
  1004b4:	90                   	nop
  while((c = getc()) >= 0){
  1004b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1004b8:	ff d0                	call   *%eax
  1004ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1004bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004c1:	0f 89 c8 fe ff ff    	jns    10038f <consoleintr+0xb>
    }
  }
  1004c7:	90                   	nop
  1004c8:	90                   	nop
  1004c9:	c9                   	leave
  1004ca:	c3                   	ret

001004cb <ioapicread>:
  uint data;
};

static uint
ioapicread(int reg)
{
  1004cb:	55                   	push   %ebp
  1004cc:	89 e5                	mov    %esp,%ebp
  ioapic->reg = reg;
  1004ce:	a1 b0 54 10 00       	mov    0x1054b0,%eax
  1004d3:	8b 55 08             	mov    0x8(%ebp),%edx
  1004d6:	89 10                	mov    %edx,(%eax)
  return ioapic->data;
  1004d8:	a1 b0 54 10 00       	mov    0x1054b0,%eax
  1004dd:	8b 40 10             	mov    0x10(%eax),%eax
}
  1004e0:	5d                   	pop    %ebp
  1004e1:	c3                   	ret

001004e2 <ioapicwrite>:

static void
ioapicwrite(int reg, uint data)
{
  1004e2:	55                   	push   %ebp
  1004e3:	89 e5                	mov    %esp,%ebp
  ioapic->reg = reg;
  1004e5:	a1 b0 54 10 00       	mov    0x1054b0,%eax
  1004ea:	8b 55 08             	mov    0x8(%ebp),%edx
  1004ed:	89 10                	mov    %edx,(%eax)
  ioapic->data = data;
  1004ef:	a1 b0 54 10 00       	mov    0x1054b0,%eax
  1004f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  1004f7:	89 50 10             	mov    %edx,0x10(%eax)
}
  1004fa:	90                   	nop
  1004fb:	5d                   	pop    %ebp
  1004fc:	c3                   	ret

001004fd <ioapicinit>:

void
ioapicinit(void)
{
  1004fd:	55                   	push   %ebp
  1004fe:	89 e5                	mov    %esp,%ebp
  100500:	83 ec 18             	sub    $0x18,%esp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  100503:	c7 05 b0 54 10 00 00 	movl   $0xfec00000,0x1054b0
  10050a:	00 c0 fe 
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  10050d:	6a 01                	push   $0x1
  10050f:	e8 b7 ff ff ff       	call   1004cb <ioapicread>
  100514:	83 c4 04             	add    $0x4,%esp
  100517:	c1 e8 10             	shr    $0x10,%eax
  10051a:	25 ff 00 00 00       	and    $0xff,%eax
  10051f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  id = ioapicread(REG_ID) >> 24;
  100522:	6a 00                	push   $0x0
  100524:	e8 a2 ff ff ff       	call   1004cb <ioapicread>
  100529:	83 c4 04             	add    $0x4,%esp
  10052c:	c1 e8 18             	shr    $0x18,%eax
  10052f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(id != ioapicid)
  100532:	0f b6 05 c4 54 10 00 	movzbl 0x1054c4,%eax
  100539:	0f b6 c0             	movzbl %al,%eax
  10053c:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  10053f:	74 10                	je     100551 <ioapicinit+0x54>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
  100541:	83 ec 0c             	sub    $0xc,%esp
  100544:	68 ec 40 10 00       	push   $0x1040ec
  100549:	e8 9e fb ff ff       	call   1000ec <cprintf>
  10054e:	83 c4 10             	add    $0x10,%esp

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
  100551:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100558:	eb 3f                	jmp    100599 <ioapicinit+0x9c>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
  10055a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10055d:	83 c0 20             	add    $0x20,%eax
  100560:	0d 00 00 01 00       	or     $0x10000,%eax
  100565:	89 c2                	mov    %eax,%edx
  100567:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10056a:	83 c0 08             	add    $0x8,%eax
  10056d:	01 c0                	add    %eax,%eax
  10056f:	83 ec 08             	sub    $0x8,%esp
  100572:	52                   	push   %edx
  100573:	50                   	push   %eax
  100574:	e8 69 ff ff ff       	call   1004e2 <ioapicwrite>
  100579:	83 c4 10             	add    $0x10,%esp
    ioapicwrite(REG_TABLE+2*i+1, 0);
  10057c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10057f:	83 c0 08             	add    $0x8,%eax
  100582:	01 c0                	add    %eax,%eax
  100584:	83 c0 01             	add    $0x1,%eax
  100587:	83 ec 08             	sub    $0x8,%esp
  10058a:	6a 00                	push   $0x0
  10058c:	50                   	push   %eax
  10058d:	e8 50 ff ff ff       	call   1004e2 <ioapicwrite>
  100592:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i <= maxintr; i++){
  100595:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100599:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10059c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  10059f:	7e b9                	jle    10055a <ioapicinit+0x5d>
  }
}
  1005a1:	90                   	nop
  1005a2:	90                   	nop
  1005a3:	c9                   	leave
  1005a4:	c3                   	ret

001005a5 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
  1005a5:	55                   	push   %ebp
  1005a6:	89 e5                	mov    %esp,%ebp
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  1005a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ab:	83 c0 20             	add    $0x20,%eax
  1005ae:	89 c2                	mov    %eax,%edx
  1005b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1005b3:	83 c0 08             	add    $0x8,%eax
  1005b6:	01 c0                	add    %eax,%eax
  1005b8:	52                   	push   %edx
  1005b9:	50                   	push   %eax
  1005ba:	e8 23 ff ff ff       	call   1004e2 <ioapicwrite>
  1005bf:	83 c4 08             	add    $0x8,%esp
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
  1005c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c5:	c1 e0 18             	shl    $0x18,%eax
  1005c8:	89 c2                	mov    %eax,%edx
  1005ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1005cd:	83 c0 08             	add    $0x8,%eax
  1005d0:	01 c0                	add    %eax,%eax
  1005d2:	83 c0 01             	add    $0x1,%eax
  1005d5:	52                   	push   %edx
  1005d6:	50                   	push   %eax
  1005d7:	e8 06 ff ff ff       	call   1004e2 <ioapicwrite>
  1005dc:	83 c4 08             	add    $0x8,%esp
}
  1005df:	90                   	nop
  1005e0:	c9                   	leave
  1005e1:	c3                   	ret

001005e2 <lapicw>:

volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  1005e2:	55                   	push   %ebp
  1005e3:	89 e5                	mov    %esp,%ebp
  lapic[index] = value;
  1005e5:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  1005ea:	8b 55 08             	mov    0x8(%ebp),%edx
  1005ed:	c1 e2 02             	shl    $0x2,%edx
  1005f0:	01 c2                	add    %eax,%edx
  1005f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f5:	89 02                	mov    %eax,(%edx)
  lapic[ID];  // wait for write to finish, by reading
  1005f7:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  1005fc:	83 c0 20             	add    $0x20,%eax
  1005ff:	8b 00                	mov    (%eax),%eax
}
  100601:	90                   	nop
  100602:	5d                   	pop    %ebp
  100603:	c3                   	ret

00100604 <lapicinit>:

void
lapicinit(void)
{
  100604:	55                   	push   %ebp
  100605:	89 e5                	mov    %esp,%ebp
  if(!lapic)
  100607:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  10060c:	85 c0                	test   %eax,%eax
  10060e:	0f 84 09 01 00 00    	je     10071d <lapicinit+0x119>
    return;

  // Enable local APIC; set spurious interrupt vector.
  lapicw(SVR, ENABLE | (T_IRQ0 + IRQ_SPURIOUS));
  100614:	68 3f 01 00 00       	push   $0x13f
  100619:	6a 3c                	push   $0x3c
  10061b:	e8 c2 ff ff ff       	call   1005e2 <lapicw>
  100620:	83 c4 08             	add    $0x8,%esp

  // The timer repeatedly counts down at bus frequency
  // from lapic[TICR] and then issues an interrupt.
  // If xv6 cared more about precise timekeeping,
  // TICR would be calibrated using an external time source.
  lapicw(TDCR, X1);
  100623:	6a 0b                	push   $0xb
  100625:	68 f8 00 00 00       	push   $0xf8
  10062a:	e8 b3 ff ff ff       	call   1005e2 <lapicw>
  10062f:	83 c4 08             	add    $0x8,%esp
  lapicw(TIMER, PERIODIC | (T_IRQ0 + IRQ_TIMER));
  100632:	68 20 00 02 00       	push   $0x20020
  100637:	68 c8 00 00 00       	push   $0xc8
  10063c:	e8 a1 ff ff ff       	call   1005e2 <lapicw>
  100641:	83 c4 08             	add    $0x8,%esp
  lapicw(TICR, 10000000);
  100644:	68 80 96 98 00       	push   $0x989680
  100649:	68 e0 00 00 00       	push   $0xe0
  10064e:	e8 8f ff ff ff       	call   1005e2 <lapicw>
  100653:	83 c4 08             	add    $0x8,%esp

  // Disable logical interrupt lines.
  lapicw(LINT0, MASKED);
  100656:	68 00 00 01 00       	push   $0x10000
  10065b:	68 d4 00 00 00       	push   $0xd4
  100660:	e8 7d ff ff ff       	call   1005e2 <lapicw>
  100665:	83 c4 08             	add    $0x8,%esp
  lapicw(LINT1, MASKED);
  100668:	68 00 00 01 00       	push   $0x10000
  10066d:	68 d8 00 00 00       	push   $0xd8
  100672:	e8 6b ff ff ff       	call   1005e2 <lapicw>
  100677:	83 c4 08             	add    $0x8,%esp

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
  10067a:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  10067f:	83 c0 30             	add    $0x30,%eax
  100682:	8b 00                	mov    (%eax),%eax
  100684:	25 00 00 fc 00       	and    $0xfc0000,%eax
  100689:	85 c0                	test   %eax,%eax
  10068b:	74 12                	je     10069f <lapicinit+0x9b>
    lapicw(PCINT, MASKED);
  10068d:	68 00 00 01 00       	push   $0x10000
  100692:	68 d0 00 00 00       	push   $0xd0
  100697:	e8 46 ff ff ff       	call   1005e2 <lapicw>
  10069c:	83 c4 08             	add    $0x8,%esp

  // Map error interrupt to IRQ_ERROR.
  lapicw(ERROR, T_IRQ0 + IRQ_ERROR);
  10069f:	6a 33                	push   $0x33
  1006a1:	68 dc 00 00 00       	push   $0xdc
  1006a6:	e8 37 ff ff ff       	call   1005e2 <lapicw>
  1006ab:	83 c4 08             	add    $0x8,%esp

  // Clear error status register (requires back-to-back writes).
  lapicw(ESR, 0);
  1006ae:	6a 00                	push   $0x0
  1006b0:	68 a0 00 00 00       	push   $0xa0
  1006b5:	e8 28 ff ff ff       	call   1005e2 <lapicw>
  1006ba:	83 c4 08             	add    $0x8,%esp
  lapicw(ESR, 0);
  1006bd:	6a 00                	push   $0x0
  1006bf:	68 a0 00 00 00       	push   $0xa0
  1006c4:	e8 19 ff ff ff       	call   1005e2 <lapicw>
  1006c9:	83 c4 08             	add    $0x8,%esp

  // Ack any outstanding interrupts.
  lapicw(EOI, 0);
  1006cc:	6a 00                	push   $0x0
  1006ce:	6a 2c                	push   $0x2c
  1006d0:	e8 0d ff ff ff       	call   1005e2 <lapicw>
  1006d5:	83 c4 08             	add    $0x8,%esp

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  1006d8:	6a 00                	push   $0x0
  1006da:	68 c4 00 00 00       	push   $0xc4
  1006df:	e8 fe fe ff ff       	call   1005e2 <lapicw>
  1006e4:	83 c4 08             	add    $0x8,%esp
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  1006e7:	68 00 85 08 00       	push   $0x88500
  1006ec:	68 c0 00 00 00       	push   $0xc0
  1006f1:	e8 ec fe ff ff       	call   1005e2 <lapicw>
  1006f6:	83 c4 08             	add    $0x8,%esp
  while(lapic[ICRLO] & DELIVS)
  1006f9:	90                   	nop
  1006fa:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  1006ff:	05 00 03 00 00       	add    $0x300,%eax
  100704:	8b 00                	mov    (%eax),%eax
  100706:	25 00 10 00 00       	and    $0x1000,%eax
  10070b:	85 c0                	test   %eax,%eax
  10070d:	75 eb                	jne    1006fa <lapicinit+0xf6>
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
  10070f:	6a 00                	push   $0x0
  100711:	6a 20                	push   $0x20
  100713:	e8 ca fe ff ff       	call   1005e2 <lapicw>
  100718:	83 c4 08             	add    $0x8,%esp
  10071b:	eb 01                	jmp    10071e <lapicinit+0x11a>
    return;
  10071d:	90                   	nop
}
  10071e:	c9                   	leave
  10071f:	c3                   	ret

00100720 <lapicid>:

int
lapicid(void)
{
  100720:	55                   	push   %ebp
  100721:	89 e5                	mov    %esp,%ebp
  if (!lapic)
  100723:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  100728:	85 c0                	test   %eax,%eax
  10072a:	75 07                	jne    100733 <lapicid+0x13>
    return 0;
  10072c:	b8 00 00 00 00       	mov    $0x0,%eax
  100731:	eb 0d                	jmp    100740 <lapicid+0x20>
  return lapic[ID] >> 24;
  100733:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  100738:	83 c0 20             	add    $0x20,%eax
  10073b:	8b 00                	mov    (%eax),%eax
  10073d:	c1 e8 18             	shr    $0x18,%eax
}
  100740:	5d                   	pop    %ebp
  100741:	c3                   	ret

00100742 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  100742:	55                   	push   %ebp
  100743:	89 e5                	mov    %esp,%ebp
  if(lapic)
  100745:	a1 b4 54 10 00       	mov    0x1054b4,%eax
  10074a:	85 c0                	test   %eax,%eax
  10074c:	74 0c                	je     10075a <lapiceoi+0x18>
    lapicw(EOI, 0);
  10074e:	6a 00                	push   $0x0
  100750:	6a 2c                	push   $0x2c
  100752:	e8 8b fe ff ff       	call   1005e2 <lapicw>
  100757:	83 c4 08             	add    $0x8,%esp
}
  10075a:	90                   	nop
  10075b:	c9                   	leave
  10075c:	c3                   	ret

0010075d <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
  10075d:	55                   	push   %ebp
  10075e:	89 e5                	mov    %esp,%ebp
  100760:	90                   	nop
  100761:	5d                   	pop    %ebp
  100762:	c3                   	ret

00100763 <sti>:
  100763:	55                   	push   %ebp
  100764:	89 e5                	mov    %esp,%ebp
  100766:	fb                   	sti
  100767:	90                   	nop
  100768:	5d                   	pop    %ebp
  100769:	c3                   	ret

0010076a <wfi>:
  10076a:	55                   	push   %ebp
  10076b:	89 e5                	mov    %esp,%ebp
  10076d:	f4                   	hlt
  10076e:	90                   	nop
  10076f:	5d                   	pop    %ebp
  100770:	c3                   	ret

00100771 <log_test>:
log_test(void) {
  100771:	55                   	push   %ebp
  100772:	89 e5                	mov    %esp,%ebp
  100774:	81 ec 18 02 00 00    	sub    $0x218,%esp
  if((gtxt=open("/hello.txt", O_RDONLY)) == 0) {
  10077a:	83 ec 08             	sub    $0x8,%esp
  10077d:	6a 00                	push   $0x0
  10077f:	68 20 41 10 00       	push   $0x104120
  100784:	e8 a1 33 00 00       	call   103b2a <open>
  100789:	83 c4 10             	add    $0x10,%esp
  10078c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10078f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100793:	75 0d                	jne    1007a2 <log_test+0x31>
    panic("Unable to open /hello.txt");
  100795:	83 ec 0c             	sub    $0xc,%esp
  100798:	68 2b 41 10 00       	push   $0x10412b
  10079d:	e8 0c fb ff ff       	call   1002ae <panic>
  n = fileread(gtxt, buffer, 5);
  1007a2:	83 ec 04             	sub    $0x4,%esp
  1007a5:	6a 05                	push   $0x5
  1007a7:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  1007ad:	50                   	push   %eax
  1007ae:	ff 75 f4             	push   -0xc(%ebp)
  1007b1:	e8 fd 2d 00 00       	call   1035b3 <fileread>
  1007b6:	83 c4 10             	add    $0x10,%esp
  1007b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cprintf("[UNDOLOG] READ: %d %s\n", n, buffer);
  1007bc:	83 ec 04             	sub    $0x4,%esp
  1007bf:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  1007c5:	50                   	push   %eax
  1007c6:	ff 75 f0             	push   -0x10(%ebp)
  1007c9:	68 45 41 10 00       	push   $0x104145
  1007ce:	e8 19 f9 ff ff       	call   1000ec <cprintf>
  1007d3:	83 c4 10             	add    $0x10,%esp
  fileclose(gtxt);
  1007d6:	83 ec 0c             	sub    $0xc,%esp
  1007d9:	ff 75 f4             	push   -0xc(%ebp)
  1007dc:	e8 fe 2c 00 00       	call   1034df <fileclose>
  1007e1:	83 c4 10             	add    $0x10,%esp
  buffer[0] = '0' + PANIC_1;
  1007e4:	c6 85 f0 fd ff ff 30 	movb   $0x30,-0x210(%ebp)
  buffer[1] = '0' + PANIC_2;
  1007eb:	c6 85 f1 fd ff ff 30 	movb   $0x30,-0x20f(%ebp)
  buffer[2] = '0' + PANIC_3;
  1007f2:	c6 85 f2 fd ff ff 30 	movb   $0x30,-0x20e(%ebp)
  buffer[3] = '0' + PANIC_4;
  1007f9:	c6 85 f3 fd ff ff 30 	movb   $0x30,-0x20d(%ebp)
  buffer[4] = '0' + PANIC_5;
  100800:	c6 85 f4 fd ff ff 30 	movb   $0x30,-0x20c(%ebp)
  if((gtxt = open("/hello.txt", O_WRONLY)) == 0){
  100807:	83 ec 08             	sub    $0x8,%esp
  10080a:	6a 01                	push   $0x1
  10080c:	68 20 41 10 00       	push   $0x104120
  100811:	e8 14 33 00 00       	call   103b2a <open>
  100816:	83 c4 10             	add    $0x10,%esp
  100819:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10081c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100820:	75 0d                	jne    10082f <log_test+0xbe>
    panic("Failed to create /foo/hello.txt");
  100822:	83 ec 0c             	sub    $0xc,%esp
  100825:	68 5c 41 10 00       	push   $0x10415c
  10082a:	e8 7f fa ff ff       	call   1002ae <panic>
  n = filewrite(gtxt, buffer, 5);
  10082f:	83 ec 04             	sub    $0x4,%esp
  100832:	6a 05                	push   $0x5
  100834:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  10083a:	50                   	push   %eax
  10083b:	ff 75 f4             	push   -0xc(%ebp)
  10083e:	e8 ef 2d 00 00       	call   103632 <filewrite>
  100843:	83 c4 10             	add    $0x10,%esp
  100846:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cprintf("[UNDOLOG] WRITE: %d %s\n", n, buffer);
  100849:	83 ec 04             	sub    $0x4,%esp
  10084c:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  100852:	50                   	push   %eax
  100853:	ff 75 f0             	push   -0x10(%ebp)
  100856:	68 7c 41 10 00       	push   $0x10417c
  10085b:	e8 8c f8 ff ff       	call   1000ec <cprintf>
  100860:	83 c4 10             	add    $0x10,%esp
  fileclose(gtxt);
  100863:	83 ec 0c             	sub    $0xc,%esp
  100866:	ff 75 f4             	push   -0xc(%ebp)
  100869:	e8 71 2c 00 00       	call   1034df <fileclose>
  10086e:	83 c4 10             	add    $0x10,%esp
}
  100871:	90                   	nop
  100872:	c9                   	leave
  100873:	c3                   	ret

00100874 <main>:
{
  100874:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  100878:	83 e4 f0             	and    $0xfffffff0,%esp
  10087b:	ff 71 fc             	push   -0x4(%ecx)
  10087e:	55                   	push   %ebp
  10087f:	89 e5                	mov    %esp,%ebp
  100881:	51                   	push   %ecx
  100882:	83 ec 04             	sub    $0x4,%esp
  mpinit();        // detect other processors
  100885:	e8 83 02 00 00       	call   100b0d <mpinit>
  lapicinit();     // interrupt controller
  10088a:	e8 75 fd ff ff       	call   100604 <lapicinit>
  picinit();       // disable pic
  10088f:	e8 d5 03 00 00       	call   100c69 <picinit>
  ioapicinit();    // another interrupt controller
  100894:	e8 64 fc ff ff       	call   1004fd <ioapicinit>
  uartinit();      // serial port
  100899:	e8 2e 04 00 00       	call   100ccc <uartinit>
  ideinit();       // disk 
  10089e:	e8 cb 19 00 00       	call   10226e <ideinit>
  tvinit();        // trap vectors
  1008a3:	e8 c4 09 00 00       	call   10126c <tvinit>
  binit();         // buffer cache
  1008a8:	e8 76 16 00 00       	call   101f23 <binit>
  idtinit();       // load idt register
  1008ad:	e8 a0 0a 00 00       	call   101352 <idtinit>
  sti();           // enable interrupts
  1008b2:	e8 ac fe ff ff       	call   100763 <sti>
  iinit(ROOTDEV);  // Read superblock to start reading inodes
  1008b7:	83 ec 0c             	sub    $0xc,%esp
  1008ba:	6a 01                	push   $0x1
  1008bc:	e8 8f 1f 00 00       	call   102850 <iinit>
  1008c1:	83 c4 10             	add    $0x10,%esp
  initlog(ROOTDEV);  // Initialize log
  1008c4:	83 ec 0c             	sub    $0xc,%esp
  1008c7:	6a 01                	push   $0x1
  1008c9:	e8 d4 33 00 00       	call   103ca2 <initlog>
  1008ce:	83 c4 10             	add    $0x10,%esp
  log_test();
  1008d1:	e8 9b fe ff ff       	call   100771 <log_test>
    wfi();
  1008d6:	e8 8f fe ff ff       	call   10076a <wfi>
  1008db:	eb f9                	jmp    1008d6 <main+0x62>

001008dd <inb>:
// Multiprocessor support
// Search memory for MP description structures.
// http://developer.intel.com/design/pentium/datashts/24201606.pdf

#include "types.h"
  1008dd:	55                   	push   %ebp
  1008de:	89 e5                	mov    %esp,%ebp
  1008e0:	83 ec 14             	sub    $0x14,%esp
  1008e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1008e6:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
#include "defs.h"
#include "param.h"
// #include "memlayout.h"
  1008ea:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1008ee:	89 c2                	mov    %eax,%edx
  1008f0:	ec                   	in     (%dx),%al
  1008f1:	88 45 ff             	mov    %al,-0x1(%ebp)
#include "mp.h"
  1008f4:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
#include "x86.h"
  1008f8:	c9                   	leave
  1008f9:	c3                   	ret

001008fa <outb>:
static uchar
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  1008fa:	55                   	push   %ebp
  1008fb:	89 e5                	mov    %esp,%ebp
  1008fd:	83 ec 08             	sub    $0x8,%esp
  100900:	8b 55 08             	mov    0x8(%ebp),%edx
  100903:	8b 45 0c             	mov    0xc(%ebp),%eax
  100906:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  10090a:	88 45 f8             	mov    %al,-0x8(%ebp)
  for(i=0; i<len; i++)
  10090d:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100911:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100915:	ee                   	out    %al,(%dx)
    sum += addr[i];
  100916:	90                   	nop
  100917:	c9                   	leave
  100918:	c3                   	ret

00100919 <sum>:
{
  100919:	55                   	push   %ebp
  10091a:	89 e5                	mov    %esp,%ebp
  10091c:	83 ec 10             	sub    $0x10,%esp
  sum = 0;
  10091f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  for(i=0; i<len; i++)
  100926:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10092d:	eb 15                	jmp    100944 <sum+0x2b>
    sum += addr[i];
  10092f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100932:	8b 45 08             	mov    0x8(%ebp),%eax
  100935:	01 d0                	add    %edx,%eax
  100937:	0f b6 00             	movzbl (%eax),%eax
  10093a:	0f b6 c0             	movzbl %al,%eax
  10093d:	01 45 f8             	add    %eax,-0x8(%ebp)
  for(i=0; i<len; i++)
  100940:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100944:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100947:	3b 45 0c             	cmp    0xc(%ebp),%eax
  10094a:	7c e3                	jl     10092f <sum+0x16>
  return sum;
  10094c:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  10094f:	c9                   	leave
  100950:	c3                   	ret

00100951 <mpsearch1>:

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
  100951:	55                   	push   %ebp
  100952:	89 e5                	mov    %esp,%ebp
  100954:	83 ec 18             	sub    $0x18,%esp
  uchar *e, *p, *addr;

  // addr = P2V(a);
  addr = (uchar*) a;
  100957:	8b 45 08             	mov    0x8(%ebp),%eax
  10095a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  e = addr+len;
  10095d:	8b 55 0c             	mov    0xc(%ebp),%edx
  100960:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100963:	01 d0                	add    %edx,%eax
  100965:	89 45 ec             	mov    %eax,-0x14(%ebp)
  for(p = addr; p < e; p += sizeof(struct mp))
  100968:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10096b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10096e:	eb 36                	jmp    1009a6 <mpsearch1+0x55>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
  100970:	83 ec 04             	sub    $0x4,%esp
  100973:	6a 04                	push   $0x4
  100975:	68 94 41 10 00       	push   $0x104194
  10097a:	ff 75 f4             	push   -0xc(%ebp)
  10097d:	e8 92 05 00 00       	call   100f14 <memcmp>
  100982:	83 c4 10             	add    $0x10,%esp
  100985:	85 c0                	test   %eax,%eax
  100987:	75 19                	jne    1009a2 <mpsearch1+0x51>
  100989:	83 ec 08             	sub    $0x8,%esp
  10098c:	6a 10                	push   $0x10
  10098e:	ff 75 f4             	push   -0xc(%ebp)
  100991:	e8 83 ff ff ff       	call   100919 <sum>
  100996:	83 c4 10             	add    $0x10,%esp
  100999:	84 c0                	test   %al,%al
  10099b:	75 05                	jne    1009a2 <mpsearch1+0x51>
      return (struct mp*)p;
  10099d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009a0:	eb 11                	jmp    1009b3 <mpsearch1+0x62>
  for(p = addr; p < e; p += sizeof(struct mp))
  1009a2:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
  1009a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009a9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1009ac:	72 c2                	jb     100970 <mpsearch1+0x1f>
  return 0;
  1009ae:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1009b3:	c9                   	leave
  1009b4:	c3                   	ret

001009b5 <mpsearch>:
// 1) in the first KB of the EBDA;
// 2) in the last KB of system base memory;
// 3) in the BIOS ROM between 0xE0000 and 0xFFFFF.
static struct mp*
mpsearch(void)
{
  1009b5:	55                   	push   %ebp
  1009b6:	89 e5                	mov    %esp,%ebp
  1009b8:	83 ec 18             	sub    $0x18,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  // bda = (uchar *) P2V(0x400);
  bda = (uchar *) 0x400;
  1009bb:	c7 45 f4 00 04 00 00 	movl   $0x400,-0xc(%ebp)
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
  1009c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009c5:	83 c0 0f             	add    $0xf,%eax
  1009c8:	0f b6 00             	movzbl (%eax),%eax
  1009cb:	0f b6 c0             	movzbl %al,%eax
  1009ce:	c1 e0 08             	shl    $0x8,%eax
  1009d1:	89 c2                	mov    %eax,%edx
  1009d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009d6:	83 c0 0e             	add    $0xe,%eax
  1009d9:	0f b6 00             	movzbl (%eax),%eax
  1009dc:	0f b6 c0             	movzbl %al,%eax
  1009df:	09 d0                	or     %edx,%eax
  1009e1:	c1 e0 04             	shl    $0x4,%eax
  1009e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1009e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1009eb:	74 21                	je     100a0e <mpsearch+0x59>
    if((mp = mpsearch1(p, 1024)))
  1009ed:	83 ec 08             	sub    $0x8,%esp
  1009f0:	68 00 04 00 00       	push   $0x400
  1009f5:	ff 75 f0             	push   -0x10(%ebp)
  1009f8:	e8 54 ff ff ff       	call   100951 <mpsearch1>
  1009fd:	83 c4 10             	add    $0x10,%esp
  100a00:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100a03:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100a07:	74 51                	je     100a5a <mpsearch+0xa5>
      return mp;
  100a09:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a0c:	eb 61                	jmp    100a6f <mpsearch+0xba>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
  100a0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a11:	83 c0 14             	add    $0x14,%eax
  100a14:	0f b6 00             	movzbl (%eax),%eax
  100a17:	0f b6 c0             	movzbl %al,%eax
  100a1a:	c1 e0 08             	shl    $0x8,%eax
  100a1d:	89 c2                	mov    %eax,%edx
  100a1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a22:	83 c0 13             	add    $0x13,%eax
  100a25:	0f b6 00             	movzbl (%eax),%eax
  100a28:	0f b6 c0             	movzbl %al,%eax
  100a2b:	09 d0                	or     %edx,%eax
  100a2d:	c1 e0 0a             	shl    $0xa,%eax
  100a30:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((mp = mpsearch1(p-1024, 1024)))
  100a33:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a36:	2d 00 04 00 00       	sub    $0x400,%eax
  100a3b:	83 ec 08             	sub    $0x8,%esp
  100a3e:	68 00 04 00 00       	push   $0x400
  100a43:	50                   	push   %eax
  100a44:	e8 08 ff ff ff       	call   100951 <mpsearch1>
  100a49:	83 c4 10             	add    $0x10,%esp
  100a4c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100a4f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100a53:	74 05                	je     100a5a <mpsearch+0xa5>
      return mp;
  100a55:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a58:	eb 15                	jmp    100a6f <mpsearch+0xba>
  }
  return mpsearch1(0xF0000, 0x10000);
  100a5a:	83 ec 08             	sub    $0x8,%esp
  100a5d:	68 00 00 01 00       	push   $0x10000
  100a62:	68 00 00 0f 00       	push   $0xf0000
  100a67:	e8 e5 fe ff ff       	call   100951 <mpsearch1>
  100a6c:	83 c4 10             	add    $0x10,%esp
}
  100a6f:	c9                   	leave
  100a70:	c3                   	ret

00100a71 <mpconfig>:
// Check for correct signature, calculate the checksum and,
// if correct, check the version.
// To do: check extended table checksum.
static struct mpconf*
mpconfig(struct mp **pmp)
{
  100a71:	55                   	push   %ebp
  100a72:	89 e5                	mov    %esp,%ebp
  100a74:	83 ec 18             	sub    $0x18,%esp
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
  100a77:	e8 39 ff ff ff       	call   1009b5 <mpsearch>
  100a7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a7f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a83:	74 0a                	je     100a8f <mpconfig+0x1e>
  100a85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a88:	8b 40 04             	mov    0x4(%eax),%eax
  100a8b:	85 c0                	test   %eax,%eax
  100a8d:	75 07                	jne    100a96 <mpconfig+0x25>
    return 0;
  100a8f:	b8 00 00 00 00       	mov    $0x0,%eax
  100a94:	eb 75                	jmp    100b0b <mpconfig+0x9a>
  // conf = (struct mpconf*) P2V((uint) mp->physaddr);
  conf = (struct mpconf*) (uint) mp->physaddr;
  100a96:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a99:	8b 40 04             	mov    0x4(%eax),%eax
  100a9c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
  100a9f:	83 ec 04             	sub    $0x4,%esp
  100aa2:	6a 04                	push   $0x4
  100aa4:	68 99 41 10 00       	push   $0x104199
  100aa9:	ff 75 f0             	push   -0x10(%ebp)
  100aac:	e8 63 04 00 00       	call   100f14 <memcmp>
  100ab1:	83 c4 10             	add    $0x10,%esp
  100ab4:	85 c0                	test   %eax,%eax
  100ab6:	74 07                	je     100abf <mpconfig+0x4e>
    return 0;
  100ab8:	b8 00 00 00 00       	mov    $0x0,%eax
  100abd:	eb 4c                	jmp    100b0b <mpconfig+0x9a>
  if(conf->version != 1 && conf->version != 4)
  100abf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ac2:	0f b6 40 06          	movzbl 0x6(%eax),%eax
  100ac6:	3c 01                	cmp    $0x1,%al
  100ac8:	74 12                	je     100adc <mpconfig+0x6b>
  100aca:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100acd:	0f b6 40 06          	movzbl 0x6(%eax),%eax
  100ad1:	3c 04                	cmp    $0x4,%al
  100ad3:	74 07                	je     100adc <mpconfig+0x6b>
    return 0;
  100ad5:	b8 00 00 00 00       	mov    $0x0,%eax
  100ada:	eb 2f                	jmp    100b0b <mpconfig+0x9a>
  if(sum((uchar*)conf, conf->length) != 0)
  100adc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100adf:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100ae3:	0f b7 c0             	movzwl %ax,%eax
  100ae6:	83 ec 08             	sub    $0x8,%esp
  100ae9:	50                   	push   %eax
  100aea:	ff 75 f0             	push   -0x10(%ebp)
  100aed:	e8 27 fe ff ff       	call   100919 <sum>
  100af2:	83 c4 10             	add    $0x10,%esp
  100af5:	84 c0                	test   %al,%al
  100af7:	74 07                	je     100b00 <mpconfig+0x8f>
    return 0;
  100af9:	b8 00 00 00 00       	mov    $0x0,%eax
  100afe:	eb 0b                	jmp    100b0b <mpconfig+0x9a>
  *pmp = mp;
  100b00:	8b 45 08             	mov    0x8(%ebp),%eax
  100b03:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b06:	89 10                	mov    %edx,(%eax)
  return conf;
  100b08:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100b0b:	c9                   	leave
  100b0c:	c3                   	ret

00100b0d <mpinit>:

void
mpinit(void)
{
  100b0d:	55                   	push   %ebp
  100b0e:	89 e5                	mov    %esp,%ebp
  100b10:	83 ec 28             	sub    $0x28,%esp
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
  100b13:	83 ec 0c             	sub    $0xc,%esp
  100b16:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100b19:	50                   	push   %eax
  100b1a:	e8 52 ff ff ff       	call   100a71 <mpconfig>
  100b1f:	83 c4 10             	add    $0x10,%esp
  100b22:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100b25:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100b29:	75 0d                	jne    100b38 <mpinit+0x2b>
    panic("Expect to run on an SMP");
  100b2b:	83 ec 0c             	sub    $0xc,%esp
  100b2e:	68 9e 41 10 00       	push   $0x10419e
  100b33:	e8 76 f7 ff ff       	call   1002ae <panic>
  ismp = 1;
  100b38:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  lapic = (uint*)conf->lapicaddr;
  100b3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100b42:	8b 40 24             	mov    0x24(%eax),%eax
  100b45:	a3 b4 54 10 00       	mov    %eax,0x1054b4
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
  100b4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100b4d:	83 c0 2c             	add    $0x2c,%eax
  100b50:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100b53:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100b56:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100b5a:	0f b7 d0             	movzwl %ax,%edx
  100b5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100b60:	01 d0                	add    %edx,%eax
  100b62:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100b65:	e9 83 00 00 00       	jmp    100bed <mpinit+0xe0>
    switch(*p){
  100b6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b6d:	0f b6 00             	movzbl (%eax),%eax
  100b70:	0f b6 c0             	movzbl %al,%eax
  100b73:	83 f8 04             	cmp    $0x4,%eax
  100b76:	7f 6d                	jg     100be5 <mpinit+0xd8>
  100b78:	83 f8 03             	cmp    $0x3,%eax
  100b7b:	7d 62                	jge    100bdf <mpinit+0xd2>
  100b7d:	83 f8 02             	cmp    $0x2,%eax
  100b80:	74 45                	je     100bc7 <mpinit+0xba>
  100b82:	83 f8 02             	cmp    $0x2,%eax
  100b85:	7f 5e                	jg     100be5 <mpinit+0xd8>
  100b87:	85 c0                	test   %eax,%eax
  100b89:	74 07                	je     100b92 <mpinit+0x85>
  100b8b:	83 f8 01             	cmp    $0x1,%eax
  100b8e:	74 4f                	je     100bdf <mpinit+0xd2>
  100b90:	eb 53                	jmp    100be5 <mpinit+0xd8>
    case MPPROC:
      proc = (struct mpproc*)p;
  100b92:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b95:	89 45 e0             	mov    %eax,-0x20(%ebp)
      if(ncpu < NCPU) {
  100b98:	a1 c0 54 10 00       	mov    0x1054c0,%eax
  100b9d:	83 f8 07             	cmp    $0x7,%eax
  100ba0:	7f 1f                	jg     100bc1 <mpinit+0xb4>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
  100ba2:	a1 c0 54 10 00       	mov    0x1054c0,%eax
  100ba7:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100baa:	0f b6 52 01          	movzbl 0x1(%edx),%edx
  100bae:	88 90 b8 54 10 00    	mov    %dl,0x1054b8(%eax)
        ncpu++;
  100bb4:	a1 c0 54 10 00       	mov    0x1054c0,%eax
  100bb9:	83 c0 01             	add    $0x1,%eax
  100bbc:	a3 c0 54 10 00       	mov    %eax,0x1054c0
      }
      p += sizeof(struct mpproc);
  100bc1:	83 45 f4 14          	addl   $0x14,-0xc(%ebp)
      continue;
  100bc5:	eb 26                	jmp    100bed <mpinit+0xe0>
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
  100bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      ioapicid = ioapic->apicno;
  100bcd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100bd0:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  100bd4:	a2 c4 54 10 00       	mov    %al,0x1054c4
      p += sizeof(struct mpioapic);
  100bd9:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
      continue;
  100bdd:	eb 0e                	jmp    100bed <mpinit+0xe0>
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
  100bdf:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
      continue;
  100be3:	eb 08                	jmp    100bed <mpinit+0xe0>
    default:
      ismp = 0;
  100be5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      break;
  100bec:	90                   	nop
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
  100bed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bf0:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  100bf3:	0f 82 71 ff ff ff    	jb     100b6a <mpinit+0x5d>
    }
  }
  if(!ismp)
  100bf9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100bfd:	75 0d                	jne    100c0c <mpinit+0xff>
    panic("Didn't find a suitable machine");
  100bff:	83 ec 0c             	sub    $0xc,%esp
  100c02:	68 b8 41 10 00       	push   $0x1041b8
  100c07:	e8 a2 f6 ff ff       	call   1002ae <panic>

  if(mp->imcrp){
  100c0c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100c0f:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
  100c13:	84 c0                	test   %al,%al
  100c15:	74 30                	je     100c47 <mpinit+0x13a>
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
  100c17:	83 ec 08             	sub    $0x8,%esp
  100c1a:	6a 70                	push   $0x70
  100c1c:	6a 22                	push   $0x22
  100c1e:	e8 d7 fc ff ff       	call   1008fa <outb>
  100c23:	83 c4 10             	add    $0x10,%esp
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  100c26:	83 ec 0c             	sub    $0xc,%esp
  100c29:	6a 23                	push   $0x23
  100c2b:	e8 ad fc ff ff       	call   1008dd <inb>
  100c30:	83 c4 10             	add    $0x10,%esp
  100c33:	83 c8 01             	or     $0x1,%eax
  100c36:	0f b6 c0             	movzbl %al,%eax
  100c39:	83 ec 08             	sub    $0x8,%esp
  100c3c:	50                   	push   %eax
  100c3d:	6a 23                	push   $0x23
  100c3f:	e8 b6 fc ff ff       	call   1008fa <outb>
  100c44:	83 c4 10             	add    $0x10,%esp
  }
}
  100c47:	90                   	nop
  100c48:	c9                   	leave
  100c49:	c3                   	ret

00100c4a <outb>:
  100c4a:	55                   	push   %ebp
  100c4b:	89 e5                	mov    %esp,%ebp
  100c4d:	83 ec 08             	sub    $0x8,%esp
  100c50:	8b 55 08             	mov    0x8(%ebp),%edx
  100c53:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c56:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100c5a:	88 45 f8             	mov    %al,-0x8(%ebp)
  100c5d:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100c61:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100c65:	ee                   	out    %al,(%dx)
  100c66:	90                   	nop
  100c67:	c9                   	leave
  100c68:	c3                   	ret

00100c69 <picinit>:
{
  100c69:	55                   	push   %ebp
  100c6a:	89 e5                	mov    %esp,%ebp
  outb(IO_PIC1+1, 0xFF);
  100c6c:	68 ff 00 00 00       	push   $0xff
  100c71:	6a 21                	push   $0x21
  100c73:	e8 d2 ff ff ff       	call   100c4a <outb>
  100c78:	83 c4 08             	add    $0x8,%esp
  outb(IO_PIC2+1, 0xFF);
  100c7b:	68 ff 00 00 00       	push   $0xff
  100c80:	68 a1 00 00 00       	push   $0xa1
  100c85:	e8 c0 ff ff ff       	call   100c4a <outb>
  100c8a:	83 c4 08             	add    $0x8,%esp
  100c8d:	90                   	nop
  100c8e:	c9                   	leave
  100c8f:	c3                   	ret

00100c90 <inb>:
// Intel 8250 serial port (UART).

#include "types.h"
#include "defs.h"
#include "param.h"
  100c90:	55                   	push   %ebp
  100c91:	89 e5                	mov    %esp,%ebp
  100c93:	83 ec 14             	sub    $0x14,%esp
  100c96:	8b 45 08             	mov    0x8(%ebp),%eax
  100c99:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
#include "x86.h"
#include "traps.h"

  100c9d:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  100ca1:	89 c2                	mov    %eax,%edx
  100ca3:	ec                   	in     (%dx),%al
  100ca4:	88 45 ff             	mov    %al,-0x1(%ebp)
#define COM1    0x3f8
  100ca7:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax

  100cab:	c9                   	leave
  100cac:	c3                   	ret

00100cad <outb>:
  // Turn off the FIFO
  outb(COM1+2, 0);

  // 9600 baud, 8 data bits, 1 stop bit, parity off.
  outb(COM1+3, 0x80);    // Unlock divisor
  outb(COM1+0, 115200/9600);
  100cad:	55                   	push   %ebp
  100cae:	89 e5                	mov    %esp,%ebp
  100cb0:	83 ec 08             	sub    $0x8,%esp
  100cb3:	8b 55 08             	mov    0x8(%ebp),%edx
  100cb6:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cb9:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100cbd:	88 45 f8             	mov    %al,-0x8(%ebp)
  outb(COM1+1, 0);
  100cc0:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100cc4:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100cc8:	ee                   	out    %al,(%dx)
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  100cc9:	90                   	nop
  100cca:	c9                   	leave
  100ccb:	c3                   	ret

00100ccc <uartinit>:
{
  100ccc:	55                   	push   %ebp
  100ccd:	89 e5                	mov    %esp,%ebp
  100ccf:	83 ec 18             	sub    $0x18,%esp
  outb(COM1+2, 0);
  100cd2:	6a 00                	push   $0x0
  100cd4:	68 fa 03 00 00       	push   $0x3fa
  100cd9:	e8 cf ff ff ff       	call   100cad <outb>
  100cde:	83 c4 08             	add    $0x8,%esp
  outb(COM1+3, 0x80);    // Unlock divisor
  100ce1:	68 80 00 00 00       	push   $0x80
  100ce6:	68 fb 03 00 00       	push   $0x3fb
  100ceb:	e8 bd ff ff ff       	call   100cad <outb>
  100cf0:	83 c4 08             	add    $0x8,%esp
  outb(COM1+0, 115200/9600);
  100cf3:	6a 0c                	push   $0xc
  100cf5:	68 f8 03 00 00       	push   $0x3f8
  100cfa:	e8 ae ff ff ff       	call   100cad <outb>
  100cff:	83 c4 08             	add    $0x8,%esp
  outb(COM1+1, 0);
  100d02:	6a 00                	push   $0x0
  100d04:	68 f9 03 00 00       	push   $0x3f9
  100d09:	e8 9f ff ff ff       	call   100cad <outb>
  100d0e:	83 c4 08             	add    $0x8,%esp
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  100d11:	6a 03                	push   $0x3
  100d13:	68 fb 03 00 00       	push   $0x3fb
  100d18:	e8 90 ff ff ff       	call   100cad <outb>
  100d1d:	83 c4 08             	add    $0x8,%esp
  outb(COM1+4, 0);
  100d20:	6a 00                	push   $0x0
  100d22:	68 fc 03 00 00       	push   $0x3fc
  100d27:	e8 81 ff ff ff       	call   100cad <outb>
  100d2c:	83 c4 08             	add    $0x8,%esp
  outb(COM1+1, 0x01);    // Enable receive interrupts.
  100d2f:	6a 01                	push   $0x1
  100d31:	68 f9 03 00 00       	push   $0x3f9
  100d36:	e8 72 ff ff ff       	call   100cad <outb>
  100d3b:	83 c4 08             	add    $0x8,%esp

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
  100d3e:	68 fd 03 00 00       	push   $0x3fd
  100d43:	e8 48 ff ff ff       	call   100c90 <inb>
  100d48:	83 c4 04             	add    $0x4,%esp
  100d4b:	3c ff                	cmp    $0xff,%al
  100d4d:	74 61                	je     100db0 <uartinit+0xe4>
    return;
  uart = 1;
  100d4f:	c7 05 c8 54 10 00 01 	movl   $0x1,0x1054c8
  100d56:	00 00 00 

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  100d59:	68 fa 03 00 00       	push   $0x3fa
  100d5e:	e8 2d ff ff ff       	call   100c90 <inb>
  100d63:	83 c4 04             	add    $0x4,%esp
  inb(COM1+0);
  100d66:	68 f8 03 00 00       	push   $0x3f8
  100d6b:	e8 20 ff ff ff       	call   100c90 <inb>
  100d70:	83 c4 04             	add    $0x4,%esp
  ioapicenable(IRQ_COM1, 0);
  100d73:	83 ec 08             	sub    $0x8,%esp
  100d76:	6a 00                	push   $0x0
  100d78:	6a 04                	push   $0x4
  100d7a:	e8 26 f8 ff ff       	call   1005a5 <ioapicenable>
  100d7f:	83 c4 10             	add    $0x10,%esp

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
  100d82:	c7 45 f4 d7 41 10 00 	movl   $0x1041d7,-0xc(%ebp)
  100d89:	eb 19                	jmp    100da4 <uartinit+0xd8>
    uartputc(*p);
  100d8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d8e:	0f b6 00             	movzbl (%eax),%eax
  100d91:	0f be c0             	movsbl %al,%eax
  100d94:	83 ec 0c             	sub    $0xc,%esp
  100d97:	50                   	push   %eax
  100d98:	e8 16 00 00 00       	call   100db3 <uartputc>
  100d9d:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
  100da0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100da4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100da7:	0f b6 00             	movzbl (%eax),%eax
  100daa:	84 c0                	test   %al,%al
  100dac:	75 dd                	jne    100d8b <uartinit+0xbf>
  100dae:	eb 01                	jmp    100db1 <uartinit+0xe5>
    return;
  100db0:	90                   	nop
}
  100db1:	c9                   	leave
  100db2:	c3                   	ret

00100db3 <uartputc>:

void
uartputc(int c)
{
  100db3:	55                   	push   %ebp
  100db4:	89 e5                	mov    %esp,%ebp
  100db6:	83 ec 10             	sub    $0x10,%esp
  int i;

  if(!uart)
  100db9:	a1 c8 54 10 00       	mov    0x1054c8,%eax
  100dbe:	85 c0                	test   %eax,%eax
  100dc0:	74 40                	je     100e02 <uartputc+0x4f>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++);
  100dc2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100dc9:	eb 04                	jmp    100dcf <uartputc+0x1c>
  100dcb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100dcf:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  100dd3:	7f 17                	jg     100dec <uartputc+0x39>
  100dd5:	68 fd 03 00 00       	push   $0x3fd
  100dda:	e8 b1 fe ff ff       	call   100c90 <inb>
  100ddf:	83 c4 04             	add    $0x4,%esp
  100de2:	0f b6 c0             	movzbl %al,%eax
  100de5:	83 e0 20             	and    $0x20,%eax
  100de8:	85 c0                	test   %eax,%eax
  100dea:	74 df                	je     100dcb <uartputc+0x18>
  outb(COM1+0, c);
  100dec:	8b 45 08             	mov    0x8(%ebp),%eax
  100def:	0f b6 c0             	movzbl %al,%eax
  100df2:	50                   	push   %eax
  100df3:	68 f8 03 00 00       	push   $0x3f8
  100df8:	e8 b0 fe ff ff       	call   100cad <outb>
  100dfd:	83 c4 08             	add    $0x8,%esp
  100e00:	eb 01                	jmp    100e03 <uartputc+0x50>
    return;
  100e02:	90                   	nop
}
  100e03:	c9                   	leave
  100e04:	c3                   	ret

00100e05 <uartgetc>:


static int
uartgetc(void)
{
  100e05:	55                   	push   %ebp
  100e06:	89 e5                	mov    %esp,%ebp
  if(!uart)
  100e08:	a1 c8 54 10 00       	mov    0x1054c8,%eax
  100e0d:	85 c0                	test   %eax,%eax
  100e0f:	75 07                	jne    100e18 <uartgetc+0x13>
    return -1;
  100e11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e16:	eb 2e                	jmp    100e46 <uartgetc+0x41>
  if(!(inb(COM1+5) & 0x01))
  100e18:	68 fd 03 00 00       	push   $0x3fd
  100e1d:	e8 6e fe ff ff       	call   100c90 <inb>
  100e22:	83 c4 04             	add    $0x4,%esp
  100e25:	0f b6 c0             	movzbl %al,%eax
  100e28:	83 e0 01             	and    $0x1,%eax
  100e2b:	85 c0                	test   %eax,%eax
  100e2d:	75 07                	jne    100e36 <uartgetc+0x31>
    return -1;
  100e2f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e34:	eb 10                	jmp    100e46 <uartgetc+0x41>
  return inb(COM1+0);
  100e36:	68 f8 03 00 00       	push   $0x3f8
  100e3b:	e8 50 fe ff ff       	call   100c90 <inb>
  100e40:	83 c4 04             	add    $0x4,%esp
  100e43:	0f b6 c0             	movzbl %al,%eax
}
  100e46:	c9                   	leave
  100e47:	c3                   	ret

00100e48 <uartintr>:

void
uartintr(void)
{
  100e48:	55                   	push   %ebp
  100e49:	89 e5                	mov    %esp,%ebp
  100e4b:	83 ec 08             	sub    $0x8,%esp
  consoleintr(uartgetc);
  100e4e:	83 ec 0c             	sub    $0xc,%esp
  100e51:	68 05 0e 10 00       	push   $0x100e05
  100e56:	e8 29 f5 ff ff       	call   100384 <consoleintr>
  100e5b:	83 c4 10             	add    $0x10,%esp
  100e5e:	90                   	nop
  100e5f:	c9                   	leave
  100e60:	c3                   	ret

00100e61 <stosb>:
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
  100e61:	55                   	push   %ebp
  100e62:	89 e5                	mov    %esp,%ebp
  100e64:	57                   	push   %edi
  100e65:	53                   	push   %ebx
    while(n-- > 0)
  100e66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e69:	8b 55 10             	mov    0x10(%ebp),%edx
  100e6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100e6f:	89 cb                	mov    %ecx,%ebx
  100e71:	89 df                	mov    %ebx,%edi
  100e73:	89 d1                	mov    %edx,%ecx
  100e75:	fc                   	cld
  100e76:	f3 aa                	rep stos %al,%es:(%edi)
  100e78:	89 ca                	mov    %ecx,%edx
  100e7a:	89 fb                	mov    %edi,%ebx
  100e7c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100e7f:	89 55 10             	mov    %edx,0x10(%ebp)
      *d++ = *s++;

  return dst;
}
  100e82:	90                   	nop
  100e83:	5b                   	pop    %ebx
  100e84:	5f                   	pop    %edi
  100e85:	5d                   	pop    %ebp
  100e86:	c3                   	ret

00100e87 <stosl>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
  100e87:	55                   	push   %ebp
  100e88:	89 e5                	mov    %esp,%ebp
  100e8a:	57                   	push   %edi
  100e8b:	53                   	push   %ebx
{
  100e8c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e8f:	8b 55 10             	mov    0x10(%ebp),%edx
  100e92:	8b 45 0c             	mov    0xc(%ebp),%eax
  100e95:	89 cb                	mov    %ecx,%ebx
  100e97:	89 df                	mov    %ebx,%edi
  100e99:	89 d1                	mov    %edx,%ecx
  100e9b:	fc                   	cld
  100e9c:	f3 ab                	rep stos %eax,%es:(%edi)
  100e9e:	89 ca                	mov    %ecx,%edx
  100ea0:	89 fb                	mov    %edi,%ebx
  100ea2:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100ea5:	89 55 10             	mov    %edx,0x10(%ebp)
  return memmove(dst, src, n);
}

int
  100ea8:	90                   	nop
  100ea9:	5b                   	pop    %ebx
  100eaa:	5f                   	pop    %edi
  100eab:	5d                   	pop    %ebp
  100eac:	c3                   	ret

00100ead <memset>:
{
  100ead:	55                   	push   %ebp
  100eae:	89 e5                	mov    %esp,%ebp
  if ((int)dst%4 == 0 && n%4 == 0){
  100eb0:	8b 45 08             	mov    0x8(%ebp),%eax
  100eb3:	83 e0 03             	and    $0x3,%eax
  100eb6:	85 c0                	test   %eax,%eax
  100eb8:	75 43                	jne    100efd <memset+0x50>
  100eba:	8b 45 10             	mov    0x10(%ebp),%eax
  100ebd:	83 e0 03             	and    $0x3,%eax
  100ec0:	85 c0                	test   %eax,%eax
  100ec2:	75 39                	jne    100efd <memset+0x50>
    c &= 0xFF;
  100ec4:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  100ecb:	8b 45 10             	mov    0x10(%ebp),%eax
  100ece:	c1 e8 02             	shr    $0x2,%eax
  100ed1:	89 c1                	mov    %eax,%ecx
  100ed3:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ed6:	c1 e0 18             	shl    $0x18,%eax
  100ed9:	89 c2                	mov    %eax,%edx
  100edb:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ede:	c1 e0 10             	shl    $0x10,%eax
  100ee1:	09 c2                	or     %eax,%edx
  100ee3:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ee6:	c1 e0 08             	shl    $0x8,%eax
  100ee9:	09 d0                	or     %edx,%eax
  100eeb:	0b 45 0c             	or     0xc(%ebp),%eax
  100eee:	51                   	push   %ecx
  100eef:	50                   	push   %eax
  100ef0:	ff 75 08             	push   0x8(%ebp)
  100ef3:	e8 8f ff ff ff       	call   100e87 <stosl>
  100ef8:	83 c4 0c             	add    $0xc,%esp
  100efb:	eb 12                	jmp    100f0f <memset+0x62>
    stosb(dst, c, n);
  100efd:	8b 45 10             	mov    0x10(%ebp),%eax
  100f00:	50                   	push   %eax
  100f01:	ff 75 0c             	push   0xc(%ebp)
  100f04:	ff 75 08             	push   0x8(%ebp)
  100f07:	e8 55 ff ff ff       	call   100e61 <stosb>
  100f0c:	83 c4 0c             	add    $0xc,%esp
  return dst;
  100f0f:	8b 45 08             	mov    0x8(%ebp),%eax
}
  100f12:	c9                   	leave
  100f13:	c3                   	ret

00100f14 <memcmp>:
{
  100f14:	55                   	push   %ebp
  100f15:	89 e5                	mov    %esp,%ebp
  100f17:	83 ec 10             	sub    $0x10,%esp
  s1 = v1;
  100f1a:	8b 45 08             	mov    0x8(%ebp),%eax
  100f1d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  s2 = v2;
  100f20:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f23:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0){
  100f26:	eb 2e                	jmp    100f56 <memcmp+0x42>
    if(*s1 != *s2)
  100f28:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f2b:	0f b6 10             	movzbl (%eax),%edx
  100f2e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f31:	0f b6 00             	movzbl (%eax),%eax
  100f34:	38 c2                	cmp    %al,%dl
  100f36:	74 16                	je     100f4e <memcmp+0x3a>
      return *s1 - *s2;
  100f38:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f3b:	0f b6 00             	movzbl (%eax),%eax
  100f3e:	0f b6 d0             	movzbl %al,%edx
  100f41:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f44:	0f b6 00             	movzbl (%eax),%eax
  100f47:	0f b6 c0             	movzbl %al,%eax
  100f4a:	29 c2                	sub    %eax,%edx
  100f4c:	eb 1a                	jmp    100f68 <memcmp+0x54>
    s1++, s2++;
  100f4e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100f52:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  while(n-- > 0){
  100f56:	8b 45 10             	mov    0x10(%ebp),%eax
  100f59:	8d 50 ff             	lea    -0x1(%eax),%edx
  100f5c:	89 55 10             	mov    %edx,0x10(%ebp)
  100f5f:	85 c0                	test   %eax,%eax
  100f61:	75 c5                	jne    100f28 <memcmp+0x14>
  return 0;
  100f63:	ba 00 00 00 00       	mov    $0x0,%edx
}
  100f68:	89 d0                	mov    %edx,%eax
  100f6a:	c9                   	leave
  100f6b:	c3                   	ret

00100f6c <memmove>:
{
  100f6c:	55                   	push   %ebp
  100f6d:	89 e5                	mov    %esp,%ebp
  100f6f:	83 ec 10             	sub    $0x10,%esp
  s = src;
  100f72:	8b 45 0c             	mov    0xc(%ebp),%eax
  100f75:	89 45 fc             	mov    %eax,-0x4(%ebp)
  d = dst;
  100f78:	8b 45 08             	mov    0x8(%ebp),%eax
  100f7b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if(s < d && s + n > d){
  100f7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f81:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100f84:	73 54                	jae    100fda <memmove+0x6e>
  100f86:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100f89:	8b 45 10             	mov    0x10(%ebp),%eax
  100f8c:	01 d0                	add    %edx,%eax
  100f8e:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  100f91:	73 47                	jae    100fda <memmove+0x6e>
    s += n;
  100f93:	8b 45 10             	mov    0x10(%ebp),%eax
  100f96:	01 45 fc             	add    %eax,-0x4(%ebp)
    d += n;
  100f99:	8b 45 10             	mov    0x10(%ebp),%eax
  100f9c:	01 45 f8             	add    %eax,-0x8(%ebp)
    while(n-- > 0)
  100f9f:	eb 13                	jmp    100fb4 <memmove+0x48>
      *--d = *--s;
  100fa1:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  100fa5:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
  100fa9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100fac:	0f b6 10             	movzbl (%eax),%edx
  100faf:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100fb2:	88 10                	mov    %dl,(%eax)
    while(n-- > 0)
  100fb4:	8b 45 10             	mov    0x10(%ebp),%eax
  100fb7:	8d 50 ff             	lea    -0x1(%eax),%edx
  100fba:	89 55 10             	mov    %edx,0x10(%ebp)
  100fbd:	85 c0                	test   %eax,%eax
  100fbf:	75 e0                	jne    100fa1 <memmove+0x35>
  if(s < d && s + n > d){
  100fc1:	eb 24                	jmp    100fe7 <memmove+0x7b>
      *d++ = *s++;
  100fc3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100fc6:	8d 42 01             	lea    0x1(%edx),%eax
  100fc9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100fcc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100fcf:	8d 48 01             	lea    0x1(%eax),%ecx
  100fd2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  100fd5:	0f b6 12             	movzbl (%edx),%edx
  100fd8:	88 10                	mov    %dl,(%eax)
    while(n-- > 0)
  100fda:	8b 45 10             	mov    0x10(%ebp),%eax
  100fdd:	8d 50 ff             	lea    -0x1(%eax),%edx
  100fe0:	89 55 10             	mov    %edx,0x10(%ebp)
  100fe3:	85 c0                	test   %eax,%eax
  100fe5:	75 dc                	jne    100fc3 <memmove+0x57>
  return dst;
  100fe7:	8b 45 08             	mov    0x8(%ebp),%eax
}
  100fea:	c9                   	leave
  100feb:	c3                   	ret

00100fec <memcpy>:
{
  100fec:	55                   	push   %ebp
  100fed:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
  100fef:	ff 75 10             	push   0x10(%ebp)
  100ff2:	ff 75 0c             	push   0xc(%ebp)
  100ff5:	ff 75 08             	push   0x8(%ebp)
  100ff8:	e8 6f ff ff ff       	call   100f6c <memmove>
  100ffd:	83 c4 0c             	add    $0xc,%esp
}
  101000:	c9                   	leave
  101001:	c3                   	ret

00101002 <strncmp>:
strncmp(const char *p, const char *q, uint n)
{
  101002:	55                   	push   %ebp
  101003:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
  101005:	eb 0c                	jmp    101013 <strncmp+0x11>
    n--, p++, q++;
  101007:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10100b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10100f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(n > 0 && *p && *p == *q)
  101013:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  101017:	74 1a                	je     101033 <strncmp+0x31>
  101019:	8b 45 08             	mov    0x8(%ebp),%eax
  10101c:	0f b6 00             	movzbl (%eax),%eax
  10101f:	84 c0                	test   %al,%al
  101021:	74 10                	je     101033 <strncmp+0x31>
  101023:	8b 45 08             	mov    0x8(%ebp),%eax
  101026:	0f b6 10             	movzbl (%eax),%edx
  101029:	8b 45 0c             	mov    0xc(%ebp),%eax
  10102c:	0f b6 00             	movzbl (%eax),%eax
  10102f:	38 c2                	cmp    %al,%dl
  101031:	74 d4                	je     101007 <strncmp+0x5>
  if(n == 0)
  101033:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  101037:	75 07                	jne    101040 <strncmp+0x3e>
    return 0;
  101039:	ba 00 00 00 00       	mov    $0x0,%edx
  10103e:	eb 14                	jmp    101054 <strncmp+0x52>
  return (uchar)*p - (uchar)*q;
  101040:	8b 45 08             	mov    0x8(%ebp),%eax
  101043:	0f b6 00             	movzbl (%eax),%eax
  101046:	0f b6 d0             	movzbl %al,%edx
  101049:	8b 45 0c             	mov    0xc(%ebp),%eax
  10104c:	0f b6 00             	movzbl (%eax),%eax
  10104f:	0f b6 c0             	movzbl %al,%eax
  101052:	29 c2                	sub    %eax,%edx
}
  101054:	89 d0                	mov    %edx,%eax
  101056:	5d                   	pop    %ebp
  101057:	c3                   	ret

00101058 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
  101058:	55                   	push   %ebp
  101059:	89 e5                	mov    %esp,%ebp
  10105b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  10105e:	8b 45 08             	mov    0x8(%ebp),%eax
  101061:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
  101064:	90                   	nop
  101065:	8b 45 10             	mov    0x10(%ebp),%eax
  101068:	8d 50 ff             	lea    -0x1(%eax),%edx
  10106b:	89 55 10             	mov    %edx,0x10(%ebp)
  10106e:	85 c0                	test   %eax,%eax
  101070:	7e 2c                	jle    10109e <strncpy+0x46>
  101072:	8b 55 0c             	mov    0xc(%ebp),%edx
  101075:	8d 42 01             	lea    0x1(%edx),%eax
  101078:	89 45 0c             	mov    %eax,0xc(%ebp)
  10107b:	8b 45 08             	mov    0x8(%ebp),%eax
  10107e:	8d 48 01             	lea    0x1(%eax),%ecx
  101081:	89 4d 08             	mov    %ecx,0x8(%ebp)
  101084:	0f b6 12             	movzbl (%edx),%edx
  101087:	88 10                	mov    %dl,(%eax)
  101089:	0f b6 00             	movzbl (%eax),%eax
  10108c:	84 c0                	test   %al,%al
  10108e:	75 d5                	jne    101065 <strncpy+0xd>
    ;
  while(n-- > 0)
  101090:	eb 0c                	jmp    10109e <strncpy+0x46>
    *s++ = 0;
  101092:	8b 45 08             	mov    0x8(%ebp),%eax
  101095:	8d 50 01             	lea    0x1(%eax),%edx
  101098:	89 55 08             	mov    %edx,0x8(%ebp)
  10109b:	c6 00 00             	movb   $0x0,(%eax)
  while(n-- > 0)
  10109e:	8b 45 10             	mov    0x10(%ebp),%eax
  1010a1:	8d 50 ff             	lea    -0x1(%eax),%edx
  1010a4:	89 55 10             	mov    %edx,0x10(%ebp)
  1010a7:	85 c0                	test   %eax,%eax
  1010a9:	7f e7                	jg     101092 <strncpy+0x3a>
  return os;
  1010ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1010ae:	c9                   	leave
  1010af:	c3                   	ret

001010b0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
  1010b0:	55                   	push   %ebp
  1010b1:	89 e5                	mov    %esp,%ebp
  1010b3:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  1010b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1010b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  if(n <= 0)
  1010bc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1010c0:	7f 05                	jg     1010c7 <safestrcpy+0x17>
    return os;
  1010c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1010c5:	eb 32                	jmp    1010f9 <safestrcpy+0x49>
  while(--n > 0 && (*s++ = *t++) != 0)
  1010c7:	90                   	nop
  1010c8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1010cc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1010d0:	7e 1e                	jle    1010f0 <safestrcpy+0x40>
  1010d2:	8b 55 0c             	mov    0xc(%ebp),%edx
  1010d5:	8d 42 01             	lea    0x1(%edx),%eax
  1010d8:	89 45 0c             	mov    %eax,0xc(%ebp)
  1010db:	8b 45 08             	mov    0x8(%ebp),%eax
  1010de:	8d 48 01             	lea    0x1(%eax),%ecx
  1010e1:	89 4d 08             	mov    %ecx,0x8(%ebp)
  1010e4:	0f b6 12             	movzbl (%edx),%edx
  1010e7:	88 10                	mov    %dl,(%eax)
  1010e9:	0f b6 00             	movzbl (%eax),%eax
  1010ec:	84 c0                	test   %al,%al
  1010ee:	75 d8                	jne    1010c8 <safestrcpy+0x18>
    ;
  *s = 0;
  1010f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f3:	c6 00 00             	movb   $0x0,(%eax)
  return os;
  1010f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1010f9:	c9                   	leave
  1010fa:	c3                   	ret

001010fb <strlen>:

int
strlen(const char *s)
{
  1010fb:	55                   	push   %ebp
  1010fc:	89 e5                	mov    %esp,%ebp
  1010fe:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  101101:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101108:	eb 04                	jmp    10110e <strlen+0x13>
  10110a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10110e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101111:	8b 45 08             	mov    0x8(%ebp),%eax
  101114:	01 d0                	add    %edx,%eax
  101116:	0f b6 00             	movzbl (%eax),%eax
  101119:	84 c0                	test   %al,%al
  10111b:	75 ed                	jne    10110a <strlen+0xf>
    ;
  return n;
  10111d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101120:	c9                   	leave
  101121:	c3                   	ret

00101122 <readeflags>:
  101122:	55                   	push   %ebp
  101123:	89 e5                	mov    %esp,%ebp
  101125:	83 ec 10             	sub    $0x10,%esp
  101128:	9c                   	pushf
  101129:	58                   	pop    %eax
  10112a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10112d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101130:	c9                   	leave
  101131:	c3                   	ret

00101132 <cpuid>:
cpuid() {
  101132:	55                   	push   %ebp
  101133:	89 e5                	mov    %esp,%ebp
  101135:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
  101138:	e8 07 00 00 00       	call   101144 <mycpu>
  10113d:	2d b8 54 10 00       	sub    $0x1054b8,%eax
}
  101142:	c9                   	leave
  101143:	c3                   	ret

00101144 <mycpu>:
{
  101144:	55                   	push   %ebp
  101145:	89 e5                	mov    %esp,%ebp
  101147:	83 ec 18             	sub    $0x18,%esp
  if(readeflags()&FL_IF)
  10114a:	e8 d3 ff ff ff       	call   101122 <readeflags>
  10114f:	25 00 02 00 00       	and    $0x200,%eax
  101154:	85 c0                	test   %eax,%eax
  101156:	74 0d                	je     101165 <mycpu+0x21>
    panic("mycpu called with interrupts enabled\n");
  101158:	83 ec 0c             	sub    $0xc,%esp
  10115b:	68 e0 41 10 00       	push   $0x1041e0
  101160:	e8 49 f1 ff ff       	call   1002ae <panic>
  apicid = lapicid();
  101165:	e8 b6 f5 ff ff       	call   100720 <lapicid>
  10116a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for (i = 0; i < ncpu; ++i) {
  10116d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101174:	eb 21                	jmp    101197 <mycpu+0x53>
    if (cpus[i].apicid == apicid)
  101176:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101179:	05 b8 54 10 00       	add    $0x1054b8,%eax
  10117e:	0f b6 00             	movzbl (%eax),%eax
  101181:	0f b6 c0             	movzbl %al,%eax
  101184:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  101187:	75 0a                	jne    101193 <mycpu+0x4f>
      return &cpus[i];
  101189:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10118c:	05 b8 54 10 00       	add    $0x1054b8,%eax
  101191:	eb 1b                	jmp    1011ae <mycpu+0x6a>
  for (i = 0; i < ncpu; ++i) {
  101193:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101197:	a1 c0 54 10 00       	mov    0x1054c0,%eax
  10119c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  10119f:	7c d5                	jl     101176 <mycpu+0x32>
  panic("unknown apicid\n");
  1011a1:	83 ec 0c             	sub    $0xc,%esp
  1011a4:	68 06 42 10 00       	push   $0x104206
  1011a9:	e8 00 f1 ff ff       	call   1002ae <panic>
  1011ae:	c9                   	leave
  1011af:	c3                   	ret

001011b0 <getcallerpcs>:
// #include "memlayout.h"

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
  1011b0:	55                   	push   %ebp
  1011b1:	89 e5                	mov    %esp,%ebp
  1011b3:	83 ec 10             	sub    $0x10,%esp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  1011b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1011b9:	83 e8 08             	sub    $0x8,%eax
  1011bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  for(i = 0; i < 10; i++){
  1011bf:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1011c6:	eb 2f                	jmp    1011f7 <getcallerpcs+0x47>
    // if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
    if(ebp == 0 || ebp == (uint*)0xffffffff)
  1011c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1011cc:	74 4a                	je     101218 <getcallerpcs+0x68>
  1011ce:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  1011d2:	74 44                	je     101218 <getcallerpcs+0x68>
      break;
    pcs[i] = ebp[1];     // saved %eip
  1011d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1011d7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1011de:	8b 45 0c             	mov    0xc(%ebp),%eax
  1011e1:	01 c2                	add    %eax,%edx
  1011e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1011e6:	8b 40 04             	mov    0x4(%eax),%eax
  1011e9:	89 02                	mov    %eax,(%edx)
    ebp = (uint*)ebp[0]; // saved %ebp
  1011eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1011ee:	8b 00                	mov    (%eax),%eax
  1011f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  for(i = 0; i < 10; i++){
  1011f3:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1011f7:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
  1011fb:	7e cb                	jle    1011c8 <getcallerpcs+0x18>
  }
  for(; i < 10; i++)
  1011fd:	eb 19                	jmp    101218 <getcallerpcs+0x68>
    pcs[i] = 0;
  1011ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101202:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101209:	8b 45 0c             	mov    0xc(%ebp),%eax
  10120c:	01 d0                	add    %edx,%eax
  10120e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
  101214:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  101218:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
  10121c:	7e e1                	jle    1011ff <getcallerpcs+0x4f>
  10121e:	90                   	nop
  10121f:	90                   	nop
  101220:	c9                   	leave
  101221:	c3                   	ret

00101222 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushal
  101222:	60                   	pusha
  
  # Call trap(tf), where tf=%esp
  pushl %esp
  101223:	54                   	push   %esp
  call trap
  101224:	e8 41 01 00 00       	call   10136a <trap>
  addl $4, %esp
  101229:	83 c4 04             	add    $0x4,%esp

0010122c <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
  10122c:	61                   	popa
  addl $0x8, %esp  # trapno and errcode
  10122d:	83 c4 08             	add    $0x8,%esp
  iret
  101230:	cf                   	iret

00101231 <lidt>:
  101231:	55                   	push   %ebp
  101232:	89 e5                	mov    %esp,%ebp
  101234:	83 ec 10             	sub    $0x10,%esp
  101237:	8b 45 0c             	mov    0xc(%ebp),%eax
  10123a:	83 e8 01             	sub    $0x1,%eax
  10123d:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  101241:	8b 45 08             	mov    0x8(%ebp),%eax
  101244:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  101248:	8b 45 08             	mov    0x8(%ebp),%eax
  10124b:	c1 e8 10             	shr    $0x10,%eax
  10124e:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  101252:	8d 45 fa             	lea    -0x6(%ebp),%eax
  101255:	0f 01 18             	lidtl  (%eax)
  101258:	90                   	nop
  101259:	c9                   	leave
  10125a:	c3                   	ret

0010125b <rcr2>:
  10125b:	55                   	push   %ebp
  10125c:	89 e5                	mov    %esp,%ebp
  10125e:	83 ec 10             	sub    $0x10,%esp
  101261:	0f 20 d0             	mov    %cr2,%eax
  101264:	89 45 fc             	mov    %eax,-0x4(%ebp)
  101267:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10126a:	c9                   	leave
  10126b:	c3                   	ret

0010126c <tvinit>:
{
  10126c:	55                   	push   %ebp
  10126d:	89 e5                	mov    %esp,%ebp
  10126f:	83 ec 10             	sub    $0x10,%esp
  for(i = 0; i < 256; i++)
  101272:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101279:	e9 c3 00 00 00       	jmp    101341 <tvinit+0xd5>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  10127e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101281:	8b 04 85 11 50 10 00 	mov    0x105011(,%eax,4),%eax
  101288:	89 c2                	mov    %eax,%edx
  10128a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10128d:	66 89 14 c5 e0 54 10 	mov    %dx,0x1054e0(,%eax,8)
  101294:	00 
  101295:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101298:	66 c7 04 c5 e2 54 10 	movw   $0x8,0x1054e2(,%eax,8)
  10129f:	00 08 00 
  1012a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1012a5:	0f b6 14 c5 e4 54 10 	movzbl 0x1054e4(,%eax,8),%edx
  1012ac:	00 
  1012ad:	83 e2 e0             	and    $0xffffffe0,%edx
  1012b0:	88 14 c5 e4 54 10 00 	mov    %dl,0x1054e4(,%eax,8)
  1012b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1012ba:	0f b6 14 c5 e4 54 10 	movzbl 0x1054e4(,%eax,8),%edx
  1012c1:	00 
  1012c2:	83 e2 1f             	and    $0x1f,%edx
  1012c5:	88 14 c5 e4 54 10 00 	mov    %dl,0x1054e4(,%eax,8)
  1012cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1012cf:	0f b6 14 c5 e5 54 10 	movzbl 0x1054e5(,%eax,8),%edx
  1012d6:	00 
  1012d7:	83 e2 f0             	and    $0xfffffff0,%edx
  1012da:	83 ca 0e             	or     $0xe,%edx
  1012dd:	88 14 c5 e5 54 10 00 	mov    %dl,0x1054e5(,%eax,8)
  1012e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1012e7:	0f b6 14 c5 e5 54 10 	movzbl 0x1054e5(,%eax,8),%edx
  1012ee:	00 
  1012ef:	83 e2 ef             	and    $0xffffffef,%edx
  1012f2:	88 14 c5 e5 54 10 00 	mov    %dl,0x1054e5(,%eax,8)
  1012f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1012fc:	0f b6 14 c5 e5 54 10 	movzbl 0x1054e5(,%eax,8),%edx
  101303:	00 
  101304:	83 e2 9f             	and    $0xffffff9f,%edx
  101307:	88 14 c5 e5 54 10 00 	mov    %dl,0x1054e5(,%eax,8)
  10130e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101311:	0f b6 14 c5 e5 54 10 	movzbl 0x1054e5(,%eax,8),%edx
  101318:	00 
  101319:	83 ca 80             	or     $0xffffff80,%edx
  10131c:	88 14 c5 e5 54 10 00 	mov    %dl,0x1054e5(,%eax,8)
  101323:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101326:	8b 04 85 11 50 10 00 	mov    0x105011(,%eax,4),%eax
  10132d:	c1 e8 10             	shr    $0x10,%eax
  101330:	89 c2                	mov    %eax,%edx
  101332:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101335:	66 89 14 c5 e6 54 10 	mov    %dx,0x1054e6(,%eax,8)
  10133c:	00 
  for(i = 0; i < 256; i++)
  10133d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101341:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101348:	0f 8e 30 ff ff ff    	jle    10127e <tvinit+0x12>
}
  10134e:	90                   	nop
  10134f:	90                   	nop
  101350:	c9                   	leave
  101351:	c3                   	ret

00101352 <idtinit>:
{
  101352:	55                   	push   %ebp
  101353:	89 e5                	mov    %esp,%ebp
  lidt(idt, sizeof(idt));
  101355:	68 00 08 00 00       	push   $0x800
  10135a:	68 e0 54 10 00       	push   $0x1054e0
  10135f:	e8 cd fe ff ff       	call   101231 <lidt>
  101364:	83 c4 08             	add    $0x8,%esp
}
  101367:	90                   	nop
  101368:	c9                   	leave
  101369:	c3                   	ret

0010136a <trap>:
{
  10136a:	55                   	push   %ebp
  10136b:	89 e5                	mov    %esp,%ebp
  10136d:	56                   	push   %esi
  10136e:	53                   	push   %ebx
  switch(tf->trapno){
  10136f:	8b 45 08             	mov    0x8(%ebp),%eax
  101372:	8b 40 20             	mov    0x20(%eax),%eax
  101375:	83 e8 20             	sub    $0x20,%eax
  101378:	83 f8 1f             	cmp    $0x1f,%eax
  10137b:	77 61                	ja     1013de <trap+0x74>
  10137d:	8b 04 85 74 42 10 00 	mov    0x104274(,%eax,4),%eax
  101384:	ff e0                	jmp    *%eax
    ticks++;
  101386:	a1 e0 5c 10 00       	mov    0x105ce0,%eax
  10138b:	83 c0 01             	add    $0x1,%eax
  10138e:	a3 e0 5c 10 00       	mov    %eax,0x105ce0
    lapiceoi();
  101393:	e8 aa f3 ff ff       	call   100742 <lapiceoi>
    break;
  101398:	eb 7d                	jmp    101417 <trap+0xad>
    ideintr();
  10139a:	e8 ed 10 00 00       	call   10248c <ideintr>
    lapiceoi();
  10139f:	e8 9e f3 ff ff       	call   100742 <lapiceoi>
    break;
  1013a4:	eb 71                	jmp    101417 <trap+0xad>
    uartintr();
  1013a6:	e8 9d fa ff ff       	call   100e48 <uartintr>
    lapiceoi();
  1013ab:	e8 92 f3 ff ff       	call   100742 <lapiceoi>
    break;
  1013b0:	eb 65                	jmp    101417 <trap+0xad>
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
  1013b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1013b5:	8b 70 28             	mov    0x28(%eax),%esi
            cpuid(), tf->cs, tf->eip);
  1013b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1013bb:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
  1013bf:	0f b7 d8             	movzwl %ax,%ebx
  1013c2:	e8 6b fd ff ff       	call   101132 <cpuid>
  1013c7:	56                   	push   %esi
  1013c8:	53                   	push   %ebx
  1013c9:	50                   	push   %eax
  1013ca:	68 18 42 10 00       	push   $0x104218
  1013cf:	e8 18 ed ff ff       	call   1000ec <cprintf>
  1013d4:	83 c4 10             	add    $0x10,%esp
    lapiceoi();
  1013d7:	e8 66 f3 ff ff       	call   100742 <lapiceoi>
    break;
  1013dc:	eb 39                	jmp    101417 <trap+0xad>
    cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
  1013de:	e8 78 fe ff ff       	call   10125b <rcr2>
  1013e3:	89 c3                	mov    %eax,%ebx
  1013e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1013e8:	8b 70 28             	mov    0x28(%eax),%esi
  1013eb:	e8 42 fd ff ff       	call   101132 <cpuid>
  1013f0:	8b 55 08             	mov    0x8(%ebp),%edx
  1013f3:	8b 52 20             	mov    0x20(%edx),%edx
  1013f6:	83 ec 0c             	sub    $0xc,%esp
  1013f9:	53                   	push   %ebx
  1013fa:	56                   	push   %esi
  1013fb:	50                   	push   %eax
  1013fc:	52                   	push   %edx
  1013fd:	68 3c 42 10 00       	push   $0x10423c
  101402:	e8 e5 ec ff ff       	call   1000ec <cprintf>
  101407:	83 c4 20             	add    $0x20,%esp
    panic("trap");
  10140a:	83 ec 0c             	sub    $0xc,%esp
  10140d:	68 6e 42 10 00       	push   $0x10426e
  101412:	e8 97 ee ff ff       	call   1002ae <panic>
}
  101417:	90                   	nop
  101418:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10141b:	5b                   	pop    %ebx
  10141c:	5e                   	pop    %esi
  10141d:	5d                   	pop    %ebp
  10141e:	c3                   	ret

0010141f <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
  10141f:	6a 00                	push   $0x0
  pushl $0
  101421:	6a 00                	push   $0x0
  jmp alltraps
  101423:	e9 fa fd ff ff       	jmp    101222 <alltraps>

00101428 <vector1>:
.globl vector1
vector1:
  pushl $0
  101428:	6a 00                	push   $0x0
  pushl $1
  10142a:	6a 01                	push   $0x1
  jmp alltraps
  10142c:	e9 f1 fd ff ff       	jmp    101222 <alltraps>

00101431 <vector2>:
.globl vector2
vector2:
  pushl $0
  101431:	6a 00                	push   $0x0
  pushl $2
  101433:	6a 02                	push   $0x2
  jmp alltraps
  101435:	e9 e8 fd ff ff       	jmp    101222 <alltraps>

0010143a <vector3>:
.globl vector3
vector3:
  pushl $0
  10143a:	6a 00                	push   $0x0
  pushl $3
  10143c:	6a 03                	push   $0x3
  jmp alltraps
  10143e:	e9 df fd ff ff       	jmp    101222 <alltraps>

00101443 <vector4>:
.globl vector4
vector4:
  pushl $0
  101443:	6a 00                	push   $0x0
  pushl $4
  101445:	6a 04                	push   $0x4
  jmp alltraps
  101447:	e9 d6 fd ff ff       	jmp    101222 <alltraps>

0010144c <vector5>:
.globl vector5
vector5:
  pushl $0
  10144c:	6a 00                	push   $0x0
  pushl $5
  10144e:	6a 05                	push   $0x5
  jmp alltraps
  101450:	e9 cd fd ff ff       	jmp    101222 <alltraps>

00101455 <vector6>:
.globl vector6
vector6:
  pushl $0
  101455:	6a 00                	push   $0x0
  pushl $6
  101457:	6a 06                	push   $0x6
  jmp alltraps
  101459:	e9 c4 fd ff ff       	jmp    101222 <alltraps>

0010145e <vector7>:
.globl vector7
vector7:
  pushl $0
  10145e:	6a 00                	push   $0x0
  pushl $7
  101460:	6a 07                	push   $0x7
  jmp alltraps
  101462:	e9 bb fd ff ff       	jmp    101222 <alltraps>

00101467 <vector8>:
.globl vector8
vector8:
  pushl $8
  101467:	6a 08                	push   $0x8
  jmp alltraps
  101469:	e9 b4 fd ff ff       	jmp    101222 <alltraps>

0010146e <vector9>:
.globl vector9
vector9:
  pushl $0
  10146e:	6a 00                	push   $0x0
  pushl $9
  101470:	6a 09                	push   $0x9
  jmp alltraps
  101472:	e9 ab fd ff ff       	jmp    101222 <alltraps>

00101477 <vector10>:
.globl vector10
vector10:
  pushl $10
  101477:	6a 0a                	push   $0xa
  jmp alltraps
  101479:	e9 a4 fd ff ff       	jmp    101222 <alltraps>

0010147e <vector11>:
.globl vector11
vector11:
  pushl $11
  10147e:	6a 0b                	push   $0xb
  jmp alltraps
  101480:	e9 9d fd ff ff       	jmp    101222 <alltraps>

00101485 <vector12>:
.globl vector12
vector12:
  pushl $12
  101485:	6a 0c                	push   $0xc
  jmp alltraps
  101487:	e9 96 fd ff ff       	jmp    101222 <alltraps>

0010148c <vector13>:
.globl vector13
vector13:
  pushl $13
  10148c:	6a 0d                	push   $0xd
  jmp alltraps
  10148e:	e9 8f fd ff ff       	jmp    101222 <alltraps>

00101493 <vector14>:
.globl vector14
vector14:
  pushl $14
  101493:	6a 0e                	push   $0xe
  jmp alltraps
  101495:	e9 88 fd ff ff       	jmp    101222 <alltraps>

0010149a <vector15>:
.globl vector15
vector15:
  pushl $0
  10149a:	6a 00                	push   $0x0
  pushl $15
  10149c:	6a 0f                	push   $0xf
  jmp alltraps
  10149e:	e9 7f fd ff ff       	jmp    101222 <alltraps>

001014a3 <vector16>:
.globl vector16
vector16:
  pushl $0
  1014a3:	6a 00                	push   $0x0
  pushl $16
  1014a5:	6a 10                	push   $0x10
  jmp alltraps
  1014a7:	e9 76 fd ff ff       	jmp    101222 <alltraps>

001014ac <vector17>:
.globl vector17
vector17:
  pushl $17
  1014ac:	6a 11                	push   $0x11
  jmp alltraps
  1014ae:	e9 6f fd ff ff       	jmp    101222 <alltraps>

001014b3 <vector18>:
.globl vector18
vector18:
  pushl $0
  1014b3:	6a 00                	push   $0x0
  pushl $18
  1014b5:	6a 12                	push   $0x12
  jmp alltraps
  1014b7:	e9 66 fd ff ff       	jmp    101222 <alltraps>

001014bc <vector19>:
.globl vector19
vector19:
  pushl $0
  1014bc:	6a 00                	push   $0x0
  pushl $19
  1014be:	6a 13                	push   $0x13
  jmp alltraps
  1014c0:	e9 5d fd ff ff       	jmp    101222 <alltraps>

001014c5 <vector20>:
.globl vector20
vector20:
  pushl $0
  1014c5:	6a 00                	push   $0x0
  pushl $20
  1014c7:	6a 14                	push   $0x14
  jmp alltraps
  1014c9:	e9 54 fd ff ff       	jmp    101222 <alltraps>

001014ce <vector21>:
.globl vector21
vector21:
  pushl $0
  1014ce:	6a 00                	push   $0x0
  pushl $21
  1014d0:	6a 15                	push   $0x15
  jmp alltraps
  1014d2:	e9 4b fd ff ff       	jmp    101222 <alltraps>

001014d7 <vector22>:
.globl vector22
vector22:
  pushl $0
  1014d7:	6a 00                	push   $0x0
  pushl $22
  1014d9:	6a 16                	push   $0x16
  jmp alltraps
  1014db:	e9 42 fd ff ff       	jmp    101222 <alltraps>

001014e0 <vector23>:
.globl vector23
vector23:
  pushl $0
  1014e0:	6a 00                	push   $0x0
  pushl $23
  1014e2:	6a 17                	push   $0x17
  jmp alltraps
  1014e4:	e9 39 fd ff ff       	jmp    101222 <alltraps>

001014e9 <vector24>:
.globl vector24
vector24:
  pushl $0
  1014e9:	6a 00                	push   $0x0
  pushl $24
  1014eb:	6a 18                	push   $0x18
  jmp alltraps
  1014ed:	e9 30 fd ff ff       	jmp    101222 <alltraps>

001014f2 <vector25>:
.globl vector25
vector25:
  pushl $0
  1014f2:	6a 00                	push   $0x0
  pushl $25
  1014f4:	6a 19                	push   $0x19
  jmp alltraps
  1014f6:	e9 27 fd ff ff       	jmp    101222 <alltraps>

001014fb <vector26>:
.globl vector26
vector26:
  pushl $0
  1014fb:	6a 00                	push   $0x0
  pushl $26
  1014fd:	6a 1a                	push   $0x1a
  jmp alltraps
  1014ff:	e9 1e fd ff ff       	jmp    101222 <alltraps>

00101504 <vector27>:
.globl vector27
vector27:
  pushl $0
  101504:	6a 00                	push   $0x0
  pushl $27
  101506:	6a 1b                	push   $0x1b
  jmp alltraps
  101508:	e9 15 fd ff ff       	jmp    101222 <alltraps>

0010150d <vector28>:
.globl vector28
vector28:
  pushl $0
  10150d:	6a 00                	push   $0x0
  pushl $28
  10150f:	6a 1c                	push   $0x1c
  jmp alltraps
  101511:	e9 0c fd ff ff       	jmp    101222 <alltraps>

00101516 <vector29>:
.globl vector29
vector29:
  pushl $0
  101516:	6a 00                	push   $0x0
  pushl $29
  101518:	6a 1d                	push   $0x1d
  jmp alltraps
  10151a:	e9 03 fd ff ff       	jmp    101222 <alltraps>

0010151f <vector30>:
.globl vector30
vector30:
  pushl $0
  10151f:	6a 00                	push   $0x0
  pushl $30
  101521:	6a 1e                	push   $0x1e
  jmp alltraps
  101523:	e9 fa fc ff ff       	jmp    101222 <alltraps>

00101528 <vector31>:
.globl vector31
vector31:
  pushl $0
  101528:	6a 00                	push   $0x0
  pushl $31
  10152a:	6a 1f                	push   $0x1f
  jmp alltraps
  10152c:	e9 f1 fc ff ff       	jmp    101222 <alltraps>

00101531 <vector32>:
.globl vector32
vector32:
  pushl $0
  101531:	6a 00                	push   $0x0
  pushl $32
  101533:	6a 20                	push   $0x20
  jmp alltraps
  101535:	e9 e8 fc ff ff       	jmp    101222 <alltraps>

0010153a <vector33>:
.globl vector33
vector33:
  pushl $0
  10153a:	6a 00                	push   $0x0
  pushl $33
  10153c:	6a 21                	push   $0x21
  jmp alltraps
  10153e:	e9 df fc ff ff       	jmp    101222 <alltraps>

00101543 <vector34>:
.globl vector34
vector34:
  pushl $0
  101543:	6a 00                	push   $0x0
  pushl $34
  101545:	6a 22                	push   $0x22
  jmp alltraps
  101547:	e9 d6 fc ff ff       	jmp    101222 <alltraps>

0010154c <vector35>:
.globl vector35
vector35:
  pushl $0
  10154c:	6a 00                	push   $0x0
  pushl $35
  10154e:	6a 23                	push   $0x23
  jmp alltraps
  101550:	e9 cd fc ff ff       	jmp    101222 <alltraps>

00101555 <vector36>:
.globl vector36
vector36:
  pushl $0
  101555:	6a 00                	push   $0x0
  pushl $36
  101557:	6a 24                	push   $0x24
  jmp alltraps
  101559:	e9 c4 fc ff ff       	jmp    101222 <alltraps>

0010155e <vector37>:
.globl vector37
vector37:
  pushl $0
  10155e:	6a 00                	push   $0x0
  pushl $37
  101560:	6a 25                	push   $0x25
  jmp alltraps
  101562:	e9 bb fc ff ff       	jmp    101222 <alltraps>

00101567 <vector38>:
.globl vector38
vector38:
  pushl $0
  101567:	6a 00                	push   $0x0
  pushl $38
  101569:	6a 26                	push   $0x26
  jmp alltraps
  10156b:	e9 b2 fc ff ff       	jmp    101222 <alltraps>

00101570 <vector39>:
.globl vector39
vector39:
  pushl $0
  101570:	6a 00                	push   $0x0
  pushl $39
  101572:	6a 27                	push   $0x27
  jmp alltraps
  101574:	e9 a9 fc ff ff       	jmp    101222 <alltraps>

00101579 <vector40>:
.globl vector40
vector40:
  pushl $0
  101579:	6a 00                	push   $0x0
  pushl $40
  10157b:	6a 28                	push   $0x28
  jmp alltraps
  10157d:	e9 a0 fc ff ff       	jmp    101222 <alltraps>

00101582 <vector41>:
.globl vector41
vector41:
  pushl $0
  101582:	6a 00                	push   $0x0
  pushl $41
  101584:	6a 29                	push   $0x29
  jmp alltraps
  101586:	e9 97 fc ff ff       	jmp    101222 <alltraps>

0010158b <vector42>:
.globl vector42
vector42:
  pushl $0
  10158b:	6a 00                	push   $0x0
  pushl $42
  10158d:	6a 2a                	push   $0x2a
  jmp alltraps
  10158f:	e9 8e fc ff ff       	jmp    101222 <alltraps>

00101594 <vector43>:
.globl vector43
vector43:
  pushl $0
  101594:	6a 00                	push   $0x0
  pushl $43
  101596:	6a 2b                	push   $0x2b
  jmp alltraps
  101598:	e9 85 fc ff ff       	jmp    101222 <alltraps>

0010159d <vector44>:
.globl vector44
vector44:
  pushl $0
  10159d:	6a 00                	push   $0x0
  pushl $44
  10159f:	6a 2c                	push   $0x2c
  jmp alltraps
  1015a1:	e9 7c fc ff ff       	jmp    101222 <alltraps>

001015a6 <vector45>:
.globl vector45
vector45:
  pushl $0
  1015a6:	6a 00                	push   $0x0
  pushl $45
  1015a8:	6a 2d                	push   $0x2d
  jmp alltraps
  1015aa:	e9 73 fc ff ff       	jmp    101222 <alltraps>

001015af <vector46>:
.globl vector46
vector46:
  pushl $0
  1015af:	6a 00                	push   $0x0
  pushl $46
  1015b1:	6a 2e                	push   $0x2e
  jmp alltraps
  1015b3:	e9 6a fc ff ff       	jmp    101222 <alltraps>

001015b8 <vector47>:
.globl vector47
vector47:
  pushl $0
  1015b8:	6a 00                	push   $0x0
  pushl $47
  1015ba:	6a 2f                	push   $0x2f
  jmp alltraps
  1015bc:	e9 61 fc ff ff       	jmp    101222 <alltraps>

001015c1 <vector48>:
.globl vector48
vector48:
  pushl $0
  1015c1:	6a 00                	push   $0x0
  pushl $48
  1015c3:	6a 30                	push   $0x30
  jmp alltraps
  1015c5:	e9 58 fc ff ff       	jmp    101222 <alltraps>

001015ca <vector49>:
.globl vector49
vector49:
  pushl $0
  1015ca:	6a 00                	push   $0x0
  pushl $49
  1015cc:	6a 31                	push   $0x31
  jmp alltraps
  1015ce:	e9 4f fc ff ff       	jmp    101222 <alltraps>

001015d3 <vector50>:
.globl vector50
vector50:
  pushl $0
  1015d3:	6a 00                	push   $0x0
  pushl $50
  1015d5:	6a 32                	push   $0x32
  jmp alltraps
  1015d7:	e9 46 fc ff ff       	jmp    101222 <alltraps>

001015dc <vector51>:
.globl vector51
vector51:
  pushl $0
  1015dc:	6a 00                	push   $0x0
  pushl $51
  1015de:	6a 33                	push   $0x33
  jmp alltraps
  1015e0:	e9 3d fc ff ff       	jmp    101222 <alltraps>

001015e5 <vector52>:
.globl vector52
vector52:
  pushl $0
  1015e5:	6a 00                	push   $0x0
  pushl $52
  1015e7:	6a 34                	push   $0x34
  jmp alltraps
  1015e9:	e9 34 fc ff ff       	jmp    101222 <alltraps>

001015ee <vector53>:
.globl vector53
vector53:
  pushl $0
  1015ee:	6a 00                	push   $0x0
  pushl $53
  1015f0:	6a 35                	push   $0x35
  jmp alltraps
  1015f2:	e9 2b fc ff ff       	jmp    101222 <alltraps>

001015f7 <vector54>:
.globl vector54
vector54:
  pushl $0
  1015f7:	6a 00                	push   $0x0
  pushl $54
  1015f9:	6a 36                	push   $0x36
  jmp alltraps
  1015fb:	e9 22 fc ff ff       	jmp    101222 <alltraps>

00101600 <vector55>:
.globl vector55
vector55:
  pushl $0
  101600:	6a 00                	push   $0x0
  pushl $55
  101602:	6a 37                	push   $0x37
  jmp alltraps
  101604:	e9 19 fc ff ff       	jmp    101222 <alltraps>

00101609 <vector56>:
.globl vector56
vector56:
  pushl $0
  101609:	6a 00                	push   $0x0
  pushl $56
  10160b:	6a 38                	push   $0x38
  jmp alltraps
  10160d:	e9 10 fc ff ff       	jmp    101222 <alltraps>

00101612 <vector57>:
.globl vector57
vector57:
  pushl $0
  101612:	6a 00                	push   $0x0
  pushl $57
  101614:	6a 39                	push   $0x39
  jmp alltraps
  101616:	e9 07 fc ff ff       	jmp    101222 <alltraps>

0010161b <vector58>:
.globl vector58
vector58:
  pushl $0
  10161b:	6a 00                	push   $0x0
  pushl $58
  10161d:	6a 3a                	push   $0x3a
  jmp alltraps
  10161f:	e9 fe fb ff ff       	jmp    101222 <alltraps>

00101624 <vector59>:
.globl vector59
vector59:
  pushl $0
  101624:	6a 00                	push   $0x0
  pushl $59
  101626:	6a 3b                	push   $0x3b
  jmp alltraps
  101628:	e9 f5 fb ff ff       	jmp    101222 <alltraps>

0010162d <vector60>:
.globl vector60
vector60:
  pushl $0
  10162d:	6a 00                	push   $0x0
  pushl $60
  10162f:	6a 3c                	push   $0x3c
  jmp alltraps
  101631:	e9 ec fb ff ff       	jmp    101222 <alltraps>

00101636 <vector61>:
.globl vector61
vector61:
  pushl $0
  101636:	6a 00                	push   $0x0
  pushl $61
  101638:	6a 3d                	push   $0x3d
  jmp alltraps
  10163a:	e9 e3 fb ff ff       	jmp    101222 <alltraps>

0010163f <vector62>:
.globl vector62
vector62:
  pushl $0
  10163f:	6a 00                	push   $0x0
  pushl $62
  101641:	6a 3e                	push   $0x3e
  jmp alltraps
  101643:	e9 da fb ff ff       	jmp    101222 <alltraps>

00101648 <vector63>:
.globl vector63
vector63:
  pushl $0
  101648:	6a 00                	push   $0x0
  pushl $63
  10164a:	6a 3f                	push   $0x3f
  jmp alltraps
  10164c:	e9 d1 fb ff ff       	jmp    101222 <alltraps>

00101651 <vector64>:
.globl vector64
vector64:
  pushl $0
  101651:	6a 00                	push   $0x0
  pushl $64
  101653:	6a 40                	push   $0x40
  jmp alltraps
  101655:	e9 c8 fb ff ff       	jmp    101222 <alltraps>

0010165a <vector65>:
.globl vector65
vector65:
  pushl $0
  10165a:	6a 00                	push   $0x0
  pushl $65
  10165c:	6a 41                	push   $0x41
  jmp alltraps
  10165e:	e9 bf fb ff ff       	jmp    101222 <alltraps>

00101663 <vector66>:
.globl vector66
vector66:
  pushl $0
  101663:	6a 00                	push   $0x0
  pushl $66
  101665:	6a 42                	push   $0x42
  jmp alltraps
  101667:	e9 b6 fb ff ff       	jmp    101222 <alltraps>

0010166c <vector67>:
.globl vector67
vector67:
  pushl $0
  10166c:	6a 00                	push   $0x0
  pushl $67
  10166e:	6a 43                	push   $0x43
  jmp alltraps
  101670:	e9 ad fb ff ff       	jmp    101222 <alltraps>

00101675 <vector68>:
.globl vector68
vector68:
  pushl $0
  101675:	6a 00                	push   $0x0
  pushl $68
  101677:	6a 44                	push   $0x44
  jmp alltraps
  101679:	e9 a4 fb ff ff       	jmp    101222 <alltraps>

0010167e <vector69>:
.globl vector69
vector69:
  pushl $0
  10167e:	6a 00                	push   $0x0
  pushl $69
  101680:	6a 45                	push   $0x45
  jmp alltraps
  101682:	e9 9b fb ff ff       	jmp    101222 <alltraps>

00101687 <vector70>:
.globl vector70
vector70:
  pushl $0
  101687:	6a 00                	push   $0x0
  pushl $70
  101689:	6a 46                	push   $0x46
  jmp alltraps
  10168b:	e9 92 fb ff ff       	jmp    101222 <alltraps>

00101690 <vector71>:
.globl vector71
vector71:
  pushl $0
  101690:	6a 00                	push   $0x0
  pushl $71
  101692:	6a 47                	push   $0x47
  jmp alltraps
  101694:	e9 89 fb ff ff       	jmp    101222 <alltraps>

00101699 <vector72>:
.globl vector72
vector72:
  pushl $0
  101699:	6a 00                	push   $0x0
  pushl $72
  10169b:	6a 48                	push   $0x48
  jmp alltraps
  10169d:	e9 80 fb ff ff       	jmp    101222 <alltraps>

001016a2 <vector73>:
.globl vector73
vector73:
  pushl $0
  1016a2:	6a 00                	push   $0x0
  pushl $73
  1016a4:	6a 49                	push   $0x49
  jmp alltraps
  1016a6:	e9 77 fb ff ff       	jmp    101222 <alltraps>

001016ab <vector74>:
.globl vector74
vector74:
  pushl $0
  1016ab:	6a 00                	push   $0x0
  pushl $74
  1016ad:	6a 4a                	push   $0x4a
  jmp alltraps
  1016af:	e9 6e fb ff ff       	jmp    101222 <alltraps>

001016b4 <vector75>:
.globl vector75
vector75:
  pushl $0
  1016b4:	6a 00                	push   $0x0
  pushl $75
  1016b6:	6a 4b                	push   $0x4b
  jmp alltraps
  1016b8:	e9 65 fb ff ff       	jmp    101222 <alltraps>

001016bd <vector76>:
.globl vector76
vector76:
  pushl $0
  1016bd:	6a 00                	push   $0x0
  pushl $76
  1016bf:	6a 4c                	push   $0x4c
  jmp alltraps
  1016c1:	e9 5c fb ff ff       	jmp    101222 <alltraps>

001016c6 <vector77>:
.globl vector77
vector77:
  pushl $0
  1016c6:	6a 00                	push   $0x0
  pushl $77
  1016c8:	6a 4d                	push   $0x4d
  jmp alltraps
  1016ca:	e9 53 fb ff ff       	jmp    101222 <alltraps>

001016cf <vector78>:
.globl vector78
vector78:
  pushl $0
  1016cf:	6a 00                	push   $0x0
  pushl $78
  1016d1:	6a 4e                	push   $0x4e
  jmp alltraps
  1016d3:	e9 4a fb ff ff       	jmp    101222 <alltraps>

001016d8 <vector79>:
.globl vector79
vector79:
  pushl $0
  1016d8:	6a 00                	push   $0x0
  pushl $79
  1016da:	6a 4f                	push   $0x4f
  jmp alltraps
  1016dc:	e9 41 fb ff ff       	jmp    101222 <alltraps>

001016e1 <vector80>:
.globl vector80
vector80:
  pushl $0
  1016e1:	6a 00                	push   $0x0
  pushl $80
  1016e3:	6a 50                	push   $0x50
  jmp alltraps
  1016e5:	e9 38 fb ff ff       	jmp    101222 <alltraps>

001016ea <vector81>:
.globl vector81
vector81:
  pushl $0
  1016ea:	6a 00                	push   $0x0
  pushl $81
  1016ec:	6a 51                	push   $0x51
  jmp alltraps
  1016ee:	e9 2f fb ff ff       	jmp    101222 <alltraps>

001016f3 <vector82>:
.globl vector82
vector82:
  pushl $0
  1016f3:	6a 00                	push   $0x0
  pushl $82
  1016f5:	6a 52                	push   $0x52
  jmp alltraps
  1016f7:	e9 26 fb ff ff       	jmp    101222 <alltraps>

001016fc <vector83>:
.globl vector83
vector83:
  pushl $0
  1016fc:	6a 00                	push   $0x0
  pushl $83
  1016fe:	6a 53                	push   $0x53
  jmp alltraps
  101700:	e9 1d fb ff ff       	jmp    101222 <alltraps>

00101705 <vector84>:
.globl vector84
vector84:
  pushl $0
  101705:	6a 00                	push   $0x0
  pushl $84
  101707:	6a 54                	push   $0x54
  jmp alltraps
  101709:	e9 14 fb ff ff       	jmp    101222 <alltraps>

0010170e <vector85>:
.globl vector85
vector85:
  pushl $0
  10170e:	6a 00                	push   $0x0
  pushl $85
  101710:	6a 55                	push   $0x55
  jmp alltraps
  101712:	e9 0b fb ff ff       	jmp    101222 <alltraps>

00101717 <vector86>:
.globl vector86
vector86:
  pushl $0
  101717:	6a 00                	push   $0x0
  pushl $86
  101719:	6a 56                	push   $0x56
  jmp alltraps
  10171b:	e9 02 fb ff ff       	jmp    101222 <alltraps>

00101720 <vector87>:
.globl vector87
vector87:
  pushl $0
  101720:	6a 00                	push   $0x0
  pushl $87
  101722:	6a 57                	push   $0x57
  jmp alltraps
  101724:	e9 f9 fa ff ff       	jmp    101222 <alltraps>

00101729 <vector88>:
.globl vector88
vector88:
  pushl $0
  101729:	6a 00                	push   $0x0
  pushl $88
  10172b:	6a 58                	push   $0x58
  jmp alltraps
  10172d:	e9 f0 fa ff ff       	jmp    101222 <alltraps>

00101732 <vector89>:
.globl vector89
vector89:
  pushl $0
  101732:	6a 00                	push   $0x0
  pushl $89
  101734:	6a 59                	push   $0x59
  jmp alltraps
  101736:	e9 e7 fa ff ff       	jmp    101222 <alltraps>

0010173b <vector90>:
.globl vector90
vector90:
  pushl $0
  10173b:	6a 00                	push   $0x0
  pushl $90
  10173d:	6a 5a                	push   $0x5a
  jmp alltraps
  10173f:	e9 de fa ff ff       	jmp    101222 <alltraps>

00101744 <vector91>:
.globl vector91
vector91:
  pushl $0
  101744:	6a 00                	push   $0x0
  pushl $91
  101746:	6a 5b                	push   $0x5b
  jmp alltraps
  101748:	e9 d5 fa ff ff       	jmp    101222 <alltraps>

0010174d <vector92>:
.globl vector92
vector92:
  pushl $0
  10174d:	6a 00                	push   $0x0
  pushl $92
  10174f:	6a 5c                	push   $0x5c
  jmp alltraps
  101751:	e9 cc fa ff ff       	jmp    101222 <alltraps>

00101756 <vector93>:
.globl vector93
vector93:
  pushl $0
  101756:	6a 00                	push   $0x0
  pushl $93
  101758:	6a 5d                	push   $0x5d
  jmp alltraps
  10175a:	e9 c3 fa ff ff       	jmp    101222 <alltraps>

0010175f <vector94>:
.globl vector94
vector94:
  pushl $0
  10175f:	6a 00                	push   $0x0
  pushl $94
  101761:	6a 5e                	push   $0x5e
  jmp alltraps
  101763:	e9 ba fa ff ff       	jmp    101222 <alltraps>

00101768 <vector95>:
.globl vector95
vector95:
  pushl $0
  101768:	6a 00                	push   $0x0
  pushl $95
  10176a:	6a 5f                	push   $0x5f
  jmp alltraps
  10176c:	e9 b1 fa ff ff       	jmp    101222 <alltraps>

00101771 <vector96>:
.globl vector96
vector96:
  pushl $0
  101771:	6a 00                	push   $0x0
  pushl $96
  101773:	6a 60                	push   $0x60
  jmp alltraps
  101775:	e9 a8 fa ff ff       	jmp    101222 <alltraps>

0010177a <vector97>:
.globl vector97
vector97:
  pushl $0
  10177a:	6a 00                	push   $0x0
  pushl $97
  10177c:	6a 61                	push   $0x61
  jmp alltraps
  10177e:	e9 9f fa ff ff       	jmp    101222 <alltraps>

00101783 <vector98>:
.globl vector98
vector98:
  pushl $0
  101783:	6a 00                	push   $0x0
  pushl $98
  101785:	6a 62                	push   $0x62
  jmp alltraps
  101787:	e9 96 fa ff ff       	jmp    101222 <alltraps>

0010178c <vector99>:
.globl vector99
vector99:
  pushl $0
  10178c:	6a 00                	push   $0x0
  pushl $99
  10178e:	6a 63                	push   $0x63
  jmp alltraps
  101790:	e9 8d fa ff ff       	jmp    101222 <alltraps>

00101795 <vector100>:
.globl vector100
vector100:
  pushl $0
  101795:	6a 00                	push   $0x0
  pushl $100
  101797:	6a 64                	push   $0x64
  jmp alltraps
  101799:	e9 84 fa ff ff       	jmp    101222 <alltraps>

0010179e <vector101>:
.globl vector101
vector101:
  pushl $0
  10179e:	6a 00                	push   $0x0
  pushl $101
  1017a0:	6a 65                	push   $0x65
  jmp alltraps
  1017a2:	e9 7b fa ff ff       	jmp    101222 <alltraps>

001017a7 <vector102>:
.globl vector102
vector102:
  pushl $0
  1017a7:	6a 00                	push   $0x0
  pushl $102
  1017a9:	6a 66                	push   $0x66
  jmp alltraps
  1017ab:	e9 72 fa ff ff       	jmp    101222 <alltraps>

001017b0 <vector103>:
.globl vector103
vector103:
  pushl $0
  1017b0:	6a 00                	push   $0x0
  pushl $103
  1017b2:	6a 67                	push   $0x67
  jmp alltraps
  1017b4:	e9 69 fa ff ff       	jmp    101222 <alltraps>

001017b9 <vector104>:
.globl vector104
vector104:
  pushl $0
  1017b9:	6a 00                	push   $0x0
  pushl $104
  1017bb:	6a 68                	push   $0x68
  jmp alltraps
  1017bd:	e9 60 fa ff ff       	jmp    101222 <alltraps>

001017c2 <vector105>:
.globl vector105
vector105:
  pushl $0
  1017c2:	6a 00                	push   $0x0
  pushl $105
  1017c4:	6a 69                	push   $0x69
  jmp alltraps
  1017c6:	e9 57 fa ff ff       	jmp    101222 <alltraps>

001017cb <vector106>:
.globl vector106
vector106:
  pushl $0
  1017cb:	6a 00                	push   $0x0
  pushl $106
  1017cd:	6a 6a                	push   $0x6a
  jmp alltraps
  1017cf:	e9 4e fa ff ff       	jmp    101222 <alltraps>

001017d4 <vector107>:
.globl vector107
vector107:
  pushl $0
  1017d4:	6a 00                	push   $0x0
  pushl $107
  1017d6:	6a 6b                	push   $0x6b
  jmp alltraps
  1017d8:	e9 45 fa ff ff       	jmp    101222 <alltraps>

001017dd <vector108>:
.globl vector108
vector108:
  pushl $0
  1017dd:	6a 00                	push   $0x0
  pushl $108
  1017df:	6a 6c                	push   $0x6c
  jmp alltraps
  1017e1:	e9 3c fa ff ff       	jmp    101222 <alltraps>

001017e6 <vector109>:
.globl vector109
vector109:
  pushl $0
  1017e6:	6a 00                	push   $0x0
  pushl $109
  1017e8:	6a 6d                	push   $0x6d
  jmp alltraps
  1017ea:	e9 33 fa ff ff       	jmp    101222 <alltraps>

001017ef <vector110>:
.globl vector110
vector110:
  pushl $0
  1017ef:	6a 00                	push   $0x0
  pushl $110
  1017f1:	6a 6e                	push   $0x6e
  jmp alltraps
  1017f3:	e9 2a fa ff ff       	jmp    101222 <alltraps>

001017f8 <vector111>:
.globl vector111
vector111:
  pushl $0
  1017f8:	6a 00                	push   $0x0
  pushl $111
  1017fa:	6a 6f                	push   $0x6f
  jmp alltraps
  1017fc:	e9 21 fa ff ff       	jmp    101222 <alltraps>

00101801 <vector112>:
.globl vector112
vector112:
  pushl $0
  101801:	6a 00                	push   $0x0
  pushl $112
  101803:	6a 70                	push   $0x70
  jmp alltraps
  101805:	e9 18 fa ff ff       	jmp    101222 <alltraps>

0010180a <vector113>:
.globl vector113
vector113:
  pushl $0
  10180a:	6a 00                	push   $0x0
  pushl $113
  10180c:	6a 71                	push   $0x71
  jmp alltraps
  10180e:	e9 0f fa ff ff       	jmp    101222 <alltraps>

00101813 <vector114>:
.globl vector114
vector114:
  pushl $0
  101813:	6a 00                	push   $0x0
  pushl $114
  101815:	6a 72                	push   $0x72
  jmp alltraps
  101817:	e9 06 fa ff ff       	jmp    101222 <alltraps>

0010181c <vector115>:
.globl vector115
vector115:
  pushl $0
  10181c:	6a 00                	push   $0x0
  pushl $115
  10181e:	6a 73                	push   $0x73
  jmp alltraps
  101820:	e9 fd f9 ff ff       	jmp    101222 <alltraps>

00101825 <vector116>:
.globl vector116
vector116:
  pushl $0
  101825:	6a 00                	push   $0x0
  pushl $116
  101827:	6a 74                	push   $0x74
  jmp alltraps
  101829:	e9 f4 f9 ff ff       	jmp    101222 <alltraps>

0010182e <vector117>:
.globl vector117
vector117:
  pushl $0
  10182e:	6a 00                	push   $0x0
  pushl $117
  101830:	6a 75                	push   $0x75
  jmp alltraps
  101832:	e9 eb f9 ff ff       	jmp    101222 <alltraps>

00101837 <vector118>:
.globl vector118
vector118:
  pushl $0
  101837:	6a 00                	push   $0x0
  pushl $118
  101839:	6a 76                	push   $0x76
  jmp alltraps
  10183b:	e9 e2 f9 ff ff       	jmp    101222 <alltraps>

00101840 <vector119>:
.globl vector119
vector119:
  pushl $0
  101840:	6a 00                	push   $0x0
  pushl $119
  101842:	6a 77                	push   $0x77
  jmp alltraps
  101844:	e9 d9 f9 ff ff       	jmp    101222 <alltraps>

00101849 <vector120>:
.globl vector120
vector120:
  pushl $0
  101849:	6a 00                	push   $0x0
  pushl $120
  10184b:	6a 78                	push   $0x78
  jmp alltraps
  10184d:	e9 d0 f9 ff ff       	jmp    101222 <alltraps>

00101852 <vector121>:
.globl vector121
vector121:
  pushl $0
  101852:	6a 00                	push   $0x0
  pushl $121
  101854:	6a 79                	push   $0x79
  jmp alltraps
  101856:	e9 c7 f9 ff ff       	jmp    101222 <alltraps>

0010185b <vector122>:
.globl vector122
vector122:
  pushl $0
  10185b:	6a 00                	push   $0x0
  pushl $122
  10185d:	6a 7a                	push   $0x7a
  jmp alltraps
  10185f:	e9 be f9 ff ff       	jmp    101222 <alltraps>

00101864 <vector123>:
.globl vector123
vector123:
  pushl $0
  101864:	6a 00                	push   $0x0
  pushl $123
  101866:	6a 7b                	push   $0x7b
  jmp alltraps
  101868:	e9 b5 f9 ff ff       	jmp    101222 <alltraps>

0010186d <vector124>:
.globl vector124
vector124:
  pushl $0
  10186d:	6a 00                	push   $0x0
  pushl $124
  10186f:	6a 7c                	push   $0x7c
  jmp alltraps
  101871:	e9 ac f9 ff ff       	jmp    101222 <alltraps>

00101876 <vector125>:
.globl vector125
vector125:
  pushl $0
  101876:	6a 00                	push   $0x0
  pushl $125
  101878:	6a 7d                	push   $0x7d
  jmp alltraps
  10187a:	e9 a3 f9 ff ff       	jmp    101222 <alltraps>

0010187f <vector126>:
.globl vector126
vector126:
  pushl $0
  10187f:	6a 00                	push   $0x0
  pushl $126
  101881:	6a 7e                	push   $0x7e
  jmp alltraps
  101883:	e9 9a f9 ff ff       	jmp    101222 <alltraps>

00101888 <vector127>:
.globl vector127
vector127:
  pushl $0
  101888:	6a 00                	push   $0x0
  pushl $127
  10188a:	6a 7f                	push   $0x7f
  jmp alltraps
  10188c:	e9 91 f9 ff ff       	jmp    101222 <alltraps>

00101891 <vector128>:
.globl vector128
vector128:
  pushl $0
  101891:	6a 00                	push   $0x0
  pushl $128
  101893:	68 80 00 00 00       	push   $0x80
  jmp alltraps
  101898:	e9 85 f9 ff ff       	jmp    101222 <alltraps>

0010189d <vector129>:
.globl vector129
vector129:
  pushl $0
  10189d:	6a 00                	push   $0x0
  pushl $129
  10189f:	68 81 00 00 00       	push   $0x81
  jmp alltraps
  1018a4:	e9 79 f9 ff ff       	jmp    101222 <alltraps>

001018a9 <vector130>:
.globl vector130
vector130:
  pushl $0
  1018a9:	6a 00                	push   $0x0
  pushl $130
  1018ab:	68 82 00 00 00       	push   $0x82
  jmp alltraps
  1018b0:	e9 6d f9 ff ff       	jmp    101222 <alltraps>

001018b5 <vector131>:
.globl vector131
vector131:
  pushl $0
  1018b5:	6a 00                	push   $0x0
  pushl $131
  1018b7:	68 83 00 00 00       	push   $0x83
  jmp alltraps
  1018bc:	e9 61 f9 ff ff       	jmp    101222 <alltraps>

001018c1 <vector132>:
.globl vector132
vector132:
  pushl $0
  1018c1:	6a 00                	push   $0x0
  pushl $132
  1018c3:	68 84 00 00 00       	push   $0x84
  jmp alltraps
  1018c8:	e9 55 f9 ff ff       	jmp    101222 <alltraps>

001018cd <vector133>:
.globl vector133
vector133:
  pushl $0
  1018cd:	6a 00                	push   $0x0
  pushl $133
  1018cf:	68 85 00 00 00       	push   $0x85
  jmp alltraps
  1018d4:	e9 49 f9 ff ff       	jmp    101222 <alltraps>

001018d9 <vector134>:
.globl vector134
vector134:
  pushl $0
  1018d9:	6a 00                	push   $0x0
  pushl $134
  1018db:	68 86 00 00 00       	push   $0x86
  jmp alltraps
  1018e0:	e9 3d f9 ff ff       	jmp    101222 <alltraps>

001018e5 <vector135>:
.globl vector135
vector135:
  pushl $0
  1018e5:	6a 00                	push   $0x0
  pushl $135
  1018e7:	68 87 00 00 00       	push   $0x87
  jmp alltraps
  1018ec:	e9 31 f9 ff ff       	jmp    101222 <alltraps>

001018f1 <vector136>:
.globl vector136
vector136:
  pushl $0
  1018f1:	6a 00                	push   $0x0
  pushl $136
  1018f3:	68 88 00 00 00       	push   $0x88
  jmp alltraps
  1018f8:	e9 25 f9 ff ff       	jmp    101222 <alltraps>

001018fd <vector137>:
.globl vector137
vector137:
  pushl $0
  1018fd:	6a 00                	push   $0x0
  pushl $137
  1018ff:	68 89 00 00 00       	push   $0x89
  jmp alltraps
  101904:	e9 19 f9 ff ff       	jmp    101222 <alltraps>

00101909 <vector138>:
.globl vector138
vector138:
  pushl $0
  101909:	6a 00                	push   $0x0
  pushl $138
  10190b:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
  101910:	e9 0d f9 ff ff       	jmp    101222 <alltraps>

00101915 <vector139>:
.globl vector139
vector139:
  pushl $0
  101915:	6a 00                	push   $0x0
  pushl $139
  101917:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
  10191c:	e9 01 f9 ff ff       	jmp    101222 <alltraps>

00101921 <vector140>:
.globl vector140
vector140:
  pushl $0
  101921:	6a 00                	push   $0x0
  pushl $140
  101923:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
  101928:	e9 f5 f8 ff ff       	jmp    101222 <alltraps>

0010192d <vector141>:
.globl vector141
vector141:
  pushl $0
  10192d:	6a 00                	push   $0x0
  pushl $141
  10192f:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
  101934:	e9 e9 f8 ff ff       	jmp    101222 <alltraps>

00101939 <vector142>:
.globl vector142
vector142:
  pushl $0
  101939:	6a 00                	push   $0x0
  pushl $142
  10193b:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
  101940:	e9 dd f8 ff ff       	jmp    101222 <alltraps>

00101945 <vector143>:
.globl vector143
vector143:
  pushl $0
  101945:	6a 00                	push   $0x0
  pushl $143
  101947:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
  10194c:	e9 d1 f8 ff ff       	jmp    101222 <alltraps>

00101951 <vector144>:
.globl vector144
vector144:
  pushl $0
  101951:	6a 00                	push   $0x0
  pushl $144
  101953:	68 90 00 00 00       	push   $0x90
  jmp alltraps
  101958:	e9 c5 f8 ff ff       	jmp    101222 <alltraps>

0010195d <vector145>:
.globl vector145
vector145:
  pushl $0
  10195d:	6a 00                	push   $0x0
  pushl $145
  10195f:	68 91 00 00 00       	push   $0x91
  jmp alltraps
  101964:	e9 b9 f8 ff ff       	jmp    101222 <alltraps>

00101969 <vector146>:
.globl vector146
vector146:
  pushl $0
  101969:	6a 00                	push   $0x0
  pushl $146
  10196b:	68 92 00 00 00       	push   $0x92
  jmp alltraps
  101970:	e9 ad f8 ff ff       	jmp    101222 <alltraps>

00101975 <vector147>:
.globl vector147
vector147:
  pushl $0
  101975:	6a 00                	push   $0x0
  pushl $147
  101977:	68 93 00 00 00       	push   $0x93
  jmp alltraps
  10197c:	e9 a1 f8 ff ff       	jmp    101222 <alltraps>

00101981 <vector148>:
.globl vector148
vector148:
  pushl $0
  101981:	6a 00                	push   $0x0
  pushl $148
  101983:	68 94 00 00 00       	push   $0x94
  jmp alltraps
  101988:	e9 95 f8 ff ff       	jmp    101222 <alltraps>

0010198d <vector149>:
.globl vector149
vector149:
  pushl $0
  10198d:	6a 00                	push   $0x0
  pushl $149
  10198f:	68 95 00 00 00       	push   $0x95
  jmp alltraps
  101994:	e9 89 f8 ff ff       	jmp    101222 <alltraps>

00101999 <vector150>:
.globl vector150
vector150:
  pushl $0
  101999:	6a 00                	push   $0x0
  pushl $150
  10199b:	68 96 00 00 00       	push   $0x96
  jmp alltraps
  1019a0:	e9 7d f8 ff ff       	jmp    101222 <alltraps>

001019a5 <vector151>:
.globl vector151
vector151:
  pushl $0
  1019a5:	6a 00                	push   $0x0
  pushl $151
  1019a7:	68 97 00 00 00       	push   $0x97
  jmp alltraps
  1019ac:	e9 71 f8 ff ff       	jmp    101222 <alltraps>

001019b1 <vector152>:
.globl vector152
vector152:
  pushl $0
  1019b1:	6a 00                	push   $0x0
  pushl $152
  1019b3:	68 98 00 00 00       	push   $0x98
  jmp alltraps
  1019b8:	e9 65 f8 ff ff       	jmp    101222 <alltraps>

001019bd <vector153>:
.globl vector153
vector153:
  pushl $0
  1019bd:	6a 00                	push   $0x0
  pushl $153
  1019bf:	68 99 00 00 00       	push   $0x99
  jmp alltraps
  1019c4:	e9 59 f8 ff ff       	jmp    101222 <alltraps>

001019c9 <vector154>:
.globl vector154
vector154:
  pushl $0
  1019c9:	6a 00                	push   $0x0
  pushl $154
  1019cb:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
  1019d0:	e9 4d f8 ff ff       	jmp    101222 <alltraps>

001019d5 <vector155>:
.globl vector155
vector155:
  pushl $0
  1019d5:	6a 00                	push   $0x0
  pushl $155
  1019d7:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
  1019dc:	e9 41 f8 ff ff       	jmp    101222 <alltraps>

001019e1 <vector156>:
.globl vector156
vector156:
  pushl $0
  1019e1:	6a 00                	push   $0x0
  pushl $156
  1019e3:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
  1019e8:	e9 35 f8 ff ff       	jmp    101222 <alltraps>

001019ed <vector157>:
.globl vector157
vector157:
  pushl $0
  1019ed:	6a 00                	push   $0x0
  pushl $157
  1019ef:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
  1019f4:	e9 29 f8 ff ff       	jmp    101222 <alltraps>

001019f9 <vector158>:
.globl vector158
vector158:
  pushl $0
  1019f9:	6a 00                	push   $0x0
  pushl $158
  1019fb:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
  101a00:	e9 1d f8 ff ff       	jmp    101222 <alltraps>

00101a05 <vector159>:
.globl vector159
vector159:
  pushl $0
  101a05:	6a 00                	push   $0x0
  pushl $159
  101a07:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
  101a0c:	e9 11 f8 ff ff       	jmp    101222 <alltraps>

00101a11 <vector160>:
.globl vector160
vector160:
  pushl $0
  101a11:	6a 00                	push   $0x0
  pushl $160
  101a13:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
  101a18:	e9 05 f8 ff ff       	jmp    101222 <alltraps>

00101a1d <vector161>:
.globl vector161
vector161:
  pushl $0
  101a1d:	6a 00                	push   $0x0
  pushl $161
  101a1f:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
  101a24:	e9 f9 f7 ff ff       	jmp    101222 <alltraps>

00101a29 <vector162>:
.globl vector162
vector162:
  pushl $0
  101a29:	6a 00                	push   $0x0
  pushl $162
  101a2b:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
  101a30:	e9 ed f7 ff ff       	jmp    101222 <alltraps>

00101a35 <vector163>:
.globl vector163
vector163:
  pushl $0
  101a35:	6a 00                	push   $0x0
  pushl $163
  101a37:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
  101a3c:	e9 e1 f7 ff ff       	jmp    101222 <alltraps>

00101a41 <vector164>:
.globl vector164
vector164:
  pushl $0
  101a41:	6a 00                	push   $0x0
  pushl $164
  101a43:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
  101a48:	e9 d5 f7 ff ff       	jmp    101222 <alltraps>

00101a4d <vector165>:
.globl vector165
vector165:
  pushl $0
  101a4d:	6a 00                	push   $0x0
  pushl $165
  101a4f:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
  101a54:	e9 c9 f7 ff ff       	jmp    101222 <alltraps>

00101a59 <vector166>:
.globl vector166
vector166:
  pushl $0
  101a59:	6a 00                	push   $0x0
  pushl $166
  101a5b:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
  101a60:	e9 bd f7 ff ff       	jmp    101222 <alltraps>

00101a65 <vector167>:
.globl vector167
vector167:
  pushl $0
  101a65:	6a 00                	push   $0x0
  pushl $167
  101a67:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
  101a6c:	e9 b1 f7 ff ff       	jmp    101222 <alltraps>

00101a71 <vector168>:
.globl vector168
vector168:
  pushl $0
  101a71:	6a 00                	push   $0x0
  pushl $168
  101a73:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
  101a78:	e9 a5 f7 ff ff       	jmp    101222 <alltraps>

00101a7d <vector169>:
.globl vector169
vector169:
  pushl $0
  101a7d:	6a 00                	push   $0x0
  pushl $169
  101a7f:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
  101a84:	e9 99 f7 ff ff       	jmp    101222 <alltraps>

00101a89 <vector170>:
.globl vector170
vector170:
  pushl $0
  101a89:	6a 00                	push   $0x0
  pushl $170
  101a8b:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
  101a90:	e9 8d f7 ff ff       	jmp    101222 <alltraps>

00101a95 <vector171>:
.globl vector171
vector171:
  pushl $0
  101a95:	6a 00                	push   $0x0
  pushl $171
  101a97:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
  101a9c:	e9 81 f7 ff ff       	jmp    101222 <alltraps>

00101aa1 <vector172>:
.globl vector172
vector172:
  pushl $0
  101aa1:	6a 00                	push   $0x0
  pushl $172
  101aa3:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
  101aa8:	e9 75 f7 ff ff       	jmp    101222 <alltraps>

00101aad <vector173>:
.globl vector173
vector173:
  pushl $0
  101aad:	6a 00                	push   $0x0
  pushl $173
  101aaf:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
  101ab4:	e9 69 f7 ff ff       	jmp    101222 <alltraps>

00101ab9 <vector174>:
.globl vector174
vector174:
  pushl $0
  101ab9:	6a 00                	push   $0x0
  pushl $174
  101abb:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
  101ac0:	e9 5d f7 ff ff       	jmp    101222 <alltraps>

00101ac5 <vector175>:
.globl vector175
vector175:
  pushl $0
  101ac5:	6a 00                	push   $0x0
  pushl $175
  101ac7:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
  101acc:	e9 51 f7 ff ff       	jmp    101222 <alltraps>

00101ad1 <vector176>:
.globl vector176
vector176:
  pushl $0
  101ad1:	6a 00                	push   $0x0
  pushl $176
  101ad3:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
  101ad8:	e9 45 f7 ff ff       	jmp    101222 <alltraps>

00101add <vector177>:
.globl vector177
vector177:
  pushl $0
  101add:	6a 00                	push   $0x0
  pushl $177
  101adf:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
  101ae4:	e9 39 f7 ff ff       	jmp    101222 <alltraps>

00101ae9 <vector178>:
.globl vector178
vector178:
  pushl $0
  101ae9:	6a 00                	push   $0x0
  pushl $178
  101aeb:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
  101af0:	e9 2d f7 ff ff       	jmp    101222 <alltraps>

00101af5 <vector179>:
.globl vector179
vector179:
  pushl $0
  101af5:	6a 00                	push   $0x0
  pushl $179
  101af7:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
  101afc:	e9 21 f7 ff ff       	jmp    101222 <alltraps>

00101b01 <vector180>:
.globl vector180
vector180:
  pushl $0
  101b01:	6a 00                	push   $0x0
  pushl $180
  101b03:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
  101b08:	e9 15 f7 ff ff       	jmp    101222 <alltraps>

00101b0d <vector181>:
.globl vector181
vector181:
  pushl $0
  101b0d:	6a 00                	push   $0x0
  pushl $181
  101b0f:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
  101b14:	e9 09 f7 ff ff       	jmp    101222 <alltraps>

00101b19 <vector182>:
.globl vector182
vector182:
  pushl $0
  101b19:	6a 00                	push   $0x0
  pushl $182
  101b1b:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
  101b20:	e9 fd f6 ff ff       	jmp    101222 <alltraps>

00101b25 <vector183>:
.globl vector183
vector183:
  pushl $0
  101b25:	6a 00                	push   $0x0
  pushl $183
  101b27:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
  101b2c:	e9 f1 f6 ff ff       	jmp    101222 <alltraps>

00101b31 <vector184>:
.globl vector184
vector184:
  pushl $0
  101b31:	6a 00                	push   $0x0
  pushl $184
  101b33:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
  101b38:	e9 e5 f6 ff ff       	jmp    101222 <alltraps>

00101b3d <vector185>:
.globl vector185
vector185:
  pushl $0
  101b3d:	6a 00                	push   $0x0
  pushl $185
  101b3f:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
  101b44:	e9 d9 f6 ff ff       	jmp    101222 <alltraps>

00101b49 <vector186>:
.globl vector186
vector186:
  pushl $0
  101b49:	6a 00                	push   $0x0
  pushl $186
  101b4b:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
  101b50:	e9 cd f6 ff ff       	jmp    101222 <alltraps>

00101b55 <vector187>:
.globl vector187
vector187:
  pushl $0
  101b55:	6a 00                	push   $0x0
  pushl $187
  101b57:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
  101b5c:	e9 c1 f6 ff ff       	jmp    101222 <alltraps>

00101b61 <vector188>:
.globl vector188
vector188:
  pushl $0
  101b61:	6a 00                	push   $0x0
  pushl $188
  101b63:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
  101b68:	e9 b5 f6 ff ff       	jmp    101222 <alltraps>

00101b6d <vector189>:
.globl vector189
vector189:
  pushl $0
  101b6d:	6a 00                	push   $0x0
  pushl $189
  101b6f:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
  101b74:	e9 a9 f6 ff ff       	jmp    101222 <alltraps>

00101b79 <vector190>:
.globl vector190
vector190:
  pushl $0
  101b79:	6a 00                	push   $0x0
  pushl $190
  101b7b:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
  101b80:	e9 9d f6 ff ff       	jmp    101222 <alltraps>

00101b85 <vector191>:
.globl vector191
vector191:
  pushl $0
  101b85:	6a 00                	push   $0x0
  pushl $191
  101b87:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
  101b8c:	e9 91 f6 ff ff       	jmp    101222 <alltraps>

00101b91 <vector192>:
.globl vector192
vector192:
  pushl $0
  101b91:	6a 00                	push   $0x0
  pushl $192
  101b93:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
  101b98:	e9 85 f6 ff ff       	jmp    101222 <alltraps>

00101b9d <vector193>:
.globl vector193
vector193:
  pushl $0
  101b9d:	6a 00                	push   $0x0
  pushl $193
  101b9f:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
  101ba4:	e9 79 f6 ff ff       	jmp    101222 <alltraps>

00101ba9 <vector194>:
.globl vector194
vector194:
  pushl $0
  101ba9:	6a 00                	push   $0x0
  pushl $194
  101bab:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
  101bb0:	e9 6d f6 ff ff       	jmp    101222 <alltraps>

00101bb5 <vector195>:
.globl vector195
vector195:
  pushl $0
  101bb5:	6a 00                	push   $0x0
  pushl $195
  101bb7:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
  101bbc:	e9 61 f6 ff ff       	jmp    101222 <alltraps>

00101bc1 <vector196>:
.globl vector196
vector196:
  pushl $0
  101bc1:	6a 00                	push   $0x0
  pushl $196
  101bc3:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
  101bc8:	e9 55 f6 ff ff       	jmp    101222 <alltraps>

00101bcd <vector197>:
.globl vector197
vector197:
  pushl $0
  101bcd:	6a 00                	push   $0x0
  pushl $197
  101bcf:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
  101bd4:	e9 49 f6 ff ff       	jmp    101222 <alltraps>

00101bd9 <vector198>:
.globl vector198
vector198:
  pushl $0
  101bd9:	6a 00                	push   $0x0
  pushl $198
  101bdb:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
  101be0:	e9 3d f6 ff ff       	jmp    101222 <alltraps>

00101be5 <vector199>:
.globl vector199
vector199:
  pushl $0
  101be5:	6a 00                	push   $0x0
  pushl $199
  101be7:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
  101bec:	e9 31 f6 ff ff       	jmp    101222 <alltraps>

00101bf1 <vector200>:
.globl vector200
vector200:
  pushl $0
  101bf1:	6a 00                	push   $0x0
  pushl $200
  101bf3:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
  101bf8:	e9 25 f6 ff ff       	jmp    101222 <alltraps>

00101bfd <vector201>:
.globl vector201
vector201:
  pushl $0
  101bfd:	6a 00                	push   $0x0
  pushl $201
  101bff:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
  101c04:	e9 19 f6 ff ff       	jmp    101222 <alltraps>

00101c09 <vector202>:
.globl vector202
vector202:
  pushl $0
  101c09:	6a 00                	push   $0x0
  pushl $202
  101c0b:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
  101c10:	e9 0d f6 ff ff       	jmp    101222 <alltraps>

00101c15 <vector203>:
.globl vector203
vector203:
  pushl $0
  101c15:	6a 00                	push   $0x0
  pushl $203
  101c17:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
  101c1c:	e9 01 f6 ff ff       	jmp    101222 <alltraps>

00101c21 <vector204>:
.globl vector204
vector204:
  pushl $0
  101c21:	6a 00                	push   $0x0
  pushl $204
  101c23:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
  101c28:	e9 f5 f5 ff ff       	jmp    101222 <alltraps>

00101c2d <vector205>:
.globl vector205
vector205:
  pushl $0
  101c2d:	6a 00                	push   $0x0
  pushl $205
  101c2f:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
  101c34:	e9 e9 f5 ff ff       	jmp    101222 <alltraps>

00101c39 <vector206>:
.globl vector206
vector206:
  pushl $0
  101c39:	6a 00                	push   $0x0
  pushl $206
  101c3b:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
  101c40:	e9 dd f5 ff ff       	jmp    101222 <alltraps>

00101c45 <vector207>:
.globl vector207
vector207:
  pushl $0
  101c45:	6a 00                	push   $0x0
  pushl $207
  101c47:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
  101c4c:	e9 d1 f5 ff ff       	jmp    101222 <alltraps>

00101c51 <vector208>:
.globl vector208
vector208:
  pushl $0
  101c51:	6a 00                	push   $0x0
  pushl $208
  101c53:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
  101c58:	e9 c5 f5 ff ff       	jmp    101222 <alltraps>

00101c5d <vector209>:
.globl vector209
vector209:
  pushl $0
  101c5d:	6a 00                	push   $0x0
  pushl $209
  101c5f:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
  101c64:	e9 b9 f5 ff ff       	jmp    101222 <alltraps>

00101c69 <vector210>:
.globl vector210
vector210:
  pushl $0
  101c69:	6a 00                	push   $0x0
  pushl $210
  101c6b:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
  101c70:	e9 ad f5 ff ff       	jmp    101222 <alltraps>

00101c75 <vector211>:
.globl vector211
vector211:
  pushl $0
  101c75:	6a 00                	push   $0x0
  pushl $211
  101c77:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
  101c7c:	e9 a1 f5 ff ff       	jmp    101222 <alltraps>

00101c81 <vector212>:
.globl vector212
vector212:
  pushl $0
  101c81:	6a 00                	push   $0x0
  pushl $212
  101c83:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
  101c88:	e9 95 f5 ff ff       	jmp    101222 <alltraps>

00101c8d <vector213>:
.globl vector213
vector213:
  pushl $0
  101c8d:	6a 00                	push   $0x0
  pushl $213
  101c8f:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
  101c94:	e9 89 f5 ff ff       	jmp    101222 <alltraps>

00101c99 <vector214>:
.globl vector214
vector214:
  pushl $0
  101c99:	6a 00                	push   $0x0
  pushl $214
  101c9b:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
  101ca0:	e9 7d f5 ff ff       	jmp    101222 <alltraps>

00101ca5 <vector215>:
.globl vector215
vector215:
  pushl $0
  101ca5:	6a 00                	push   $0x0
  pushl $215
  101ca7:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
  101cac:	e9 71 f5 ff ff       	jmp    101222 <alltraps>

00101cb1 <vector216>:
.globl vector216
vector216:
  pushl $0
  101cb1:	6a 00                	push   $0x0
  pushl $216
  101cb3:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
  101cb8:	e9 65 f5 ff ff       	jmp    101222 <alltraps>

00101cbd <vector217>:
.globl vector217
vector217:
  pushl $0
  101cbd:	6a 00                	push   $0x0
  pushl $217
  101cbf:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
  101cc4:	e9 59 f5 ff ff       	jmp    101222 <alltraps>

00101cc9 <vector218>:
.globl vector218
vector218:
  pushl $0
  101cc9:	6a 00                	push   $0x0
  pushl $218
  101ccb:	68 da 00 00 00       	push   $0xda
  jmp alltraps
  101cd0:	e9 4d f5 ff ff       	jmp    101222 <alltraps>

00101cd5 <vector219>:
.globl vector219
vector219:
  pushl $0
  101cd5:	6a 00                	push   $0x0
  pushl $219
  101cd7:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
  101cdc:	e9 41 f5 ff ff       	jmp    101222 <alltraps>

00101ce1 <vector220>:
.globl vector220
vector220:
  pushl $0
  101ce1:	6a 00                	push   $0x0
  pushl $220
  101ce3:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
  101ce8:	e9 35 f5 ff ff       	jmp    101222 <alltraps>

00101ced <vector221>:
.globl vector221
vector221:
  pushl $0
  101ced:	6a 00                	push   $0x0
  pushl $221
  101cef:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
  101cf4:	e9 29 f5 ff ff       	jmp    101222 <alltraps>

00101cf9 <vector222>:
.globl vector222
vector222:
  pushl $0
  101cf9:	6a 00                	push   $0x0
  pushl $222
  101cfb:	68 de 00 00 00       	push   $0xde
  jmp alltraps
  101d00:	e9 1d f5 ff ff       	jmp    101222 <alltraps>

00101d05 <vector223>:
.globl vector223
vector223:
  pushl $0
  101d05:	6a 00                	push   $0x0
  pushl $223
  101d07:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
  101d0c:	e9 11 f5 ff ff       	jmp    101222 <alltraps>

00101d11 <vector224>:
.globl vector224
vector224:
  pushl $0
  101d11:	6a 00                	push   $0x0
  pushl $224
  101d13:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
  101d18:	e9 05 f5 ff ff       	jmp    101222 <alltraps>

00101d1d <vector225>:
.globl vector225
vector225:
  pushl $0
  101d1d:	6a 00                	push   $0x0
  pushl $225
  101d1f:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
  101d24:	e9 f9 f4 ff ff       	jmp    101222 <alltraps>

00101d29 <vector226>:
.globl vector226
vector226:
  pushl $0
  101d29:	6a 00                	push   $0x0
  pushl $226
  101d2b:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
  101d30:	e9 ed f4 ff ff       	jmp    101222 <alltraps>

00101d35 <vector227>:
.globl vector227
vector227:
  pushl $0
  101d35:	6a 00                	push   $0x0
  pushl $227
  101d37:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
  101d3c:	e9 e1 f4 ff ff       	jmp    101222 <alltraps>

00101d41 <vector228>:
.globl vector228
vector228:
  pushl $0
  101d41:	6a 00                	push   $0x0
  pushl $228
  101d43:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
  101d48:	e9 d5 f4 ff ff       	jmp    101222 <alltraps>

00101d4d <vector229>:
.globl vector229
vector229:
  pushl $0
  101d4d:	6a 00                	push   $0x0
  pushl $229
  101d4f:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
  101d54:	e9 c9 f4 ff ff       	jmp    101222 <alltraps>

00101d59 <vector230>:
.globl vector230
vector230:
  pushl $0
  101d59:	6a 00                	push   $0x0
  pushl $230
  101d5b:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
  101d60:	e9 bd f4 ff ff       	jmp    101222 <alltraps>

00101d65 <vector231>:
.globl vector231
vector231:
  pushl $0
  101d65:	6a 00                	push   $0x0
  pushl $231
  101d67:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
  101d6c:	e9 b1 f4 ff ff       	jmp    101222 <alltraps>

00101d71 <vector232>:
.globl vector232
vector232:
  pushl $0
  101d71:	6a 00                	push   $0x0
  pushl $232
  101d73:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
  101d78:	e9 a5 f4 ff ff       	jmp    101222 <alltraps>

00101d7d <vector233>:
.globl vector233
vector233:
  pushl $0
  101d7d:	6a 00                	push   $0x0
  pushl $233
  101d7f:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
  101d84:	e9 99 f4 ff ff       	jmp    101222 <alltraps>

00101d89 <vector234>:
.globl vector234
vector234:
  pushl $0
  101d89:	6a 00                	push   $0x0
  pushl $234
  101d8b:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
  101d90:	e9 8d f4 ff ff       	jmp    101222 <alltraps>

00101d95 <vector235>:
.globl vector235
vector235:
  pushl $0
  101d95:	6a 00                	push   $0x0
  pushl $235
  101d97:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
  101d9c:	e9 81 f4 ff ff       	jmp    101222 <alltraps>

00101da1 <vector236>:
.globl vector236
vector236:
  pushl $0
  101da1:	6a 00                	push   $0x0
  pushl $236
  101da3:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
  101da8:	e9 75 f4 ff ff       	jmp    101222 <alltraps>

00101dad <vector237>:
.globl vector237
vector237:
  pushl $0
  101dad:	6a 00                	push   $0x0
  pushl $237
  101daf:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
  101db4:	e9 69 f4 ff ff       	jmp    101222 <alltraps>

00101db9 <vector238>:
.globl vector238
vector238:
  pushl $0
  101db9:	6a 00                	push   $0x0
  pushl $238
  101dbb:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
  101dc0:	e9 5d f4 ff ff       	jmp    101222 <alltraps>

00101dc5 <vector239>:
.globl vector239
vector239:
  pushl $0
  101dc5:	6a 00                	push   $0x0
  pushl $239
  101dc7:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
  101dcc:	e9 51 f4 ff ff       	jmp    101222 <alltraps>

00101dd1 <vector240>:
.globl vector240
vector240:
  pushl $0
  101dd1:	6a 00                	push   $0x0
  pushl $240
  101dd3:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
  101dd8:	e9 45 f4 ff ff       	jmp    101222 <alltraps>

00101ddd <vector241>:
.globl vector241
vector241:
  pushl $0
  101ddd:	6a 00                	push   $0x0
  pushl $241
  101ddf:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
  101de4:	e9 39 f4 ff ff       	jmp    101222 <alltraps>

00101de9 <vector242>:
.globl vector242
vector242:
  pushl $0
  101de9:	6a 00                	push   $0x0
  pushl $242
  101deb:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
  101df0:	e9 2d f4 ff ff       	jmp    101222 <alltraps>

00101df5 <vector243>:
.globl vector243
vector243:
  pushl $0
  101df5:	6a 00                	push   $0x0
  pushl $243
  101df7:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
  101dfc:	e9 21 f4 ff ff       	jmp    101222 <alltraps>

00101e01 <vector244>:
.globl vector244
vector244:
  pushl $0
  101e01:	6a 00                	push   $0x0
  pushl $244
  101e03:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
  101e08:	e9 15 f4 ff ff       	jmp    101222 <alltraps>

00101e0d <vector245>:
.globl vector245
vector245:
  pushl $0
  101e0d:	6a 00                	push   $0x0
  pushl $245
  101e0f:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
  101e14:	e9 09 f4 ff ff       	jmp    101222 <alltraps>

00101e19 <vector246>:
.globl vector246
vector246:
  pushl $0
  101e19:	6a 00                	push   $0x0
  pushl $246
  101e1b:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
  101e20:	e9 fd f3 ff ff       	jmp    101222 <alltraps>

00101e25 <vector247>:
.globl vector247
vector247:
  pushl $0
  101e25:	6a 00                	push   $0x0
  pushl $247
  101e27:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
  101e2c:	e9 f1 f3 ff ff       	jmp    101222 <alltraps>

00101e31 <vector248>:
.globl vector248
vector248:
  pushl $0
  101e31:	6a 00                	push   $0x0
  pushl $248
  101e33:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
  101e38:	e9 e5 f3 ff ff       	jmp    101222 <alltraps>

00101e3d <vector249>:
.globl vector249
vector249:
  pushl $0
  101e3d:	6a 00                	push   $0x0
  pushl $249
  101e3f:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
  101e44:	e9 d9 f3 ff ff       	jmp    101222 <alltraps>

00101e49 <vector250>:
.globl vector250
vector250:
  pushl $0
  101e49:	6a 00                	push   $0x0
  pushl $250
  101e4b:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
  101e50:	e9 cd f3 ff ff       	jmp    101222 <alltraps>

00101e55 <vector251>:
.globl vector251
vector251:
  pushl $0
  101e55:	6a 00                	push   $0x0
  pushl $251
  101e57:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
  101e5c:	e9 c1 f3 ff ff       	jmp    101222 <alltraps>

00101e61 <vector252>:
.globl vector252
vector252:
  pushl $0
  101e61:	6a 00                	push   $0x0
  pushl $252
  101e63:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
  101e68:	e9 b5 f3 ff ff       	jmp    101222 <alltraps>

00101e6d <vector253>:
.globl vector253
vector253:
  pushl $0
  101e6d:	6a 00                	push   $0x0
  pushl $253
  101e6f:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
  101e74:	e9 a9 f3 ff ff       	jmp    101222 <alltraps>

00101e79 <vector254>:
.globl vector254
vector254:
  pushl $0
  101e79:	6a 00                	push   $0x0
  pushl $254
  101e7b:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
  101e80:	e9 9d f3 ff ff       	jmp    101222 <alltraps>

00101e85 <vector255>:
.globl vector255
vector255:
  pushl $0
  101e85:	6a 00                	push   $0x0
  pushl $255
  101e87:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
  101e8c:	e9 91 f3 ff ff       	jmp    101222 <alltraps>

00101e91 <get_old>:
#define OLDSZ 10
#define NULL (void *) 0
int ind[OLDSZ];
int j = 0;
struct buf old[OLDSZ];
struct buf* get_old(uint blockno) {
  101e91:	55                   	push   %ebp
  101e92:	89 e5                	mov    %esp,%ebp
  101e94:	83 ec 18             	sub    $0x18,%esp
        int i;
        if(j == 0){
  101e97:	a1 a8 9e 10 00       	mov    0x109ea8,%eax
  101e9c:	85 c0                	test   %eax,%eax
  101e9e:	75 17                	jne    101eb7 <get_old+0x26>
                cprintf("not even once bread_wr clalen\n");
  101ea0:	83 ec 0c             	sub    $0xc,%esp
  101ea3:	68 f4 42 10 00       	push   $0x1042f4
  101ea8:	e8 3f e2 ff ff       	call   1000ec <cprintf>
  101ead:	83 c4 10             	add    $0x10,%esp
                return NULL;
  101eb0:	b8 00 00 00 00       	mov    $0x0,%eax
  101eb5:	eb 6a                	jmp    101f21 <get_old+0x90>
        }
        for(i = j-1 ; i >= 0 ; i--){
  101eb7:	a1 a8 9e 10 00       	mov    0x109ea8,%eax
  101ebc:	83 e8 01             	sub    $0x1,%eax
  101ebf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101ec2:	eb 13                	jmp    101ed7 <get_old+0x46>
                if(ind[i] == blockno){
  101ec4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101ec7:	8b 04 85 80 9e 10 00 	mov    0x109e80(,%eax,4),%eax
  101ece:	39 45 08             	cmp    %eax,0x8(%ebp)
  101ed1:	74 0c                	je     101edf <get_old+0x4e>
        for(i = j-1 ; i >= 0 ; i--){
  101ed3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  101ed7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101edb:	79 e7                	jns    101ec4 <get_old+0x33>
  101edd:	eb 01                	jmp    101ee0 <get_old+0x4f>
                        break;
  101edf:	90                   	nop
                }
        }
        if(i == -1){
  101ee0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101ee4:	75 2d                	jne    101f13 <get_old+0x82>
                cprintf("Wasn't \n");
  101ee6:	83 ec 0c             	sub    $0xc,%esp
  101ee9:	68 13 43 10 00       	push   $0x104313
  101eee:	e8 f9 e1 ff ff       	call   1000ec <cprintf>
  101ef3:	83 c4 10             	add    $0x10,%esp
                cprintf("%d\n", j);
  101ef6:	a1 a8 9e 10 00       	mov    0x109ea8,%eax
  101efb:	83 ec 08             	sub    $0x8,%esp
  101efe:	50                   	push   %eax
  101eff:	68 1c 43 10 00       	push   $0x10431c
  101f04:	e8 e3 e1 ff ff       	call   1000ec <cprintf>
  101f09:	83 c4 10             	add    $0x10,%esp
                return NULL;
  101f0c:	b8 00 00 00 00       	mov    $0x0,%eax
  101f11:	eb 0e                	jmp    101f21 <get_old+0x90>
        }
        return &old[i];
  101f13:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f16:	69 c0 1c 02 00 00    	imul   $0x21c,%eax,%eax
  101f1c:	05 c0 9e 10 00       	add    $0x109ec0,%eax
}
  101f21:	c9                   	leave
  101f22:	c3                   	ret

00101f23 <binit>:

void
binit(void)
{
  101f23:	55                   	push   %ebp
  101f24:	89 e5                	mov    %esp,%ebp
  101f26:	83 ec 10             	sub    $0x10,%esp
  struct buf *b;

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  101f29:	c7 05 58 9c 10 00 48 	movl   $0x109c48,0x109c58
  101f30:	9c 10 00 
  bcache.head.next = &bcache.head;
  101f33:	c7 05 5c 9c 10 00 48 	movl   $0x109c48,0x109c5c
  101f3a:	9c 10 00 
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
  101f3d:	c7 45 fc 00 5d 10 00 	movl   $0x105d00,-0x4(%ebp)
  101f44:	eb 30                	jmp    101f76 <binit+0x53>
    b->next = bcache.head.next;
  101f46:	8b 15 5c 9c 10 00    	mov    0x109c5c,%edx
  101f4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101f4f:	89 50 14             	mov    %edx,0x14(%eax)
    b->prev = &bcache.head;
  101f52:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101f55:	c7 40 10 48 9c 10 00 	movl   $0x109c48,0x10(%eax)
    bcache.head.next->prev = b;
  101f5c:	a1 5c 9c 10 00       	mov    0x109c5c,%eax
  101f61:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101f64:	89 50 10             	mov    %edx,0x10(%eax)
    bcache.head.next = b;
  101f67:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101f6a:	a3 5c 9c 10 00       	mov    %eax,0x109c5c
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
  101f6f:	81 45 fc 1c 02 00 00 	addl   $0x21c,-0x4(%ebp)
  101f76:	b8 48 9c 10 00       	mov    $0x109c48,%eax
  101f7b:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101f7e:	72 c6                	jb     101f46 <binit+0x23>
  }
}
  101f80:	90                   	nop
  101f81:	90                   	nop
  101f82:	c9                   	leave
  101f83:	c3                   	ret

00101f84 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
  101f84:	55                   	push   %ebp
  101f85:	89 e5                	mov    %esp,%ebp
  101f87:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
  101f8a:	a1 5c 9c 10 00       	mov    0x109c5c,%eax
  101f8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101f92:	eb 33                	jmp    101fc7 <bget+0x43>
    if(b->dev == dev && b->blockno == blockno){
  101f94:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f97:	8b 40 04             	mov    0x4(%eax),%eax
  101f9a:	39 45 08             	cmp    %eax,0x8(%ebp)
  101f9d:	75 1f                	jne    101fbe <bget+0x3a>
  101f9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fa2:	8b 40 08             	mov    0x8(%eax),%eax
  101fa5:	39 45 0c             	cmp    %eax,0xc(%ebp)
  101fa8:	75 14                	jne    101fbe <bget+0x3a>
      b->refcnt++;
  101faa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fad:	8b 40 0c             	mov    0xc(%eax),%eax
  101fb0:	8d 50 01             	lea    0x1(%eax),%edx
  101fb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fb6:	89 50 0c             	mov    %edx,0xc(%eax)
      return b;
  101fb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fbc:	eb 7b                	jmp    102039 <bget+0xb5>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
  101fbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fc1:	8b 40 14             	mov    0x14(%eax),%eax
  101fc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101fc7:	81 7d f4 48 9c 10 00 	cmpl   $0x109c48,-0xc(%ebp)
  101fce:	75 c4                	jne    101f94 <bget+0x10>
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
  101fd0:	a1 58 9c 10 00       	mov    0x109c58,%eax
  101fd5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101fd8:	eb 49                	jmp    102023 <bget+0x9f>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
  101fda:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fdd:	8b 40 0c             	mov    0xc(%eax),%eax
  101fe0:	85 c0                	test   %eax,%eax
  101fe2:	75 36                	jne    10201a <bget+0x96>
  101fe4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fe7:	8b 00                	mov    (%eax),%eax
  101fe9:	83 e0 04             	and    $0x4,%eax
  101fec:	85 c0                	test   %eax,%eax
  101fee:	75 2a                	jne    10201a <bget+0x96>
      b->dev = dev;
  101ff0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101ff3:	8b 55 08             	mov    0x8(%ebp),%edx
  101ff6:	89 50 04             	mov    %edx,0x4(%eax)
      b->blockno = blockno;
  101ff9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101ffc:	8b 55 0c             	mov    0xc(%ebp),%edx
  101fff:	89 50 08             	mov    %edx,0x8(%eax)
      b->flags = 0;
  102002:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102005:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
      b->refcnt = 1;
  10200b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10200e:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
      return b;
  102015:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102018:	eb 1f                	jmp    102039 <bget+0xb5>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
  10201a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10201d:	8b 40 10             	mov    0x10(%eax),%eax
  102020:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102023:	81 7d f4 48 9c 10 00 	cmpl   $0x109c48,-0xc(%ebp)
  10202a:	75 ae                	jne    101fda <bget+0x56>
    }
  }
  panic("bget: no buffers");
  10202c:	83 ec 0c             	sub    $0xc,%esp
  10202f:	68 20 43 10 00       	push   $0x104320
  102034:	e8 75 e2 ff ff       	call   1002ae <panic>
}
  102039:	c9                   	leave
  10203a:	c3                   	ret

0010203b <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
  10203b:	55                   	push   %ebp
  10203c:	89 e5                	mov    %esp,%ebp
  10203e:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;
  b = bget(dev, blockno);
  102041:	83 ec 08             	sub    $0x8,%esp
  102044:	ff 75 0c             	push   0xc(%ebp)
  102047:	ff 75 08             	push   0x8(%ebp)
  10204a:	e8 35 ff ff ff       	call   101f84 <bget>
  10204f:	83 c4 10             	add    $0x10,%esp
  102052:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((b->flags & B_VALID) == 0) {
  102055:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102058:	8b 00                	mov    (%eax),%eax
  10205a:	83 e0 02             	and    $0x2,%eax
  10205d:	85 c0                	test   %eax,%eax
  10205f:	75 0e                	jne    10206f <bread+0x34>
    iderw(b);
  102061:	83 ec 0c             	sub    $0xc,%esp
  102064:	ff 75 f4             	push   -0xc(%ebp)
  102067:	e8 af 04 00 00       	call   10251b <iderw>
  10206c:	83 c4 10             	add    $0x10,%esp
  }
  return b;
  10206f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102072:	c9                   	leave
  102073:	c3                   	ret

00102074 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  102074:	55                   	push   %ebp
  102075:	89 e5                	mov    %esp,%ebp
  102077:	83 ec 08             	sub    $0x8,%esp
  b->flags |= B_DIRTY;
  10207a:	8b 45 08             	mov    0x8(%ebp),%eax
  10207d:	8b 00                	mov    (%eax),%eax
  10207f:	83 c8 04             	or     $0x4,%eax
  102082:	89 c2                	mov    %eax,%edx
  102084:	8b 45 08             	mov    0x8(%ebp),%eax
  102087:	89 10                	mov    %edx,(%eax)
  iderw(b);
  102089:	83 ec 0c             	sub    $0xc,%esp
  10208c:	ff 75 08             	push   0x8(%ebp)
  10208f:	e8 87 04 00 00       	call   10251b <iderw>
  102094:	83 c4 10             	add    $0x10,%esp
}
  102097:	90                   	nop
  102098:	c9                   	leave
  102099:	c3                   	ret

0010209a <bread_wr>:

struct buf* 
bread_wr(uint dev, uint blockno) {
  10209a:	55                   	push   %ebp
  10209b:	89 e5                	mov    %esp,%ebp
  10209d:	57                   	push   %edi
  10209e:	56                   	push   %esi
  10209f:	53                   	push   %ebx
  1020a0:	83 ec 1c             	sub    $0x1c,%esp
  // IMPLEMENT YOUR CODE HERE
  struct buf *b;
  b = bget(dev, blockno);
  1020a3:	83 ec 08             	sub    $0x8,%esp
  1020a6:	ff 75 0c             	push   0xc(%ebp)
  1020a9:	ff 75 08             	push   0x8(%ebp)
  1020ac:	e8 d3 fe ff ff       	call   101f84 <bget>
  1020b1:	83 c4 10             	add    $0x10,%esp
  1020b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if((b->flags & B_VALID) == 0) {
  1020b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1020ba:	8b 00                	mov    (%eax),%eax
  1020bc:	83 e0 02             	and    $0x2,%eax
  1020bf:	85 c0                	test   %eax,%eax
  1020c1:	75 0e                	jne    1020d1 <bread_wr+0x37>
    iderw(b);
  1020c3:	83 ec 0c             	sub    $0xc,%esp
  1020c6:	ff 75 e4             	push   -0x1c(%ebp)
  1020c9:	e8 4d 04 00 00       	call   10251b <iderw>
  1020ce:	83 c4 10             	add    $0x10,%esp
  }
        if(j >= OLDSZ){
  1020d1:	a1 a8 9e 10 00       	mov    0x109ea8,%eax
  1020d6:	83 f8 09             	cmp    $0x9,%eax
  1020d9:	7e 0d                	jle    1020e8 <bread_wr+0x4e>
                panic("not enough space\n");
  1020db:	83 ec 0c             	sub    $0xc,%esp
  1020de:	68 31 43 10 00       	push   $0x104331
  1020e3:	e8 c6 e1 ff ff       	call   1002ae <panic>
        }
        ind[j] = blockno;
  1020e8:	a1 a8 9e 10 00       	mov    0x109ea8,%eax
  1020ed:	8b 55 0c             	mov    0xc(%ebp),%edx
  1020f0:	89 14 85 80 9e 10 00 	mov    %edx,0x109e80(,%eax,4)
        old[j] = *b;
  1020f7:	a1 a8 9e 10 00       	mov    0x109ea8,%eax
  1020fc:	69 c0 1c 02 00 00    	imul   $0x21c,%eax,%eax
  102102:	8d 90 c0 9e 10 00    	lea    0x109ec0(%eax),%edx
  102108:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10210b:	89 c3                	mov    %eax,%ebx
  10210d:	b8 87 00 00 00       	mov    $0x87,%eax
  102112:	89 d7                	mov    %edx,%edi
  102114:	89 de                	mov    %ebx,%esi
  102116:	89 c1                	mov    %eax,%ecx
  102118:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
        j++;
  10211a:	a1 a8 9e 10 00       	mov    0x109ea8,%eax
  10211f:	83 c0 01             	add    $0x1,%eax
  102122:	a3 a8 9e 10 00       	mov    %eax,0x109ea8
        
  return 0;
  102127:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10212c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10212f:	5b                   	pop    %ebx
  102130:	5e                   	pop    %esi
  102131:	5f                   	pop    %edi
  102132:	5d                   	pop    %ebp
  102133:	c3                   	ret

00102134 <brelse>:

// Release a buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  102134:	55                   	push   %ebp
  102135:	89 e5                	mov    %esp,%ebp
  b->refcnt--;
  102137:	8b 45 08             	mov    0x8(%ebp),%eax
  10213a:	8b 40 0c             	mov    0xc(%eax),%eax
  10213d:	8d 50 ff             	lea    -0x1(%eax),%edx
  102140:	8b 45 08             	mov    0x8(%ebp),%eax
  102143:	89 50 0c             	mov    %edx,0xc(%eax)
  if (b->refcnt == 0) {
  102146:	8b 45 08             	mov    0x8(%ebp),%eax
  102149:	8b 40 0c             	mov    0xc(%eax),%eax
  10214c:	85 c0                	test   %eax,%eax
  10214e:	75 47                	jne    102197 <brelse+0x63>
    // no one is waiting for it.
    b->next->prev = b->prev;
  102150:	8b 45 08             	mov    0x8(%ebp),%eax
  102153:	8b 40 14             	mov    0x14(%eax),%eax
  102156:	8b 55 08             	mov    0x8(%ebp),%edx
  102159:	8b 52 10             	mov    0x10(%edx),%edx
  10215c:	89 50 10             	mov    %edx,0x10(%eax)
    b->prev->next = b->next;
  10215f:	8b 45 08             	mov    0x8(%ebp),%eax
  102162:	8b 40 10             	mov    0x10(%eax),%eax
  102165:	8b 55 08             	mov    0x8(%ebp),%edx
  102168:	8b 52 14             	mov    0x14(%edx),%edx
  10216b:	89 50 14             	mov    %edx,0x14(%eax)
    b->next = bcache.head.next;
  10216e:	8b 15 5c 9c 10 00    	mov    0x109c5c,%edx
  102174:	8b 45 08             	mov    0x8(%ebp),%eax
  102177:	89 50 14             	mov    %edx,0x14(%eax)
    b->prev = &bcache.head;
  10217a:	8b 45 08             	mov    0x8(%ebp),%eax
  10217d:	c7 40 10 48 9c 10 00 	movl   $0x109c48,0x10(%eax)
    bcache.head.next->prev = b;
  102184:	a1 5c 9c 10 00       	mov    0x109c5c,%eax
  102189:	8b 55 08             	mov    0x8(%ebp),%edx
  10218c:	89 50 10             	mov    %edx,0x10(%eax)
    bcache.head.next = b;
  10218f:	8b 45 08             	mov    0x8(%ebp),%eax
  102192:	a3 5c 9c 10 00       	mov    %eax,0x109c5c
  }
}
  102197:	90                   	nop
  102198:	5d                   	pop    %ebp
  102199:	c3                   	ret

0010219a <inb>:
// Simple PIO-based (non-DMA) IDE driver code.

#include "types.h"
#include "defs.h"
#include "param.h"
  10219a:	55                   	push   %ebp
  10219b:	89 e5                	mov    %esp,%ebp
  10219d:	83 ec 14             	sub    $0x14,%esp
  1021a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1021a3:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
#include "mmu.h"
#include "proc.h"
#include "x86.h"
  1021a7:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1021ab:	89 c2                	mov    %eax,%edx
  1021ad:	ec                   	in     (%dx),%al
  1021ae:	88 45 ff             	mov    %al,-0x1(%ebp)
#include "traps.h"
  1021b1:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
#include "fs.h"
  1021b5:	c9                   	leave
  1021b6:	c3                   	ret

001021b7 <insl>:
#include "buf.h"

#define SECTOR_SIZE   512
#define IDE_BSY       0x80
  1021b7:	55                   	push   %ebp
  1021b8:	89 e5                	mov    %esp,%ebp
  1021ba:	57                   	push   %edi
  1021bb:	53                   	push   %ebx
#define IDE_DRDY      0x40
  1021bc:	8b 55 08             	mov    0x8(%ebp),%edx
  1021bf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1021c2:	8b 45 10             	mov    0x10(%ebp),%eax
  1021c5:	89 cb                	mov    %ecx,%ebx
  1021c7:	89 df                	mov    %ebx,%edi
  1021c9:	89 c1                	mov    %eax,%ecx
  1021cb:	fc                   	cld
  1021cc:	f3 6d                	rep insl (%dx),%es:(%edi)
  1021ce:	89 c8                	mov    %ecx,%eax
  1021d0:	89 fb                	mov    %edi,%ebx
  1021d2:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  1021d5:	89 45 10             	mov    %eax,0x10(%ebp)
#define IDE_DF        0x20
#define IDE_ERR       0x01

#define IDE_CMD_READ  0x20
  1021d8:	90                   	nop
  1021d9:	5b                   	pop    %ebx
  1021da:	5f                   	pop    %edi
  1021db:	5d                   	pop    %ebp
  1021dc:	c3                   	ret

001021dd <outb>:
#define IDE_CMD_WRITE 0x30
#define IDE_CMD_RDMUL 0xc4
#define IDE_CMD_WRMUL 0xc5

  1021dd:	55                   	push   %ebp
  1021de:	89 e5                	mov    %esp,%ebp
  1021e0:	83 ec 08             	sub    $0x8,%esp
  1021e3:	8b 55 08             	mov    0x8(%ebp),%edx
  1021e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1021e9:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  1021ed:	88 45 f8             	mov    %al,-0x8(%ebp)
// idequeue points to the buf now being read/written to the disk.
  1021f0:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  1021f4:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  1021f8:	ee                   	out    %al,(%dx)
// idequeue->qnext points to the next buf to be processed.
  1021f9:	90                   	nop
  1021fa:	c9                   	leave
  1021fb:	c3                   	ret

001021fc <outsl>:
static int havedisk1;
static void idestart(struct buf*);

// Wait for IDE disk to become ready.
static int
idewait(int checkerr)
  1021fc:	55                   	push   %ebp
  1021fd:	89 e5                	mov    %esp,%ebp
  1021ff:	56                   	push   %esi
  102200:	53                   	push   %ebx
{
  102201:	8b 55 08             	mov    0x8(%ebp),%edx
  102204:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  102207:	8b 45 10             	mov    0x10(%ebp),%eax
  10220a:	89 cb                	mov    %ecx,%ebx
  10220c:	89 de                	mov    %ebx,%esi
  10220e:	89 c1                	mov    %eax,%ecx
  102210:	fc                   	cld
  102211:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  102213:	89 c8                	mov    %ecx,%eax
  102215:	89 f3                	mov    %esi,%ebx
  102217:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  10221a:	89 45 10             	mov    %eax,0x10(%ebp)
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY);
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
  10221d:	90                   	nop
  10221e:	5b                   	pop    %ebx
  10221f:	5e                   	pop    %esi
  102220:	5d                   	pop    %ebp
  102221:	c3                   	ret

00102222 <noop>:
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
  102222:	55                   	push   %ebp
  102223:	89 e5                	mov    %esp,%ebp

  102225:	90                   	nop
  b->flags |= B_VALID;
  102226:	90                   	nop
  102227:	5d                   	pop    %ebp
  102228:	c3                   	ret

00102229 <idewait>:
{
  102229:	55                   	push   %ebp
  10222a:	89 e5                	mov    %esp,%ebp
  10222c:	83 ec 10             	sub    $0x10,%esp
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY);
  10222f:	90                   	nop
  102230:	68 f7 01 00 00       	push   $0x1f7
  102235:	e8 60 ff ff ff       	call   10219a <inb>
  10223a:	83 c4 04             	add    $0x4,%esp
  10223d:	0f b6 c0             	movzbl %al,%eax
  102240:	89 45 fc             	mov    %eax,-0x4(%ebp)
  102243:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102246:	25 c0 00 00 00       	and    $0xc0,%eax
  10224b:	83 f8 40             	cmp    $0x40,%eax
  10224e:	75 e0                	jne    102230 <idewait+0x7>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
  102250:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102254:	74 11                	je     102267 <idewait+0x3e>
  102256:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102259:	83 e0 21             	and    $0x21,%eax
  10225c:	85 c0                	test   %eax,%eax
  10225e:	74 07                	je     102267 <idewait+0x3e>
    return -1;
  102260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102265:	eb 05                	jmp    10226c <idewait+0x43>
  return 0;
  102267:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10226c:	c9                   	leave
  10226d:	c3                   	ret

0010226e <ideinit>:
{
  10226e:	55                   	push   %ebp
  10226f:	89 e5                	mov    %esp,%ebp
  102271:	83 ec 18             	sub    $0x18,%esp
  ioapicenable(IRQ_IDE, ncpu - 1);
  102274:	a1 c0 54 10 00       	mov    0x1054c0,%eax
  102279:	83 e8 01             	sub    $0x1,%eax
  10227c:	83 ec 08             	sub    $0x8,%esp
  10227f:	50                   	push   %eax
  102280:	6a 0e                	push   $0xe
  102282:	e8 1e e3 ff ff       	call   1005a5 <ioapicenable>
  102287:	83 c4 10             	add    $0x10,%esp
  idewait(0);
  10228a:	83 ec 0c             	sub    $0xc,%esp
  10228d:	6a 00                	push   $0x0
  10228f:	e8 95 ff ff ff       	call   102229 <idewait>
  102294:	83 c4 10             	add    $0x10,%esp
  outb(0x1f6, 0xe0 | (1<<4));
  102297:	83 ec 08             	sub    $0x8,%esp
  10229a:	68 f0 00 00 00       	push   $0xf0
  10229f:	68 f6 01 00 00       	push   $0x1f6
  1022a4:	e8 34 ff ff ff       	call   1021dd <outb>
  1022a9:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<1000; i++){
  1022ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1022b3:	eb 24                	jmp    1022d9 <ideinit+0x6b>
    if(inb(0x1f7) != 0){
  1022b5:	83 ec 0c             	sub    $0xc,%esp
  1022b8:	68 f7 01 00 00       	push   $0x1f7
  1022bd:	e8 d8 fe ff ff       	call   10219a <inb>
  1022c2:	83 c4 10             	add    $0x10,%esp
  1022c5:	84 c0                	test   %al,%al
  1022c7:	74 0c                	je     1022d5 <ideinit+0x67>
      havedisk1 = 1;
  1022c9:	c7 05 dc b3 10 00 01 	movl   $0x1,0x10b3dc
  1022d0:	00 00 00 
      break;
  1022d3:	eb 0d                	jmp    1022e2 <ideinit+0x74>
  for(i=0; i<1000; i++){
  1022d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1022d9:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  1022e0:	7e d3                	jle    1022b5 <ideinit+0x47>
  outb(0x1f6, 0xe0 | (0<<4));
  1022e2:	83 ec 08             	sub    $0x8,%esp
  1022e5:	68 e0 00 00 00       	push   $0xe0
  1022ea:	68 f6 01 00 00       	push   $0x1f6
  1022ef:	e8 e9 fe ff ff       	call   1021dd <outb>
  1022f4:	83 c4 10             	add    $0x10,%esp
}
  1022f7:	90                   	nop
  1022f8:	c9                   	leave
  1022f9:	c3                   	ret

001022fa <idestart>:
{
  1022fa:	55                   	push   %ebp
  1022fb:	89 e5                	mov    %esp,%ebp
  1022fd:	83 ec 18             	sub    $0x18,%esp
  if(b == 0)
  102300:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102304:	75 0d                	jne    102313 <idestart+0x19>
    panic("idestart");
  102306:	83 ec 0c             	sub    $0xc,%esp
  102309:	68 43 43 10 00       	push   $0x104343
  10230e:	e8 9b df ff ff       	call   1002ae <panic>
  if(b->blockno >= FSSIZE)
  102313:	8b 45 08             	mov    0x8(%ebp),%eax
  102316:	8b 40 08             	mov    0x8(%eax),%eax
  102319:	3d e7 03 00 00       	cmp    $0x3e7,%eax
  10231e:	76 0d                	jbe    10232d <idestart+0x33>
    panic("incorrect blockno");
  102320:	83 ec 0c             	sub    $0xc,%esp
  102323:	68 4c 43 10 00       	push   $0x10434c
  102328:	e8 81 df ff ff       	call   1002ae <panic>
  int sector_per_block =  BSIZE/SECTOR_SIZE;
  10232d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  int sector = b->blockno * sector_per_block;
  102334:	8b 45 08             	mov    0x8(%ebp),%eax
  102337:	8b 50 08             	mov    0x8(%eax),%edx
  10233a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10233d:	0f af c2             	imul   %edx,%eax
  102340:	89 45 f0             	mov    %eax,-0x10(%ebp)
  int read_cmd = (sector_per_block == 1) ? IDE_CMD_READ :  IDE_CMD_RDMUL;
  102343:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  102347:	75 07                	jne    102350 <idestart+0x56>
  102349:	b8 20 00 00 00       	mov    $0x20,%eax
  10234e:	eb 05                	jmp    102355 <idestart+0x5b>
  102350:	b8 c4 00 00 00       	mov    $0xc4,%eax
  102355:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int write_cmd = (sector_per_block == 1) ? IDE_CMD_WRITE : IDE_CMD_WRMUL;
  102358:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  10235c:	75 07                	jne    102365 <idestart+0x6b>
  10235e:	b8 30 00 00 00       	mov    $0x30,%eax
  102363:	eb 05                	jmp    10236a <idestart+0x70>
  102365:	b8 c5 00 00 00       	mov    $0xc5,%eax
  10236a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if (sector_per_block > 7) panic("idestart");
  10236d:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
  102371:	7e 0d                	jle    102380 <idestart+0x86>
  102373:	83 ec 0c             	sub    $0xc,%esp
  102376:	68 43 43 10 00       	push   $0x104343
  10237b:	e8 2e df ff ff       	call   1002ae <panic>
  idewait(0);
  102380:	83 ec 0c             	sub    $0xc,%esp
  102383:	6a 00                	push   $0x0
  102385:	e8 9f fe ff ff       	call   102229 <idewait>
  10238a:	83 c4 10             	add    $0x10,%esp
  outb(0x3f6, 0);  // generate interrupt
  10238d:	83 ec 08             	sub    $0x8,%esp
  102390:	6a 00                	push   $0x0
  102392:	68 f6 03 00 00       	push   $0x3f6
  102397:	e8 41 fe ff ff       	call   1021dd <outb>
  10239c:	83 c4 10             	add    $0x10,%esp
  outb(0x1f2, sector_per_block);  // number of sectors
  10239f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1023a2:	0f b6 c0             	movzbl %al,%eax
  1023a5:	83 ec 08             	sub    $0x8,%esp
  1023a8:	50                   	push   %eax
  1023a9:	68 f2 01 00 00       	push   $0x1f2
  1023ae:	e8 2a fe ff ff       	call   1021dd <outb>
  1023b3:	83 c4 10             	add    $0x10,%esp
  outb(0x1f3, sector & 0xff);
  1023b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1023b9:	0f b6 c0             	movzbl %al,%eax
  1023bc:	83 ec 08             	sub    $0x8,%esp
  1023bf:	50                   	push   %eax
  1023c0:	68 f3 01 00 00       	push   $0x1f3
  1023c5:	e8 13 fe ff ff       	call   1021dd <outb>
  1023ca:	83 c4 10             	add    $0x10,%esp
  outb(0x1f4, (sector >> 8) & 0xff);
  1023cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1023d0:	c1 f8 08             	sar    $0x8,%eax
  1023d3:	0f b6 c0             	movzbl %al,%eax
  1023d6:	83 ec 08             	sub    $0x8,%esp
  1023d9:	50                   	push   %eax
  1023da:	68 f4 01 00 00       	push   $0x1f4
  1023df:	e8 f9 fd ff ff       	call   1021dd <outb>
  1023e4:	83 c4 10             	add    $0x10,%esp
  outb(0x1f5, (sector >> 16) & 0xff);
  1023e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1023ea:	c1 f8 10             	sar    $0x10,%eax
  1023ed:	0f b6 c0             	movzbl %al,%eax
  1023f0:	83 ec 08             	sub    $0x8,%esp
  1023f3:	50                   	push   %eax
  1023f4:	68 f5 01 00 00       	push   $0x1f5
  1023f9:	e8 df fd ff ff       	call   1021dd <outb>
  1023fe:	83 c4 10             	add    $0x10,%esp
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  102401:	8b 45 08             	mov    0x8(%ebp),%eax
  102404:	8b 40 04             	mov    0x4(%eax),%eax
  102407:	c1 e0 04             	shl    $0x4,%eax
  10240a:	83 e0 10             	and    $0x10,%eax
  10240d:	89 c2                	mov    %eax,%edx
  10240f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102412:	c1 f8 18             	sar    $0x18,%eax
  102415:	83 e0 0f             	and    $0xf,%eax
  102418:	09 d0                	or     %edx,%eax
  10241a:	83 c8 e0             	or     $0xffffffe0,%eax
  10241d:	0f b6 c0             	movzbl %al,%eax
  102420:	83 ec 08             	sub    $0x8,%esp
  102423:	50                   	push   %eax
  102424:	68 f6 01 00 00       	push   $0x1f6
  102429:	e8 af fd ff ff       	call   1021dd <outb>
  10242e:	83 c4 10             	add    $0x10,%esp
  if(b->flags & B_DIRTY){
  102431:	8b 45 08             	mov    0x8(%ebp),%eax
  102434:	8b 00                	mov    (%eax),%eax
  102436:	83 e0 04             	and    $0x4,%eax
  102439:	85 c0                	test   %eax,%eax
  10243b:	74 35                	je     102472 <idestart+0x178>
    outb(0x1f7, write_cmd);
  10243d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102440:	0f b6 c0             	movzbl %al,%eax
  102443:	83 ec 08             	sub    $0x8,%esp
  102446:	50                   	push   %eax
  102447:	68 f7 01 00 00       	push   $0x1f7
  10244c:	e8 8c fd ff ff       	call   1021dd <outb>
  102451:	83 c4 10             	add    $0x10,%esp
    outsl(0x1f0, b->data, BSIZE/4);
  102454:	8b 45 08             	mov    0x8(%ebp),%eax
  102457:	83 c0 1c             	add    $0x1c,%eax
  10245a:	83 ec 04             	sub    $0x4,%esp
  10245d:	68 80 00 00 00       	push   $0x80
  102462:	50                   	push   %eax
  102463:	68 f0 01 00 00       	push   $0x1f0
  102468:	e8 8f fd ff ff       	call   1021fc <outsl>
  10246d:	83 c4 10             	add    $0x10,%esp
}
  102470:	eb 17                	jmp    102489 <idestart+0x18f>
    outb(0x1f7, read_cmd);
  102472:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102475:	0f b6 c0             	movzbl %al,%eax
  102478:	83 ec 08             	sub    $0x8,%esp
  10247b:	50                   	push   %eax
  10247c:	68 f7 01 00 00       	push   $0x1f7
  102481:	e8 57 fd ff ff       	call   1021dd <outb>
  102486:	83 c4 10             	add    $0x10,%esp
}
  102489:	90                   	nop
  10248a:	c9                   	leave
  10248b:	c3                   	ret

0010248c <ideintr>:
{
  10248c:	55                   	push   %ebp
  10248d:	89 e5                	mov    %esp,%ebp
  10248f:	83 ec 18             	sub    $0x18,%esp
  if((b = idequeue) == 0){
  102492:	a1 d8 b3 10 00       	mov    0x10b3d8,%eax
  102497:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10249a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10249e:	74 78                	je     102518 <ideintr+0x8c>
  idequeue = b->qnext;
  1024a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1024a3:	8b 40 18             	mov    0x18(%eax),%eax
  1024a6:	a3 d8 b3 10 00       	mov    %eax,0x10b3d8
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
  1024ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1024ae:	8b 00                	mov    (%eax),%eax
  1024b0:	83 e0 04             	and    $0x4,%eax
  1024b3:	85 c0                	test   %eax,%eax
  1024b5:	75 27                	jne    1024de <ideintr+0x52>
  1024b7:	6a 01                	push   $0x1
  1024b9:	e8 6b fd ff ff       	call   102229 <idewait>
  1024be:	83 c4 04             	add    $0x4,%esp
  1024c1:	85 c0                	test   %eax,%eax
  1024c3:	78 19                	js     1024de <ideintr+0x52>
    insl(0x1f0, b->data, BSIZE/4);
  1024c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1024c8:	83 c0 1c             	add    $0x1c,%eax
  1024cb:	68 80 00 00 00       	push   $0x80
  1024d0:	50                   	push   %eax
  1024d1:	68 f0 01 00 00       	push   $0x1f0
  1024d6:	e8 dc fc ff ff       	call   1021b7 <insl>
  1024db:	83 c4 0c             	add    $0xc,%esp
  b->flags |= B_VALID;
  1024de:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1024e1:	8b 00                	mov    (%eax),%eax
  1024e3:	83 c8 02             	or     $0x2,%eax
  1024e6:	89 c2                	mov    %eax,%edx
  1024e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1024eb:	89 10                	mov    %edx,(%eax)
  b->flags &= ~B_DIRTY;
  1024ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1024f0:	8b 00                	mov    (%eax),%eax
  1024f2:	83 e0 fb             	and    $0xfffffffb,%eax
  1024f5:	89 c2                	mov    %eax,%edx
  1024f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1024fa:	89 10                	mov    %edx,(%eax)

  // Start disk on next buf in queue.
  if(idequeue != 0)
  1024fc:	a1 d8 b3 10 00       	mov    0x10b3d8,%eax
  102501:	85 c0                	test   %eax,%eax
  102503:	74 14                	je     102519 <ideintr+0x8d>
    idestart(idequeue);
  102505:	a1 d8 b3 10 00       	mov    0x10b3d8,%eax
  10250a:	83 ec 0c             	sub    $0xc,%esp
  10250d:	50                   	push   %eax
  10250e:	e8 e7 fd ff ff       	call   1022fa <idestart>
  102513:	83 c4 10             	add    $0x10,%esp
  102516:	eb 01                	jmp    102519 <ideintr+0x8d>
    return;
  102518:	90                   	nop
}
  102519:	c9                   	leave
  10251a:	c3                   	ret

0010251b <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
  10251b:	55                   	push   %ebp
  10251c:	89 e5                	mov    %esp,%ebp
  10251e:	83 ec 18             	sub    $0x18,%esp
  struct buf **pp;

  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
  102521:	8b 45 08             	mov    0x8(%ebp),%eax
  102524:	8b 00                	mov    (%eax),%eax
  102526:	83 e0 06             	and    $0x6,%eax
  102529:	83 f8 02             	cmp    $0x2,%eax
  10252c:	75 0d                	jne    10253b <iderw+0x20>
    panic("iderw: nothing to do");
  10252e:	83 ec 0c             	sub    $0xc,%esp
  102531:	68 5e 43 10 00       	push   $0x10435e
  102536:	e8 73 dd ff ff       	call   1002ae <panic>
  if(b->dev != 0 && !havedisk1)
  10253b:	8b 45 08             	mov    0x8(%ebp),%eax
  10253e:	8b 40 04             	mov    0x4(%eax),%eax
  102541:	85 c0                	test   %eax,%eax
  102543:	74 16                	je     10255b <iderw+0x40>
  102545:	a1 dc b3 10 00       	mov    0x10b3dc,%eax
  10254a:	85 c0                	test   %eax,%eax
  10254c:	75 0d                	jne    10255b <iderw+0x40>
    panic("iderw: ide disk 1 not present");
  10254e:	83 ec 0c             	sub    $0xc,%esp
  102551:	68 73 43 10 00       	push   $0x104373
  102556:	e8 53 dd ff ff       	call   1002ae <panic>

  // Append b to idequeue.
  b->qnext = 0;
  10255b:	8b 45 08             	mov    0x8(%ebp),%eax
  10255e:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
  102565:	c7 45 f4 d8 b3 10 00 	movl   $0x10b3d8,-0xc(%ebp)
  10256c:	eb 0b                	jmp    102579 <iderw+0x5e>
  10256e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102571:	8b 00                	mov    (%eax),%eax
  102573:	83 c0 18             	add    $0x18,%eax
  102576:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102579:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10257c:	8b 00                	mov    (%eax),%eax
  10257e:	85 c0                	test   %eax,%eax
  102580:	75 ec                	jne    10256e <iderw+0x53>
    ;
  *pp = b;
  102582:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102585:	8b 55 08             	mov    0x8(%ebp),%edx
  102588:	89 10                	mov    %edx,(%eax)

  // Start disk if necessary.
  if(idequeue == b)
  10258a:	a1 d8 b3 10 00       	mov    0x10b3d8,%eax
  10258f:	39 45 08             	cmp    %eax,0x8(%ebp)
  102592:	75 15                	jne    1025a9 <iderw+0x8e>
    idestart(b);
  102594:	83 ec 0c             	sub    $0xc,%esp
  102597:	ff 75 08             	push   0x8(%ebp)
  10259a:	e8 5b fd ff ff       	call   1022fa <idestart>
  10259f:	83 c4 10             	add    $0x10,%esp

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID)
  1025a2:	eb 05                	jmp    1025a9 <iderw+0x8e>
  {
    // Warning: If we do not call noop(), compiler generates code that does not
    // read "b->flags" again and therefore never come out of this while loop. 
    // "b->flags" is modified by the trap handler in ideintr().  
    noop();
  1025a4:	e8 79 fc ff ff       	call   102222 <noop>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID)
  1025a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1025ac:	8b 00                	mov    (%eax),%eax
  1025ae:	83 e0 06             	and    $0x6,%eax
  1025b1:	83 f8 02             	cmp    $0x2,%eax
  1025b4:	75 ee                	jne    1025a4 <iderw+0x89>
  }
}
  1025b6:	90                   	nop
  1025b7:	90                   	nop
  1025b8:	c9                   	leave
  1025b9:	c3                   	ret

001025ba <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
  1025ba:	55                   	push   %ebp
  1025bb:	89 e5                	mov    %esp,%ebp
  1025bd:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;

  bp = bread(dev, 1);
  1025c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1025c3:	83 ec 08             	sub    $0x8,%esp
  1025c6:	6a 01                	push   $0x1
  1025c8:	50                   	push   %eax
  1025c9:	e8 6d fa ff ff       	call   10203b <bread>
  1025ce:	83 c4 10             	add    $0x10,%esp
  1025d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memmove(sb, bp->data, sizeof(*sb));
  1025d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1025d7:	83 c0 1c             	add    $0x1c,%eax
  1025da:	83 ec 04             	sub    $0x4,%esp
  1025dd:	6a 1c                	push   $0x1c
  1025df:	50                   	push   %eax
  1025e0:	ff 75 0c             	push   0xc(%ebp)
  1025e3:	e8 84 e9 ff ff       	call   100f6c <memmove>
  1025e8:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  1025eb:	83 ec 0c             	sub    $0xc,%esp
  1025ee:	ff 75 f4             	push   -0xc(%ebp)
  1025f1:	e8 3e fb ff ff       	call   102134 <brelse>
  1025f6:	83 c4 10             	add    $0x10,%esp
}
  1025f9:	90                   	nop
  1025fa:	c9                   	leave
  1025fb:	c3                   	ret

001025fc <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
  1025fc:	55                   	push   %ebp
  1025fd:	89 e5                	mov    %esp,%ebp
  1025ff:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;

  bp = bread_wr(dev, bno);
  102602:	8b 55 0c             	mov    0xc(%ebp),%edx
  102605:	8b 45 08             	mov    0x8(%ebp),%eax
  102608:	83 ec 08             	sub    $0x8,%esp
  10260b:	52                   	push   %edx
  10260c:	50                   	push   %eax
  10260d:	e8 88 fa ff ff       	call   10209a <bread_wr>
  102612:	83 c4 10             	add    $0x10,%esp
  102615:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(bp->data, 0, BSIZE);
  102618:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10261b:	83 c0 1c             	add    $0x1c,%eax
  10261e:	83 ec 04             	sub    $0x4,%esp
  102621:	68 00 02 00 00       	push   $0x200
  102626:	6a 00                	push   $0x0
  102628:	50                   	push   %eax
  102629:	e8 7f e8 ff ff       	call   100ead <memset>
  10262e:	83 c4 10             	add    $0x10,%esp
  log_write(bp);
  102631:	83 ec 0c             	sub    $0xc,%esp
  102634:	ff 75 f4             	push   -0xc(%ebp)
  102637:	e8 2a 19 00 00       	call   103f66 <log_write>
  10263c:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  10263f:	83 ec 0c             	sub    $0xc,%esp
  102642:	ff 75 f4             	push   -0xc(%ebp)
  102645:	e8 ea fa ff ff       	call   102134 <brelse>
  10264a:	83 c4 10             	add    $0x10,%esp
}
  10264d:	90                   	nop
  10264e:	c9                   	leave
  10264f:	c3                   	ret

00102650 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
  102650:	55                   	push   %ebp
  102651:	89 e5                	mov    %esp,%ebp
  102653:	83 ec 18             	sub    $0x18,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  102656:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(b = 0; b < sb.size; b += BPB){
  10265d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102664:	e9 0b 01 00 00       	jmp    102774 <balloc+0x124>
    bp = bread_wr(dev, BBLOCK(b, sb));
  102669:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10266c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  102672:	85 c0                	test   %eax,%eax
  102674:	0f 48 c2             	cmovs  %edx,%eax
  102677:	c1 f8 0c             	sar    $0xc,%eax
  10267a:	89 c2                	mov    %eax,%edx
  10267c:	a1 f8 b3 10 00       	mov    0x10b3f8,%eax
  102681:	01 d0                	add    %edx,%eax
  102683:	83 ec 08             	sub    $0x8,%esp
  102686:	50                   	push   %eax
  102687:	ff 75 08             	push   0x8(%ebp)
  10268a:	e8 0b fa ff ff       	call   10209a <bread_wr>
  10268f:	83 c4 10             	add    $0x10,%esp
  102692:	89 45 ec             	mov    %eax,-0x14(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
  102695:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  10269c:	e9 9e 00 00 00       	jmp    10273f <balloc+0xef>
      m = 1 << (bi % 8);
  1026a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1026a4:	83 e0 07             	and    $0x7,%eax
  1026a7:	ba 01 00 00 00       	mov    $0x1,%edx
  1026ac:	89 c1                	mov    %eax,%ecx
  1026ae:	d3 e2                	shl    %cl,%edx
  1026b0:	89 d0                	mov    %edx,%eax
  1026b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
  1026b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1026b8:	8d 50 07             	lea    0x7(%eax),%edx
  1026bb:	85 c0                	test   %eax,%eax
  1026bd:	0f 48 c2             	cmovs  %edx,%eax
  1026c0:	c1 f8 03             	sar    $0x3,%eax
  1026c3:	89 c2                	mov    %eax,%edx
  1026c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1026c8:	0f b6 44 10 1c       	movzbl 0x1c(%eax,%edx,1),%eax
  1026cd:	0f b6 c0             	movzbl %al,%eax
  1026d0:	23 45 e8             	and    -0x18(%ebp),%eax
  1026d3:	85 c0                	test   %eax,%eax
  1026d5:	75 64                	jne    10273b <balloc+0xeb>
        bp->data[bi/8] |= m;  // Mark block in use.
  1026d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1026da:	8d 50 07             	lea    0x7(%eax),%edx
  1026dd:	85 c0                	test   %eax,%eax
  1026df:	0f 48 c2             	cmovs  %edx,%eax
  1026e2:	c1 f8 03             	sar    $0x3,%eax
  1026e5:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1026e8:	0f b6 54 02 1c       	movzbl 0x1c(%edx,%eax,1),%edx
  1026ed:	89 d1                	mov    %edx,%ecx
  1026ef:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1026f2:	09 ca                	or     %ecx,%edx
  1026f4:	89 d1                	mov    %edx,%ecx
  1026f6:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1026f9:	88 4c 02 1c          	mov    %cl,0x1c(%edx,%eax,1)
        log_write(bp);
  1026fd:	83 ec 0c             	sub    $0xc,%esp
  102700:	ff 75 ec             	push   -0x14(%ebp)
  102703:	e8 5e 18 00 00       	call   103f66 <log_write>
  102708:	83 c4 10             	add    $0x10,%esp
        brelse(bp);
  10270b:	83 ec 0c             	sub    $0xc,%esp
  10270e:	ff 75 ec             	push   -0x14(%ebp)
  102711:	e8 1e fa ff ff       	call   102134 <brelse>
  102716:	83 c4 10             	add    $0x10,%esp
        bzero(dev, b + bi);
  102719:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10271c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10271f:	01 c2                	add    %eax,%edx
  102721:	8b 45 08             	mov    0x8(%ebp),%eax
  102724:	83 ec 08             	sub    $0x8,%esp
  102727:	52                   	push   %edx
  102728:	50                   	push   %eax
  102729:	e8 ce fe ff ff       	call   1025fc <bzero>
  10272e:	83 c4 10             	add    $0x10,%esp
        return b + bi;
  102731:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102734:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102737:	01 d0                	add    %edx,%eax
  102739:	eb 56                	jmp    102791 <balloc+0x141>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
  10273b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  10273f:	81 7d f0 ff 0f 00 00 	cmpl   $0xfff,-0x10(%ebp)
  102746:	7f 17                	jg     10275f <balloc+0x10f>
  102748:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10274b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10274e:	01 d0                	add    %edx,%eax
  102750:	89 c2                	mov    %eax,%edx
  102752:	a1 e0 b3 10 00       	mov    0x10b3e0,%eax
  102757:	39 c2                	cmp    %eax,%edx
  102759:	0f 82 42 ff ff ff    	jb     1026a1 <balloc+0x51>
      }
    }
    brelse(bp);
  10275f:	83 ec 0c             	sub    $0xc,%esp
  102762:	ff 75 ec             	push   -0x14(%ebp)
  102765:	e8 ca f9 ff ff       	call   102134 <brelse>
  10276a:	83 c4 10             	add    $0x10,%esp
  for(b = 0; b < sb.size; b += BPB){
  10276d:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  102774:	a1 e0 b3 10 00       	mov    0x10b3e0,%eax
  102779:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10277c:	39 c2                	cmp    %eax,%edx
  10277e:	0f 82 e5 fe ff ff    	jb     102669 <balloc+0x19>
  }
  panic("balloc: out of blocks");
  102784:	83 ec 0c             	sub    $0xc,%esp
  102787:	68 94 43 10 00       	push   $0x104394
  10278c:	e8 1d db ff ff       	call   1002ae <panic>
}
  102791:	c9                   	leave
  102792:	c3                   	ret

00102793 <bfree>:


// Free a disk block.
static void
bfree(int dev, uint b)
{
  102793:	55                   	push   %ebp
  102794:	89 e5                	mov    %esp,%ebp
  102796:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  int bi, m;

  bp = bread_wr(dev, BBLOCK(b, sb));
  102799:	8b 45 0c             	mov    0xc(%ebp),%eax
  10279c:	c1 e8 0c             	shr    $0xc,%eax
  10279f:	89 c2                	mov    %eax,%edx
  1027a1:	a1 f8 b3 10 00       	mov    0x10b3f8,%eax
  1027a6:	01 c2                	add    %eax,%edx
  1027a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1027ab:	83 ec 08             	sub    $0x8,%esp
  1027ae:	52                   	push   %edx
  1027af:	50                   	push   %eax
  1027b0:	e8 e5 f8 ff ff       	call   10209a <bread_wr>
  1027b5:	83 c4 10             	add    $0x10,%esp
  1027b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  bi = b % BPB;
  1027bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027be:	25 ff 0f 00 00       	and    $0xfff,%eax
  1027c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  m = 1 << (bi % 8);
  1027c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027c9:	83 e0 07             	and    $0x7,%eax
  1027cc:	ba 01 00 00 00       	mov    $0x1,%edx
  1027d1:	89 c1                	mov    %eax,%ecx
  1027d3:	d3 e2                	shl    %cl,%edx
  1027d5:	89 d0                	mov    %edx,%eax
  1027d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((bp->data[bi/8] & m) == 0)
  1027da:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027dd:	8d 50 07             	lea    0x7(%eax),%edx
  1027e0:	85 c0                	test   %eax,%eax
  1027e2:	0f 48 c2             	cmovs  %edx,%eax
  1027e5:	c1 f8 03             	sar    $0x3,%eax
  1027e8:	89 c2                	mov    %eax,%edx
  1027ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1027ed:	0f b6 44 10 1c       	movzbl 0x1c(%eax,%edx,1),%eax
  1027f2:	0f b6 c0             	movzbl %al,%eax
  1027f5:	23 45 ec             	and    -0x14(%ebp),%eax
  1027f8:	85 c0                	test   %eax,%eax
  1027fa:	75 0d                	jne    102809 <bfree+0x76>
    panic("freeing free block");
  1027fc:	83 ec 0c             	sub    $0xc,%esp
  1027ff:	68 aa 43 10 00       	push   $0x1043aa
  102804:	e8 a5 da ff ff       	call   1002ae <panic>
  bp->data[bi/8] &= ~m;
  102809:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10280c:	8d 50 07             	lea    0x7(%eax),%edx
  10280f:	85 c0                	test   %eax,%eax
  102811:	0f 48 c2             	cmovs  %edx,%eax
  102814:	c1 f8 03             	sar    $0x3,%eax
  102817:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10281a:	0f b6 54 02 1c       	movzbl 0x1c(%edx,%eax,1),%edx
  10281f:	89 d1                	mov    %edx,%ecx
  102821:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102824:	f7 d2                	not    %edx
  102826:	21 ca                	and    %ecx,%edx
  102828:	89 d1                	mov    %edx,%ecx
  10282a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10282d:	88 4c 02 1c          	mov    %cl,0x1c(%edx,%eax,1)
  log_write(bp);
  102831:	83 ec 0c             	sub    $0xc,%esp
  102834:	ff 75 f4             	push   -0xc(%ebp)
  102837:	e8 2a 17 00 00       	call   103f66 <log_write>
  10283c:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  10283f:	83 ec 0c             	sub    $0xc,%esp
  102842:	ff 75 f4             	push   -0xc(%ebp)
  102845:	e8 ea f8 ff ff       	call   102134 <brelse>
  10284a:	83 c4 10             	add    $0x10,%esp
}
  10284d:	90                   	nop
  10284e:	c9                   	leave
  10284f:	c3                   	ret

00102850 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
  102850:	55                   	push   %ebp
  102851:	89 e5                	mov    %esp,%ebp
  102853:	57                   	push   %edi
  102854:	56                   	push   %esi
  102855:	53                   	push   %ebx
  102856:	83 ec 1c             	sub    $0x1c,%esp
  readsb(dev, &sb);
  102859:	83 ec 08             	sub    $0x8,%esp
  10285c:	68 e0 b3 10 00       	push   $0x10b3e0
  102861:	ff 75 08             	push   0x8(%ebp)
  102864:	e8 51 fd ff ff       	call   1025ba <readsb>
  102869:	83 c4 10             	add    $0x10,%esp
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
  10286c:	a1 f8 b3 10 00       	mov    0x10b3f8,%eax
  102871:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102874:	8b 3d f4 b3 10 00    	mov    0x10b3f4,%edi
  10287a:	8b 35 f0 b3 10 00    	mov    0x10b3f0,%esi
  102880:	8b 1d ec b3 10 00    	mov    0x10b3ec,%ebx
  102886:	8b 0d e8 b3 10 00    	mov    0x10b3e8,%ecx
  10288c:	8b 15 e4 b3 10 00    	mov    0x10b3e4,%edx
  102892:	a1 e0 b3 10 00       	mov    0x10b3e0,%eax
  102897:	ff 75 e4             	push   -0x1c(%ebp)
  10289a:	57                   	push   %edi
  10289b:	56                   	push   %esi
  10289c:	53                   	push   %ebx
  10289d:	51                   	push   %ecx
  10289e:	52                   	push   %edx
  10289f:	50                   	push   %eax
  1028a0:	68 c0 43 10 00       	push   $0x1043c0
  1028a5:	e8 42 d8 ff ff       	call   1000ec <cprintf>
  1028aa:	83 c4 20             	add    $0x20,%esp
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
  1028ad:	90                   	nop
  1028ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1028b1:	5b                   	pop    %ebx
  1028b2:	5e                   	pop    %esi
  1028b3:	5f                   	pop    %edi
  1028b4:	5d                   	pop    %ebp
  1028b5:	c3                   	ret

001028b6 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
  1028b6:	55                   	push   %ebp
  1028b7:	89 e5                	mov    %esp,%ebp
  1028b9:	83 ec 28             	sub    $0x28,%esp
  1028bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028bf:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
  1028c3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  1028ca:	e9 9e 00 00 00       	jmp    10296d <ialloc+0xb7>
    bp = bread_wr(dev, IBLOCK(inum, sb));
  1028cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1028d2:	c1 e8 03             	shr    $0x3,%eax
  1028d5:	89 c2                	mov    %eax,%edx
  1028d7:	a1 f4 b3 10 00       	mov    0x10b3f4,%eax
  1028dc:	01 d0                	add    %edx,%eax
  1028de:	83 ec 08             	sub    $0x8,%esp
  1028e1:	50                   	push   %eax
  1028e2:	ff 75 08             	push   0x8(%ebp)
  1028e5:	e8 b0 f7 ff ff       	call   10209a <bread_wr>
  1028ea:	83 c4 10             	add    $0x10,%esp
  1028ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    dip = (struct dinode*)bp->data + inum%IPB;
  1028f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028f3:	8d 50 1c             	lea    0x1c(%eax),%edx
  1028f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1028f9:	83 e0 07             	and    $0x7,%eax
  1028fc:	c1 e0 06             	shl    $0x6,%eax
  1028ff:	01 d0                	add    %edx,%eax
  102901:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(dip->type == 0){  // a free inode
  102904:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102907:	0f b7 00             	movzwl (%eax),%eax
  10290a:	66 85 c0             	test   %ax,%ax
  10290d:	75 4c                	jne    10295b <ialloc+0xa5>
      memset(dip, 0, sizeof(*dip));
  10290f:	83 ec 04             	sub    $0x4,%esp
  102912:	6a 40                	push   $0x40
  102914:	6a 00                	push   $0x0
  102916:	ff 75 ec             	push   -0x14(%ebp)
  102919:	e8 8f e5 ff ff       	call   100ead <memset>
  10291e:	83 c4 10             	add    $0x10,%esp
      dip->type = type;
  102921:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102924:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
  102928:	66 89 10             	mov    %dx,(%eax)
      log_write(bp);   // mark it allocated on the disk
  10292b:	83 ec 0c             	sub    $0xc,%esp
  10292e:	ff 75 f0             	push   -0x10(%ebp)
  102931:	e8 30 16 00 00       	call   103f66 <log_write>
  102936:	83 c4 10             	add    $0x10,%esp
      brelse(bp);
  102939:	83 ec 0c             	sub    $0xc,%esp
  10293c:	ff 75 f0             	push   -0x10(%ebp)
  10293f:	e8 f0 f7 ff ff       	call   102134 <brelse>
  102944:	83 c4 10             	add    $0x10,%esp
      return iget(dev, inum);
  102947:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10294a:	83 ec 08             	sub    $0x8,%esp
  10294d:	50                   	push   %eax
  10294e:	ff 75 08             	push   0x8(%ebp)
  102951:	e8 63 01 00 00       	call   102ab9 <iget>
  102956:	83 c4 10             	add    $0x10,%esp
  102959:	eb 2f                	jmp    10298a <ialloc+0xd4>
    }
    brelse(bp);
  10295b:	83 ec 0c             	sub    $0xc,%esp
  10295e:	ff 75 f0             	push   -0x10(%ebp)
  102961:	e8 ce f7 ff ff       	call   102134 <brelse>
  102966:	83 c4 10             	add    $0x10,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
  102969:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10296d:	a1 e8 b3 10 00       	mov    0x10b3e8,%eax
  102972:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102975:	39 c2                	cmp    %eax,%edx
  102977:	0f 82 52 ff ff ff    	jb     1028cf <ialloc+0x19>
  }
  panic("ialloc: no inodes");
  10297d:	83 ec 0c             	sub    $0xc,%esp
  102980:	68 13 44 10 00       	push   $0x104413
  102985:	e8 24 d9 ff ff       	call   1002ae <panic>
}
  10298a:	c9                   	leave
  10298b:	c3                   	ret

0010298c <iput>:
// be recycled.
// If that was the last reference and the inode has no links
// to it, free the inode (and its content) on disk.
void
iput(struct inode *ip)
{
  10298c:	55                   	push   %ebp
  10298d:	89 e5                	mov    %esp,%ebp
  10298f:	83 ec 18             	sub    $0x18,%esp
  if(ip->valid && ip->nlink == 0){
  102992:	8b 45 08             	mov    0x8(%ebp),%eax
  102995:	8b 40 0c             	mov    0xc(%eax),%eax
  102998:	85 c0                	test   %eax,%eax
  10299a:	74 4a                	je     1029e6 <iput+0x5a>
  10299c:	8b 45 08             	mov    0x8(%ebp),%eax
  10299f:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  1029a3:	66 85 c0             	test   %ax,%ax
  1029a6:	75 3e                	jne    1029e6 <iput+0x5a>
    int r = ip->ref;
  1029a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1029ab:	8b 40 08             	mov    0x8(%eax),%eax
  1029ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(r == 1){
  1029b1:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  1029b5:	75 2f                	jne    1029e6 <iput+0x5a>
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
  1029b7:	83 ec 0c             	sub    $0xc,%esp
  1029ba:	ff 75 08             	push   0x8(%ebp)
  1029bd:	e8 c1 03 00 00       	call   102d83 <itrunc>
  1029c2:	83 c4 10             	add    $0x10,%esp
      ip->type = 0;
  1029c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1029c8:	66 c7 40 10 00 00    	movw   $0x0,0x10(%eax)
      iupdate(ip);
  1029ce:	83 ec 0c             	sub    $0xc,%esp
  1029d1:	ff 75 08             	push   0x8(%ebp)
  1029d4:	e8 1f 00 00 00       	call   1029f8 <iupdate>
  1029d9:	83 c4 10             	add    $0x10,%esp
      ip->valid = 0;
  1029dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1029df:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    }
  }
  ip->ref--;
  1029e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1029e9:	8b 40 08             	mov    0x8(%eax),%eax
  1029ec:	8d 50 ff             	lea    -0x1(%eax),%edx
  1029ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1029f2:	89 50 08             	mov    %edx,0x8(%eax)
}
  1029f5:	90                   	nop
  1029f6:	c9                   	leave
  1029f7:	c3                   	ret

001029f8 <iupdate>:
// Copy a modified in-memory inode to disk.
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
void
iupdate(struct inode *ip)
{
  1029f8:	55                   	push   %ebp
  1029f9:	89 e5                	mov    %esp,%ebp
  1029fb:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  struct dinode *dip;

  bp = bread_wr(ip->dev, IBLOCK(ip->inum, sb));
  1029fe:	8b 45 08             	mov    0x8(%ebp),%eax
  102a01:	8b 40 04             	mov    0x4(%eax),%eax
  102a04:	c1 e8 03             	shr    $0x3,%eax
  102a07:	89 c2                	mov    %eax,%edx
  102a09:	a1 f4 b3 10 00       	mov    0x10b3f4,%eax
  102a0e:	01 c2                	add    %eax,%edx
  102a10:	8b 45 08             	mov    0x8(%ebp),%eax
  102a13:	8b 00                	mov    (%eax),%eax
  102a15:	83 ec 08             	sub    $0x8,%esp
  102a18:	52                   	push   %edx
  102a19:	50                   	push   %eax
  102a1a:	e8 7b f6 ff ff       	call   10209a <bread_wr>
  102a1f:	83 c4 10             	add    $0x10,%esp
  102a22:	89 45 f4             	mov    %eax,-0xc(%ebp)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  102a25:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a28:	8d 50 1c             	lea    0x1c(%eax),%edx
  102a2b:	8b 45 08             	mov    0x8(%ebp),%eax
  102a2e:	8b 40 04             	mov    0x4(%eax),%eax
  102a31:	83 e0 07             	and    $0x7,%eax
  102a34:	c1 e0 06             	shl    $0x6,%eax
  102a37:	01 d0                	add    %edx,%eax
  102a39:	89 45 f0             	mov    %eax,-0x10(%ebp)
  dip->type = ip->type;
  102a3c:	8b 45 08             	mov    0x8(%ebp),%eax
  102a3f:	0f b7 50 10          	movzwl 0x10(%eax),%edx
  102a43:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a46:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
  102a49:	8b 45 08             	mov    0x8(%ebp),%eax
  102a4c:	0f b7 50 12          	movzwl 0x12(%eax),%edx
  102a50:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a53:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
  102a57:	8b 45 08             	mov    0x8(%ebp),%eax
  102a5a:	0f b7 50 14          	movzwl 0x14(%eax),%edx
  102a5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a61:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
  102a65:	8b 45 08             	mov    0x8(%ebp),%eax
  102a68:	0f b7 50 16          	movzwl 0x16(%eax),%edx
  102a6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a6f:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
  102a73:	8b 45 08             	mov    0x8(%ebp),%eax
  102a76:	8b 50 18             	mov    0x18(%eax),%edx
  102a79:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a7c:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  102a7f:	8b 45 08             	mov    0x8(%ebp),%eax
  102a82:	8d 50 1c             	lea    0x1c(%eax),%edx
  102a85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a88:	83 c0 0c             	add    $0xc,%eax
  102a8b:	83 ec 04             	sub    $0x4,%esp
  102a8e:	6a 34                	push   $0x34
  102a90:	52                   	push   %edx
  102a91:	50                   	push   %eax
  102a92:	e8 d5 e4 ff ff       	call   100f6c <memmove>
  102a97:	83 c4 10             	add    $0x10,%esp
  log_write(bp);
  102a9a:	83 ec 0c             	sub    $0xc,%esp
  102a9d:	ff 75 f4             	push   -0xc(%ebp)
  102aa0:	e8 c1 14 00 00       	call   103f66 <log_write>
  102aa5:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  102aa8:	83 ec 0c             	sub    $0xc,%esp
  102aab:	ff 75 f4             	push   -0xc(%ebp)
  102aae:	e8 81 f6 ff ff       	call   102134 <brelse>
  102ab3:	83 c4 10             	add    $0x10,%esp
}
  102ab6:	90                   	nop
  102ab7:	c9                   	leave
  102ab8:	c3                   	ret

00102ab9 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
struct inode*
iget(uint dev, uint inum)
{
  102ab9:	55                   	push   %ebp
  102aba:	89 e5                	mov    %esp,%ebp
  102abc:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip, *empty;

  // Is the inode already cached?
  empty = 0;
  102abf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
  102ac6:	c7 45 f4 00 b4 10 00 	movl   $0x10b400,-0xc(%ebp)
  102acd:	eb 4d                	jmp    102b1c <iget+0x63>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
  102acf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ad2:	8b 40 08             	mov    0x8(%eax),%eax
  102ad5:	85 c0                	test   %eax,%eax
  102ad7:	7e 29                	jle    102b02 <iget+0x49>
  102ad9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102adc:	8b 00                	mov    (%eax),%eax
  102ade:	39 45 08             	cmp    %eax,0x8(%ebp)
  102ae1:	75 1f                	jne    102b02 <iget+0x49>
  102ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ae6:	8b 40 04             	mov    0x4(%eax),%eax
  102ae9:	39 45 0c             	cmp    %eax,0xc(%ebp)
  102aec:	75 14                	jne    102b02 <iget+0x49>
      ip->ref++;
  102aee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102af1:	8b 40 08             	mov    0x8(%eax),%eax
  102af4:	8d 50 01             	lea    0x1(%eax),%edx
  102af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102afa:	89 50 08             	mov    %edx,0x8(%eax)
      return ip;
  102afd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b00:	eb 64                	jmp    102b66 <iget+0xad>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
  102b02:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102b06:	75 10                	jne    102b18 <iget+0x5f>
  102b08:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b0b:	8b 40 08             	mov    0x8(%eax),%eax
  102b0e:	85 c0                	test   %eax,%eax
  102b10:	75 06                	jne    102b18 <iget+0x5f>
      empty = ip;
  102b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b15:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
  102b18:	83 45 f4 50          	addl   $0x50,-0xc(%ebp)
  102b1c:	81 7d f4 a0 c3 10 00 	cmpl   $0x10c3a0,-0xc(%ebp)
  102b23:	72 aa                	jb     102acf <iget+0x16>
  }

  // Recycle an inode cache entry.
  if(empty == 0)
  102b25:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102b29:	75 0d                	jne    102b38 <iget+0x7f>
    panic("iget: no inodes");
  102b2b:	83 ec 0c             	sub    $0xc,%esp
  102b2e:	68 25 44 10 00       	push   $0x104425
  102b33:	e8 76 d7 ff ff       	call   1002ae <panic>

  ip = empty;
  102b38:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  ip->dev = dev;
  102b3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b41:	8b 55 08             	mov    0x8(%ebp),%edx
  102b44:	89 10                	mov    %edx,(%eax)
  ip->inum = inum;
  102b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b49:	8b 55 0c             	mov    0xc(%ebp),%edx
  102b4c:	89 50 04             	mov    %edx,0x4(%eax)
  ip->ref = 1;
  102b4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b52:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  ip->valid = 0;
  102b59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b5c:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)

  return ip;
  102b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102b66:	c9                   	leave
  102b67:	c3                   	ret

00102b68 <iread>:

// Reads the inode from disk if necessary.
void
iread(struct inode *ip)
{
  102b68:	55                   	push   %ebp
  102b69:	89 e5                	mov    %esp,%ebp
  102b6b:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
  102b6e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102b72:	74 0a                	je     102b7e <iread+0x16>
  102b74:	8b 45 08             	mov    0x8(%ebp),%eax
  102b77:	8b 40 08             	mov    0x8(%eax),%eax
  102b7a:	85 c0                	test   %eax,%eax
  102b7c:	7f 0d                	jg     102b8b <iread+0x23>
    panic("iread");
  102b7e:	83 ec 0c             	sub    $0xc,%esp
  102b81:	68 35 44 10 00       	push   $0x104435
  102b86:	e8 23 d7 ff ff       	call   1002ae <panic>

  if(ip->valid == 0){
  102b8b:	8b 45 08             	mov    0x8(%ebp),%eax
  102b8e:	8b 40 0c             	mov    0xc(%eax),%eax
  102b91:	85 c0                	test   %eax,%eax
  102b93:	0f 85 cd 00 00 00    	jne    102c66 <iread+0xfe>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  102b99:	8b 45 08             	mov    0x8(%ebp),%eax
  102b9c:	8b 40 04             	mov    0x4(%eax),%eax
  102b9f:	c1 e8 03             	shr    $0x3,%eax
  102ba2:	89 c2                	mov    %eax,%edx
  102ba4:	a1 f4 b3 10 00       	mov    0x10b3f4,%eax
  102ba9:	01 c2                	add    %eax,%edx
  102bab:	8b 45 08             	mov    0x8(%ebp),%eax
  102bae:	8b 00                	mov    (%eax),%eax
  102bb0:	83 ec 08             	sub    $0x8,%esp
  102bb3:	52                   	push   %edx
  102bb4:	50                   	push   %eax
  102bb5:	e8 81 f4 ff ff       	call   10203b <bread>
  102bba:	83 c4 10             	add    $0x10,%esp
  102bbd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
  102bc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bc3:	8d 50 1c             	lea    0x1c(%eax),%edx
  102bc6:	8b 45 08             	mov    0x8(%ebp),%eax
  102bc9:	8b 40 04             	mov    0x4(%eax),%eax
  102bcc:	83 e0 07             	and    $0x7,%eax
  102bcf:	c1 e0 06             	shl    $0x6,%eax
  102bd2:	01 d0                	add    %edx,%eax
  102bd4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    ip->type = dip->type;
  102bd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bda:	0f b7 10             	movzwl (%eax),%edx
  102bdd:	8b 45 08             	mov    0x8(%ebp),%eax
  102be0:	66 89 50 10          	mov    %dx,0x10(%eax)
    ip->major = dip->major;
  102be4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102be7:	0f b7 50 02          	movzwl 0x2(%eax),%edx
  102beb:	8b 45 08             	mov    0x8(%ebp),%eax
  102bee:	66 89 50 12          	mov    %dx,0x12(%eax)
    ip->minor = dip->minor;
  102bf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bf5:	0f b7 50 04          	movzwl 0x4(%eax),%edx
  102bf9:	8b 45 08             	mov    0x8(%ebp),%eax
  102bfc:	66 89 50 14          	mov    %dx,0x14(%eax)
    ip->nlink = dip->nlink;
  102c00:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c03:	0f b7 50 06          	movzwl 0x6(%eax),%edx
  102c07:	8b 45 08             	mov    0x8(%ebp),%eax
  102c0a:	66 89 50 16          	mov    %dx,0x16(%eax)
    ip->size = dip->size;
  102c0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c11:	8b 50 08             	mov    0x8(%eax),%edx
  102c14:	8b 45 08             	mov    0x8(%ebp),%eax
  102c17:	89 50 18             	mov    %edx,0x18(%eax)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
  102c1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c1d:	8d 50 0c             	lea    0xc(%eax),%edx
  102c20:	8b 45 08             	mov    0x8(%ebp),%eax
  102c23:	83 c0 1c             	add    $0x1c,%eax
  102c26:	83 ec 04             	sub    $0x4,%esp
  102c29:	6a 34                	push   $0x34
  102c2b:	52                   	push   %edx
  102c2c:	50                   	push   %eax
  102c2d:	e8 3a e3 ff ff       	call   100f6c <memmove>
  102c32:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  102c35:	83 ec 0c             	sub    $0xc,%esp
  102c38:	ff 75 f4             	push   -0xc(%ebp)
  102c3b:	e8 f4 f4 ff ff       	call   102134 <brelse>
  102c40:	83 c4 10             	add    $0x10,%esp
    ip->valid = 1;
  102c43:	8b 45 08             	mov    0x8(%ebp),%eax
  102c46:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
    if(ip->type == 0)
  102c4d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c50:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  102c54:	66 85 c0             	test   %ax,%ax
  102c57:	75 0d                	jne    102c66 <iread+0xfe>
      panic("iread: no type");
  102c59:	83 ec 0c             	sub    $0xc,%esp
  102c5c:	68 3b 44 10 00       	push   $0x10443b
  102c61:	e8 48 d6 ff ff       	call   1002ae <panic>
  }
}
  102c66:	90                   	nop
  102c67:	c9                   	leave
  102c68:	c3                   	ret

00102c69 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
  102c69:	55                   	push   %ebp
  102c6a:	89 e5                	mov    %esp,%ebp
  102c6c:	83 ec 18             	sub    $0x18,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
  102c6f:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
  102c73:	77 42                	ja     102cb7 <bmap+0x4e>
    if((addr = ip->addrs[bn]) == 0)
  102c75:	8b 45 08             	mov    0x8(%ebp),%eax
  102c78:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c7b:	83 c2 04             	add    $0x4,%edx
  102c7e:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102c82:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c85:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102c89:	75 24                	jne    102caf <bmap+0x46>
      ip->addrs[bn] = addr = balloc(ip->dev);
  102c8b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c8e:	8b 00                	mov    (%eax),%eax
  102c90:	83 ec 0c             	sub    $0xc,%esp
  102c93:	50                   	push   %eax
  102c94:	e8 b7 f9 ff ff       	call   102650 <balloc>
  102c99:	83 c4 10             	add    $0x10,%esp
  102c9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c9f:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca2:	8b 55 0c             	mov    0xc(%ebp),%edx
  102ca5:	8d 4a 04             	lea    0x4(%edx),%ecx
  102ca8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102cab:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    return addr;
  102caf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102cb2:	e9 ca 00 00 00       	jmp    102d81 <bmap+0x118>
  }
  bn -= NDIRECT;
  102cb7:	83 6d 0c 0c          	subl   $0xc,0xc(%ebp)

  if(bn < NINDIRECT){
  102cbb:	83 7d 0c 7f          	cmpl   $0x7f,0xc(%ebp)
  102cbf:	0f 87 af 00 00 00    	ja     102d74 <bmap+0x10b>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
  102cc5:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc8:	8b 40 4c             	mov    0x4c(%eax),%eax
  102ccb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102cd2:	75 1d                	jne    102cf1 <bmap+0x88>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
  102cd4:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd7:	8b 00                	mov    (%eax),%eax
  102cd9:	83 ec 0c             	sub    $0xc,%esp
  102cdc:	50                   	push   %eax
  102cdd:	e8 6e f9 ff ff       	call   102650 <balloc>
  102ce2:	83 c4 10             	add    $0x10,%esp
  102ce5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ce8:	8b 45 08             	mov    0x8(%ebp),%eax
  102ceb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102cee:	89 50 4c             	mov    %edx,0x4c(%eax)
    bp = bread(ip->dev, addr);
  102cf1:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf4:	8b 00                	mov    (%eax),%eax
  102cf6:	83 ec 08             	sub    $0x8,%esp
  102cf9:	ff 75 f4             	push   -0xc(%ebp)
  102cfc:	50                   	push   %eax
  102cfd:	e8 39 f3 ff ff       	call   10203b <bread>
  102d02:	83 c4 10             	add    $0x10,%esp
  102d05:	89 45 f0             	mov    %eax,-0x10(%ebp)
    a = (uint*)bp->data;
  102d08:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d0b:	83 c0 1c             	add    $0x1c,%eax
  102d0e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((addr = a[bn]) == 0){
  102d11:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d14:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102d1b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d1e:	01 d0                	add    %edx,%eax
  102d20:	8b 00                	mov    (%eax),%eax
  102d22:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d25:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102d29:	75 36                	jne    102d61 <bmap+0xf8>
      a[bn] = addr = balloc(ip->dev);
  102d2b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2e:	8b 00                	mov    (%eax),%eax
  102d30:	83 ec 0c             	sub    $0xc,%esp
  102d33:	50                   	push   %eax
  102d34:	e8 17 f9 ff ff       	call   102650 <balloc>
  102d39:	83 c4 10             	add    $0x10,%esp
  102d3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d3f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d42:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102d49:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d4c:	01 c2                	add    %eax,%edx
  102d4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d51:	89 02                	mov    %eax,(%edx)
      log_write(bp);
  102d53:	83 ec 0c             	sub    $0xc,%esp
  102d56:	ff 75 f0             	push   -0x10(%ebp)
  102d59:	e8 08 12 00 00       	call   103f66 <log_write>
  102d5e:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  102d61:	83 ec 0c             	sub    $0xc,%esp
  102d64:	ff 75 f0             	push   -0x10(%ebp)
  102d67:	e8 c8 f3 ff ff       	call   102134 <brelse>
  102d6c:	83 c4 10             	add    $0x10,%esp
    return addr;
  102d6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d72:	eb 0d                	jmp    102d81 <bmap+0x118>
  }

  panic("bmap: out of range");
  102d74:	83 ec 0c             	sub    $0xc,%esp
  102d77:	68 4a 44 10 00       	push   $0x10444a
  102d7c:	e8 2d d5 ff ff       	call   1002ae <panic>
}
  102d81:	c9                   	leave
  102d82:	c3                   	ret

00102d83 <itrunc>:
// to it (no directory entries referring to it)
// and has no in-memory reference to it (is
// not an open file or current directory).
static void
itrunc(struct inode *ip)
{
  102d83:	55                   	push   %ebp
  102d84:	89 e5                	mov    %esp,%ebp
  102d86:	83 ec 18             	sub    $0x18,%esp
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
  102d89:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102d90:	eb 45                	jmp    102dd7 <itrunc+0x54>
    if(ip->addrs[i]){
  102d92:	8b 45 08             	mov    0x8(%ebp),%eax
  102d95:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d98:	83 c2 04             	add    $0x4,%edx
  102d9b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102d9f:	85 c0                	test   %eax,%eax
  102da1:	74 30                	je     102dd3 <itrunc+0x50>
      bfree(ip->dev, ip->addrs[i]);
  102da3:	8b 45 08             	mov    0x8(%ebp),%eax
  102da6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102da9:	83 c2 04             	add    $0x4,%edx
  102dac:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102db0:	8b 55 08             	mov    0x8(%ebp),%edx
  102db3:	8b 12                	mov    (%edx),%edx
  102db5:	83 ec 08             	sub    $0x8,%esp
  102db8:	50                   	push   %eax
  102db9:	52                   	push   %edx
  102dba:	e8 d4 f9 ff ff       	call   102793 <bfree>
  102dbf:	83 c4 10             	add    $0x10,%esp
      ip->addrs[i] = 0;
  102dc2:	8b 45 08             	mov    0x8(%ebp),%eax
  102dc5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102dc8:	83 c2 04             	add    $0x4,%edx
  102dcb:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
  102dd2:	00 
  for(i = 0; i < NDIRECT; i++){
  102dd3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  102dd7:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
  102ddb:	7e b5                	jle    102d92 <itrunc+0xf>
    }
  }

  if(ip->addrs[NDIRECT]){
  102ddd:	8b 45 08             	mov    0x8(%ebp),%eax
  102de0:	8b 40 4c             	mov    0x4c(%eax),%eax
  102de3:	85 c0                	test   %eax,%eax
  102de5:	0f 84 a1 00 00 00    	je     102e8c <itrunc+0x109>
    bp = bread_wr(ip->dev, ip->addrs[NDIRECT]);
  102deb:	8b 45 08             	mov    0x8(%ebp),%eax
  102dee:	8b 50 4c             	mov    0x4c(%eax),%edx
  102df1:	8b 45 08             	mov    0x8(%ebp),%eax
  102df4:	8b 00                	mov    (%eax),%eax
  102df6:	83 ec 08             	sub    $0x8,%esp
  102df9:	52                   	push   %edx
  102dfa:	50                   	push   %eax
  102dfb:	e8 9a f2 ff ff       	call   10209a <bread_wr>
  102e00:	83 c4 10             	add    $0x10,%esp
  102e03:	89 45 ec             	mov    %eax,-0x14(%ebp)
    a = (uint*)bp->data;
  102e06:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e09:	83 c0 1c             	add    $0x1c,%eax
  102e0c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    for(j = 0; j < NINDIRECT; j++){
  102e0f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  102e16:	eb 3c                	jmp    102e54 <itrunc+0xd1>
      if(a[j])
  102e18:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e1b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102e22:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e25:	01 d0                	add    %edx,%eax
  102e27:	8b 00                	mov    (%eax),%eax
  102e29:	85 c0                	test   %eax,%eax
  102e2b:	74 23                	je     102e50 <itrunc+0xcd>
        bfree(ip->dev, a[j]);
  102e2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e30:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102e37:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e3a:	01 d0                	add    %edx,%eax
  102e3c:	8b 00                	mov    (%eax),%eax
  102e3e:	8b 55 08             	mov    0x8(%ebp),%edx
  102e41:	8b 12                	mov    (%edx),%edx
  102e43:	83 ec 08             	sub    $0x8,%esp
  102e46:	50                   	push   %eax
  102e47:	52                   	push   %edx
  102e48:	e8 46 f9 ff ff       	call   102793 <bfree>
  102e4d:	83 c4 10             	add    $0x10,%esp
    for(j = 0; j < NINDIRECT; j++){
  102e50:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  102e54:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e57:	83 f8 7f             	cmp    $0x7f,%eax
  102e5a:	76 bc                	jbe    102e18 <itrunc+0x95>
    }
    brelse(bp);
  102e5c:	83 ec 0c             	sub    $0xc,%esp
  102e5f:	ff 75 ec             	push   -0x14(%ebp)
  102e62:	e8 cd f2 ff ff       	call   102134 <brelse>
  102e67:	83 c4 10             	add    $0x10,%esp
    bfree(ip->dev, ip->addrs[NDIRECT]);
  102e6a:	8b 45 08             	mov    0x8(%ebp),%eax
  102e6d:	8b 40 4c             	mov    0x4c(%eax),%eax
  102e70:	8b 55 08             	mov    0x8(%ebp),%edx
  102e73:	8b 12                	mov    (%edx),%edx
  102e75:	83 ec 08             	sub    $0x8,%esp
  102e78:	50                   	push   %eax
  102e79:	52                   	push   %edx
  102e7a:	e8 14 f9 ff ff       	call   102793 <bfree>
  102e7f:	83 c4 10             	add    $0x10,%esp
    ip->addrs[NDIRECT] = 0;
  102e82:	8b 45 08             	mov    0x8(%ebp),%eax
  102e85:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
  }

  ip->size = 0;
  102e8c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e8f:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  iupdate(ip);
  102e96:	83 ec 0c             	sub    $0xc,%esp
  102e99:	ff 75 08             	push   0x8(%ebp)
  102e9c:	e8 57 fb ff ff       	call   1029f8 <iupdate>
  102ea1:	83 c4 10             	add    $0x10,%esp
}
  102ea4:	90                   	nop
  102ea5:	c9                   	leave
  102ea6:	c3                   	ret

00102ea7 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
  102ea7:	55                   	push   %ebp
  102ea8:	89 e5                	mov    %esp,%ebp
  st->dev = ip->dev;
  102eaa:	8b 45 08             	mov    0x8(%ebp),%eax
  102ead:	8b 00                	mov    (%eax),%eax
  102eaf:	89 c2                	mov    %eax,%edx
  102eb1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eb4:	89 50 04             	mov    %edx,0x4(%eax)
  st->ino = ip->inum;
  102eb7:	8b 45 08             	mov    0x8(%ebp),%eax
  102eba:	8b 50 04             	mov    0x4(%eax),%edx
  102ebd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec0:	89 50 08             	mov    %edx,0x8(%eax)
  st->type = ip->type;
  102ec3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec6:	0f b7 50 10          	movzwl 0x10(%eax),%edx
  102eca:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ecd:	66 89 10             	mov    %dx,(%eax)
  st->nlink = ip->nlink;
  102ed0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed3:	0f b7 50 16          	movzwl 0x16(%eax),%edx
  102ed7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eda:	66 89 50 0c          	mov    %dx,0xc(%eax)
  st->size = ip->size;
  102ede:	8b 45 08             	mov    0x8(%ebp),%eax
  102ee1:	8b 50 18             	mov    0x18(%eax),%edx
  102ee4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ee7:	89 50 10             	mov    %edx,0x10(%eax)
}
  102eea:	90                   	nop
  102eeb:	5d                   	pop    %ebp
  102eec:	c3                   	ret

00102eed <readi>:

// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
  102eed:	55                   	push   %ebp
  102eee:	89 e5                	mov    %esp,%ebp
  102ef0:	83 ec 18             	sub    $0x18,%esp
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off || ip->nlink < 1)
  102ef3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef6:	8b 40 18             	mov    0x18(%eax),%eax
  102ef9:	3b 45 10             	cmp    0x10(%ebp),%eax
  102efc:	72 19                	jb     102f17 <readi+0x2a>
  102efe:	8b 55 10             	mov    0x10(%ebp),%edx
  102f01:	8b 45 14             	mov    0x14(%ebp),%eax
  102f04:	01 d0                	add    %edx,%eax
  102f06:	3b 45 10             	cmp    0x10(%ebp),%eax
  102f09:	72 0c                	jb     102f17 <readi+0x2a>
  102f0b:	8b 45 08             	mov    0x8(%ebp),%eax
  102f0e:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  102f12:	66 85 c0             	test   %ax,%ax
  102f15:	7f 0a                	jg     102f21 <readi+0x34>
    return -1;
  102f17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102f1c:	e9 c2 00 00 00       	jmp    102fe3 <readi+0xf6>
  if(off + n > ip->size)
  102f21:	8b 55 10             	mov    0x10(%ebp),%edx
  102f24:	8b 45 14             	mov    0x14(%ebp),%eax
  102f27:	01 c2                	add    %eax,%edx
  102f29:	8b 45 08             	mov    0x8(%ebp),%eax
  102f2c:	8b 40 18             	mov    0x18(%eax),%eax
  102f2f:	39 d0                	cmp    %edx,%eax
  102f31:	73 0c                	jae    102f3f <readi+0x52>
    n = ip->size - off;
  102f33:	8b 45 08             	mov    0x8(%ebp),%eax
  102f36:	8b 40 18             	mov    0x18(%eax),%eax
  102f39:	2b 45 10             	sub    0x10(%ebp),%eax
  102f3c:	89 45 14             	mov    %eax,0x14(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
  102f3f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102f46:	e9 89 00 00 00       	jmp    102fd4 <readi+0xe7>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
  102f4b:	8b 45 10             	mov    0x10(%ebp),%eax
  102f4e:	c1 e8 09             	shr    $0x9,%eax
  102f51:	83 ec 08             	sub    $0x8,%esp
  102f54:	50                   	push   %eax
  102f55:	ff 75 08             	push   0x8(%ebp)
  102f58:	e8 0c fd ff ff       	call   102c69 <bmap>
  102f5d:	83 c4 10             	add    $0x10,%esp
  102f60:	8b 55 08             	mov    0x8(%ebp),%edx
  102f63:	8b 12                	mov    (%edx),%edx
  102f65:	83 ec 08             	sub    $0x8,%esp
  102f68:	50                   	push   %eax
  102f69:	52                   	push   %edx
  102f6a:	e8 cc f0 ff ff       	call   10203b <bread>
  102f6f:	83 c4 10             	add    $0x10,%esp
  102f72:	89 45 f0             	mov    %eax,-0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
  102f75:	8b 45 10             	mov    0x10(%ebp),%eax
  102f78:	25 ff 01 00 00       	and    $0x1ff,%eax
  102f7d:	ba 00 02 00 00       	mov    $0x200,%edx
  102f82:	29 c2                	sub    %eax,%edx
  102f84:	8b 45 14             	mov    0x14(%ebp),%eax
  102f87:	2b 45 f4             	sub    -0xc(%ebp),%eax
  102f8a:	39 c2                	cmp    %eax,%edx
  102f8c:	0f 46 c2             	cmovbe %edx,%eax
  102f8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(dst, bp->data + off%BSIZE, m);
  102f92:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f95:	8d 50 1c             	lea    0x1c(%eax),%edx
  102f98:	8b 45 10             	mov    0x10(%ebp),%eax
  102f9b:	25 ff 01 00 00       	and    $0x1ff,%eax
  102fa0:	01 d0                	add    %edx,%eax
  102fa2:	83 ec 04             	sub    $0x4,%esp
  102fa5:	ff 75 ec             	push   -0x14(%ebp)
  102fa8:	50                   	push   %eax
  102fa9:	ff 75 0c             	push   0xc(%ebp)
  102fac:	e8 bb df ff ff       	call   100f6c <memmove>
  102fb1:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  102fb4:	83 ec 0c             	sub    $0xc,%esp
  102fb7:	ff 75 f0             	push   -0x10(%ebp)
  102fba:	e8 75 f1 ff ff       	call   102134 <brelse>
  102fbf:	83 c4 10             	add    $0x10,%esp
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
  102fc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fc5:	01 45 f4             	add    %eax,-0xc(%ebp)
  102fc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fcb:	01 45 10             	add    %eax,0x10(%ebp)
  102fce:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fd1:	01 45 0c             	add    %eax,0xc(%ebp)
  102fd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102fd7:	3b 45 14             	cmp    0x14(%ebp),%eax
  102fda:	0f 82 6b ff ff ff    	jb     102f4b <readi+0x5e>
  }
  return n;
  102fe0:	8b 45 14             	mov    0x14(%ebp),%eax
}
  102fe3:	c9                   	leave
  102fe4:	c3                   	ret

00102fe5 <writei>:

// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
  102fe5:	55                   	push   %ebp
  102fe6:	89 e5                	mov    %esp,%ebp
  102fe8:	83 ec 18             	sub    $0x18,%esp
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
  102feb:	8b 45 08             	mov    0x8(%ebp),%eax
  102fee:	8b 40 18             	mov    0x18(%eax),%eax
  102ff1:	3b 45 10             	cmp    0x10(%ebp),%eax
  102ff4:	72 0d                	jb     103003 <writei+0x1e>
  102ff6:	8b 55 10             	mov    0x10(%ebp),%edx
  102ff9:	8b 45 14             	mov    0x14(%ebp),%eax
  102ffc:	01 d0                	add    %edx,%eax
  102ffe:	3b 45 10             	cmp    0x10(%ebp),%eax
  103001:	73 0a                	jae    10300d <writei+0x28>
    return -1;
  103003:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103008:	e9 f3 00 00 00       	jmp    103100 <writei+0x11b>
  if(off + n > MAXFILE*BSIZE)
  10300d:	8b 55 10             	mov    0x10(%ebp),%edx
  103010:	8b 45 14             	mov    0x14(%ebp),%eax
  103013:	01 d0                	add    %edx,%eax
  103015:	3d 00 18 01 00       	cmp    $0x11800,%eax
  10301a:	76 0a                	jbe    103026 <writei+0x41>
    return -1;
  10301c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103021:	e9 da 00 00 00       	jmp    103100 <writei+0x11b>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
  103026:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10302d:	e9 97 00 00 00       	jmp    1030c9 <writei+0xe4>
    bp = bread_wr(ip->dev, bmap(ip, off/BSIZE));
  103032:	8b 45 10             	mov    0x10(%ebp),%eax
  103035:	c1 e8 09             	shr    $0x9,%eax
  103038:	83 ec 08             	sub    $0x8,%esp
  10303b:	50                   	push   %eax
  10303c:	ff 75 08             	push   0x8(%ebp)
  10303f:	e8 25 fc ff ff       	call   102c69 <bmap>
  103044:	83 c4 10             	add    $0x10,%esp
  103047:	8b 55 08             	mov    0x8(%ebp),%edx
  10304a:	8b 12                	mov    (%edx),%edx
  10304c:	83 ec 08             	sub    $0x8,%esp
  10304f:	50                   	push   %eax
  103050:	52                   	push   %edx
  103051:	e8 44 f0 ff ff       	call   10209a <bread_wr>
  103056:	83 c4 10             	add    $0x10,%esp
  103059:	89 45 f0             	mov    %eax,-0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
  10305c:	8b 45 10             	mov    0x10(%ebp),%eax
  10305f:	25 ff 01 00 00       	and    $0x1ff,%eax
  103064:	ba 00 02 00 00       	mov    $0x200,%edx
  103069:	29 c2                	sub    %eax,%edx
  10306b:	8b 45 14             	mov    0x14(%ebp),%eax
  10306e:	2b 45 f4             	sub    -0xc(%ebp),%eax
  103071:	39 c2                	cmp    %eax,%edx
  103073:	0f 46 c2             	cmovbe %edx,%eax
  103076:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(bp->data + off%BSIZE, src, m);
  103079:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10307c:	8d 50 1c             	lea    0x1c(%eax),%edx
  10307f:	8b 45 10             	mov    0x10(%ebp),%eax
  103082:	25 ff 01 00 00       	and    $0x1ff,%eax
  103087:	01 d0                	add    %edx,%eax
  103089:	83 ec 04             	sub    $0x4,%esp
  10308c:	ff 75 ec             	push   -0x14(%ebp)
  10308f:	ff 75 0c             	push   0xc(%ebp)
  103092:	50                   	push   %eax
  103093:	e8 d4 de ff ff       	call   100f6c <memmove>
  103098:	83 c4 10             	add    $0x10,%esp
    log_write(bp);
  10309b:	83 ec 0c             	sub    $0xc,%esp
  10309e:	ff 75 f0             	push   -0x10(%ebp)
  1030a1:	e8 c0 0e 00 00       	call   103f66 <log_write>
  1030a6:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  1030a9:	83 ec 0c             	sub    $0xc,%esp
  1030ac:	ff 75 f0             	push   -0x10(%ebp)
  1030af:	e8 80 f0 ff ff       	call   102134 <brelse>
  1030b4:	83 c4 10             	add    $0x10,%esp
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
  1030b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1030ba:	01 45 f4             	add    %eax,-0xc(%ebp)
  1030bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1030c0:	01 45 10             	add    %eax,0x10(%ebp)
  1030c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1030c6:	01 45 0c             	add    %eax,0xc(%ebp)
  1030c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030cc:	3b 45 14             	cmp    0x14(%ebp),%eax
  1030cf:	0f 82 5d ff ff ff    	jb     103032 <writei+0x4d>
  }

  if(n > 0 && off > ip->size){
  1030d5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  1030d9:	74 22                	je     1030fd <writei+0x118>
  1030db:	8b 45 08             	mov    0x8(%ebp),%eax
  1030de:	8b 40 18             	mov    0x18(%eax),%eax
  1030e1:	3b 45 10             	cmp    0x10(%ebp),%eax
  1030e4:	73 17                	jae    1030fd <writei+0x118>
    ip->size = off;
  1030e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e9:	8b 55 10             	mov    0x10(%ebp),%edx
  1030ec:	89 50 18             	mov    %edx,0x18(%eax)
    iupdate(ip);
  1030ef:	83 ec 0c             	sub    $0xc,%esp
  1030f2:	ff 75 08             	push   0x8(%ebp)
  1030f5:	e8 fe f8 ff ff       	call   1029f8 <iupdate>
  1030fa:	83 c4 10             	add    $0x10,%esp
  }
  return n;
  1030fd:	8b 45 14             	mov    0x14(%ebp),%eax
}
  103100:	c9                   	leave
  103101:	c3                   	ret

00103102 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
  103102:	55                   	push   %ebp
  103103:	89 e5                	mov    %esp,%ebp
  103105:	83 ec 08             	sub    $0x8,%esp
  return strncmp(s, t, DIRSIZ);
  103108:	83 ec 04             	sub    $0x4,%esp
  10310b:	6a 0e                	push   $0xe
  10310d:	ff 75 0c             	push   0xc(%ebp)
  103110:	ff 75 08             	push   0x8(%ebp)
  103113:	e8 ea de ff ff       	call   101002 <strncmp>
  103118:	83 c4 10             	add    $0x10,%esp
}
  10311b:	c9                   	leave
  10311c:	c3                   	ret

0010311d <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
  10311d:	55                   	push   %ebp
  10311e:	89 e5                	mov    %esp,%ebp
  103120:	83 ec 28             	sub    $0x28,%esp
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
  103123:	8b 45 08             	mov    0x8(%ebp),%eax
  103126:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  10312a:	66 83 f8 01          	cmp    $0x1,%ax
  10312e:	74 0d                	je     10313d <dirlookup+0x20>
    panic("dirlookup not DIR");
  103130:	83 ec 0c             	sub    $0xc,%esp
  103133:	68 5d 44 10 00       	push   $0x10445d
  103138:	e8 71 d1 ff ff       	call   1002ae <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
  10313d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103144:	eb 7b                	jmp    1031c1 <dirlookup+0xa4>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  103146:	6a 10                	push   $0x10
  103148:	ff 75 f4             	push   -0xc(%ebp)
  10314b:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10314e:	50                   	push   %eax
  10314f:	ff 75 08             	push   0x8(%ebp)
  103152:	e8 96 fd ff ff       	call   102eed <readi>
  103157:	83 c4 10             	add    $0x10,%esp
  10315a:	83 f8 10             	cmp    $0x10,%eax
  10315d:	74 0d                	je     10316c <dirlookup+0x4f>
      panic("dirlookup read");
  10315f:	83 ec 0c             	sub    $0xc,%esp
  103162:	68 6f 44 10 00       	push   $0x10446f
  103167:	e8 42 d1 ff ff       	call   1002ae <panic>
    if(de.inum == 0)
  10316c:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  103170:	66 85 c0             	test   %ax,%ax
  103173:	74 47                	je     1031bc <dirlookup+0x9f>
      continue;
    if(namecmp(name, de.name) == 0){
  103175:	83 ec 08             	sub    $0x8,%esp
  103178:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10317b:	83 c0 02             	add    $0x2,%eax
  10317e:	50                   	push   %eax
  10317f:	ff 75 0c             	push   0xc(%ebp)
  103182:	e8 7b ff ff ff       	call   103102 <namecmp>
  103187:	83 c4 10             	add    $0x10,%esp
  10318a:	85 c0                	test   %eax,%eax
  10318c:	75 2f                	jne    1031bd <dirlookup+0xa0>
      // entry matches path element
      if(poff)
  10318e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103192:	74 08                	je     10319c <dirlookup+0x7f>
        *poff = off;
  103194:	8b 45 10             	mov    0x10(%ebp),%eax
  103197:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10319a:	89 10                	mov    %edx,(%eax)
      inum = de.inum;
  10319c:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  1031a0:	0f b7 c0             	movzwl %ax,%eax
  1031a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
      return iget(dp->dev, inum);
  1031a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1031a9:	8b 00                	mov    (%eax),%eax
  1031ab:	83 ec 08             	sub    $0x8,%esp
  1031ae:	ff 75 f0             	push   -0x10(%ebp)
  1031b1:	50                   	push   %eax
  1031b2:	e8 02 f9 ff ff       	call   102ab9 <iget>
  1031b7:	83 c4 10             	add    $0x10,%esp
  1031ba:	eb 19                	jmp    1031d5 <dirlookup+0xb8>
      continue;
  1031bc:	90                   	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
  1031bd:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
  1031c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c4:	8b 40 18             	mov    0x18(%eax),%eax
  1031c7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1031ca:	0f 82 76 ff ff ff    	jb     103146 <dirlookup+0x29>
    }
  }

  return 0;
  1031d0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1031d5:	c9                   	leave
  1031d6:	c3                   	ret

001031d7 <dirlink>:


// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
  1031d7:	55                   	push   %ebp
  1031d8:	89 e5                	mov    %esp,%ebp
  1031da:	83 ec 28             	sub    $0x28,%esp
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
  1031dd:	83 ec 04             	sub    $0x4,%esp
  1031e0:	6a 00                	push   $0x0
  1031e2:	ff 75 0c             	push   0xc(%ebp)
  1031e5:	ff 75 08             	push   0x8(%ebp)
  1031e8:	e8 30 ff ff ff       	call   10311d <dirlookup>
  1031ed:	83 c4 10             	add    $0x10,%esp
  1031f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031f3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1031f7:	74 18                	je     103211 <dirlink+0x3a>
    iput(ip);
  1031f9:	83 ec 0c             	sub    $0xc,%esp
  1031fc:	ff 75 f0             	push   -0x10(%ebp)
  1031ff:	e8 88 f7 ff ff       	call   10298c <iput>
  103204:	83 c4 10             	add    $0x10,%esp
    return -1;
  103207:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10320c:	e9 9c 00 00 00       	jmp    1032ad <dirlink+0xd6>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
  103211:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103218:	eb 39                	jmp    103253 <dirlink+0x7c>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  10321a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10321d:	6a 10                	push   $0x10
  10321f:	50                   	push   %eax
  103220:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103223:	50                   	push   %eax
  103224:	ff 75 08             	push   0x8(%ebp)
  103227:	e8 c1 fc ff ff       	call   102eed <readi>
  10322c:	83 c4 10             	add    $0x10,%esp
  10322f:	83 f8 10             	cmp    $0x10,%eax
  103232:	74 0d                	je     103241 <dirlink+0x6a>
      panic("dirlink read");
  103234:	83 ec 0c             	sub    $0xc,%esp
  103237:	68 7e 44 10 00       	push   $0x10447e
  10323c:	e8 6d d0 ff ff       	call   1002ae <panic>
    if(de.inum == 0)
  103241:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  103245:	66 85 c0             	test   %ax,%ax
  103248:	74 18                	je     103262 <dirlink+0x8b>
  for(off = 0; off < dp->size; off += sizeof(de)){
  10324a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10324d:	83 c0 10             	add    $0x10,%eax
  103250:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103253:	8b 45 08             	mov    0x8(%ebp),%eax
  103256:	8b 40 18             	mov    0x18(%eax),%eax
  103259:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10325c:	39 c2                	cmp    %eax,%edx
  10325e:	72 ba                	jb     10321a <dirlink+0x43>
  103260:	eb 01                	jmp    103263 <dirlink+0x8c>
      break;
  103262:	90                   	nop
  }

  strncpy(de.name, name, DIRSIZ);
  103263:	83 ec 04             	sub    $0x4,%esp
  103266:	6a 0e                	push   $0xe
  103268:	ff 75 0c             	push   0xc(%ebp)
  10326b:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10326e:	83 c0 02             	add    $0x2,%eax
  103271:	50                   	push   %eax
  103272:	e8 e1 dd ff ff       	call   101058 <strncpy>
  103277:	83 c4 10             	add    $0x10,%esp
  de.inum = inum;
  10327a:	8b 45 10             	mov    0x10(%ebp),%eax
  10327d:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  103281:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103284:	6a 10                	push   $0x10
  103286:	50                   	push   %eax
  103287:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10328a:	50                   	push   %eax
  10328b:	ff 75 08             	push   0x8(%ebp)
  10328e:	e8 52 fd ff ff       	call   102fe5 <writei>
  103293:	83 c4 10             	add    $0x10,%esp
  103296:	83 f8 10             	cmp    $0x10,%eax
  103299:	74 0d                	je     1032a8 <dirlink+0xd1>
    panic("dirlink");
  10329b:	83 ec 0c             	sub    $0xc,%esp
  10329e:	68 8b 44 10 00       	push   $0x10448b
  1032a3:	e8 06 d0 ff ff       	call   1002ae <panic>

  return 0;
  1032a8:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1032ad:	c9                   	leave
  1032ae:	c3                   	ret

001032af <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
  1032af:	55                   	push   %ebp
  1032b0:	89 e5                	mov    %esp,%ebp
  1032b2:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int len;

  while(*path == '/')
  1032b5:	eb 04                	jmp    1032bb <skipelem+0xc>
    path++;
  1032b7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path == '/')
  1032bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1032be:	0f b6 00             	movzbl (%eax),%eax
  1032c1:	3c 2f                	cmp    $0x2f,%al
  1032c3:	74 f2                	je     1032b7 <skipelem+0x8>
  if(*path == 0)
  1032c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c8:	0f b6 00             	movzbl (%eax),%eax
  1032cb:	84 c0                	test   %al,%al
  1032cd:	75 07                	jne    1032d6 <skipelem+0x27>
    return 0;
  1032cf:	b8 00 00 00 00       	mov    $0x0,%eax
  1032d4:	eb 77                	jmp    10334d <skipelem+0x9e>
  s = path;
  1032d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1032d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(*path != '/' && *path != 0)
  1032dc:	eb 04                	jmp    1032e2 <skipelem+0x33>
    path++;
  1032de:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path != '/' && *path != 0)
  1032e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1032e5:	0f b6 00             	movzbl (%eax),%eax
  1032e8:	3c 2f                	cmp    $0x2f,%al
  1032ea:	74 0a                	je     1032f6 <skipelem+0x47>
  1032ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ef:	0f b6 00             	movzbl (%eax),%eax
  1032f2:	84 c0                	test   %al,%al
  1032f4:	75 e8                	jne    1032de <skipelem+0x2f>
  len = path - s;
  1032f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f9:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1032fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(len >= DIRSIZ)
  1032ff:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  103303:	7e 15                	jle    10331a <skipelem+0x6b>
    memmove(name, s, DIRSIZ);
  103305:	83 ec 04             	sub    $0x4,%esp
  103308:	6a 0e                	push   $0xe
  10330a:	ff 75 f4             	push   -0xc(%ebp)
  10330d:	ff 75 0c             	push   0xc(%ebp)
  103310:	e8 57 dc ff ff       	call   100f6c <memmove>
  103315:	83 c4 10             	add    $0x10,%esp
  103318:	eb 26                	jmp    103340 <skipelem+0x91>
  else {
    memmove(name, s, len);
  10331a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10331d:	83 ec 04             	sub    $0x4,%esp
  103320:	50                   	push   %eax
  103321:	ff 75 f4             	push   -0xc(%ebp)
  103324:	ff 75 0c             	push   0xc(%ebp)
  103327:	e8 40 dc ff ff       	call   100f6c <memmove>
  10332c:	83 c4 10             	add    $0x10,%esp
    name[len] = 0;
  10332f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103332:	8b 45 0c             	mov    0xc(%ebp),%eax
  103335:	01 d0                	add    %edx,%eax
  103337:	c6 00 00             	movb   $0x0,(%eax)
  }
  while(*path == '/')
  10333a:	eb 04                	jmp    103340 <skipelem+0x91>
    path++;
  10333c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path == '/')
  103340:	8b 45 08             	mov    0x8(%ebp),%eax
  103343:	0f b6 00             	movzbl (%eax),%eax
  103346:	3c 2f                	cmp    $0x2f,%al
  103348:	74 f2                	je     10333c <skipelem+0x8d>
  return path;
  10334a:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10334d:	c9                   	leave
  10334e:	c3                   	ret

0010334f <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
  10334f:	55                   	push   %ebp
  103350:	89 e5                	mov    %esp,%ebp
  103352:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip, *next;

  ip = iget(ROOTDEV, ROOTINO);
  103355:	83 ec 08             	sub    $0x8,%esp
  103358:	6a 01                	push   $0x1
  10335a:	6a 01                	push   $0x1
  10335c:	e8 58 f7 ff ff       	call   102ab9 <iget>
  103361:	83 c4 10             	add    $0x10,%esp
  103364:	89 45 f4             	mov    %eax,-0xc(%ebp)

  while((path = skipelem(path, name)) != 0){
  103367:	e9 90 00 00 00       	jmp    1033fc <namex+0xad>
    iread(ip);
  10336c:	83 ec 0c             	sub    $0xc,%esp
  10336f:	ff 75 f4             	push   -0xc(%ebp)
  103372:	e8 f1 f7 ff ff       	call   102b68 <iread>
  103377:	83 c4 10             	add    $0x10,%esp
    if(ip->type != T_DIR){
  10337a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10337d:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103381:	66 83 f8 01          	cmp    $0x1,%ax
  103385:	74 18                	je     10339f <namex+0x50>
      iput(ip);
  103387:	83 ec 0c             	sub    $0xc,%esp
  10338a:	ff 75 f4             	push   -0xc(%ebp)
  10338d:	e8 fa f5 ff ff       	call   10298c <iput>
  103392:	83 c4 10             	add    $0x10,%esp
      return 0;
  103395:	b8 00 00 00 00       	mov    $0x0,%eax
  10339a:	e9 99 00 00 00       	jmp    103438 <namex+0xe9>
    }
    if(nameiparent && *path == '\0'){
  10339f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1033a3:	74 12                	je     1033b7 <namex+0x68>
  1033a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a8:	0f b6 00             	movzbl (%eax),%eax
  1033ab:	84 c0                	test   %al,%al
  1033ad:	75 08                	jne    1033b7 <namex+0x68>
      // Stop one level early.
      return ip;
  1033af:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1033b2:	e9 81 00 00 00       	jmp    103438 <namex+0xe9>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
  1033b7:	83 ec 04             	sub    $0x4,%esp
  1033ba:	6a 00                	push   $0x0
  1033bc:	ff 75 10             	push   0x10(%ebp)
  1033bf:	ff 75 f4             	push   -0xc(%ebp)
  1033c2:	e8 56 fd ff ff       	call   10311d <dirlookup>
  1033c7:	83 c4 10             	add    $0x10,%esp
  1033ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033cd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1033d1:	75 15                	jne    1033e8 <namex+0x99>
      iput(ip);
  1033d3:	83 ec 0c             	sub    $0xc,%esp
  1033d6:	ff 75 f4             	push   -0xc(%ebp)
  1033d9:	e8 ae f5 ff ff       	call   10298c <iput>
  1033de:	83 c4 10             	add    $0x10,%esp
      return 0;
  1033e1:	b8 00 00 00 00       	mov    $0x0,%eax
  1033e6:	eb 50                	jmp    103438 <namex+0xe9>
    }
    iput(ip);
  1033e8:	83 ec 0c             	sub    $0xc,%esp
  1033eb:	ff 75 f4             	push   -0xc(%ebp)
  1033ee:	e8 99 f5 ff ff       	call   10298c <iput>
  1033f3:	83 c4 10             	add    $0x10,%esp
    ip = next;
  1033f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while((path = skipelem(path, name)) != 0){
  1033fc:	83 ec 08             	sub    $0x8,%esp
  1033ff:	ff 75 10             	push   0x10(%ebp)
  103402:	ff 75 08             	push   0x8(%ebp)
  103405:	e8 a5 fe ff ff       	call   1032af <skipelem>
  10340a:	83 c4 10             	add    $0x10,%esp
  10340d:	89 45 08             	mov    %eax,0x8(%ebp)
  103410:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103414:	0f 85 52 ff ff ff    	jne    10336c <namex+0x1d>
  }
  if(nameiparent){
  10341a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10341e:	74 15                	je     103435 <namex+0xe6>
    iput(ip);
  103420:	83 ec 0c             	sub    $0xc,%esp
  103423:	ff 75 f4             	push   -0xc(%ebp)
  103426:	e8 61 f5 ff ff       	call   10298c <iput>
  10342b:	83 c4 10             	add    $0x10,%esp
    return 0;
  10342e:	b8 00 00 00 00       	mov    $0x0,%eax
  103433:	eb 03                	jmp    103438 <namex+0xe9>
  }
  return ip;
  103435:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103438:	c9                   	leave
  103439:	c3                   	ret

0010343a <namei>:

struct inode*
namei(char *path)
{
  10343a:	55                   	push   %ebp
  10343b:	89 e5                	mov    %esp,%ebp
  10343d:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
  103440:	83 ec 04             	sub    $0x4,%esp
  103443:	8d 45 ea             	lea    -0x16(%ebp),%eax
  103446:	50                   	push   %eax
  103447:	6a 00                	push   $0x0
  103449:	ff 75 08             	push   0x8(%ebp)
  10344c:	e8 fe fe ff ff       	call   10334f <namex>
  103451:	83 c4 10             	add    $0x10,%esp
}
  103454:	c9                   	leave
  103455:	c3                   	ret

00103456 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
  103456:	55                   	push   %ebp
  103457:	89 e5                	mov    %esp,%ebp
  103459:	83 ec 08             	sub    $0x8,%esp
  return namex(path, 1, name);
  10345c:	83 ec 04             	sub    $0x4,%esp
  10345f:	ff 75 0c             	push   0xc(%ebp)
  103462:	6a 01                	push   $0x1
  103464:	ff 75 08             	push   0x8(%ebp)
  103467:	e8 e3 fe ff ff       	call   10334f <namex>
  10346c:	83 c4 10             	add    $0x10,%esp
}
  10346f:	c9                   	leave
  103470:	c3                   	ret

00103471 <filealloc>:
} ftable;

// Allocate a file structure.
struct file*
filealloc(void)
{
  103471:	55                   	push   %ebp
  103472:	89 e5                	mov    %esp,%ebp
  103474:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  for(f = ftable.file; f < ftable.file + NFILE; f++){
  103477:	c7 45 fc a0 c3 10 00 	movl   $0x10c3a0,-0x4(%ebp)
  10347e:	eb 1d                	jmp    10349d <filealloc+0x2c>
    if(f->ref == 0){
  103480:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103483:	8b 40 04             	mov    0x4(%eax),%eax
  103486:	85 c0                	test   %eax,%eax
  103488:	75 0f                	jne    103499 <filealloc+0x28>
      f->ref = 1;
  10348a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10348d:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
      return f;
  103494:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103497:	eb 13                	jmp    1034ac <filealloc+0x3b>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
  103499:	83 45 fc 14          	addl   $0x14,-0x4(%ebp)
  10349d:	b8 70 cb 10 00       	mov    $0x10cb70,%eax
  1034a2:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1034a5:	72 d9                	jb     103480 <filealloc+0xf>
    }
  }
  return 0;
  1034a7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1034ac:	c9                   	leave
  1034ad:	c3                   	ret

001034ae <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
  1034ae:	55                   	push   %ebp
  1034af:	89 e5                	mov    %esp,%ebp
  1034b1:	83 ec 08             	sub    $0x8,%esp
  if(f->ref < 1)
  1034b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b7:	8b 40 04             	mov    0x4(%eax),%eax
  1034ba:	85 c0                	test   %eax,%eax
  1034bc:	7f 0d                	jg     1034cb <filedup+0x1d>
    panic("filedup");
  1034be:	83 ec 0c             	sub    $0xc,%esp
  1034c1:	68 93 44 10 00       	push   $0x104493
  1034c6:	e8 e3 cd ff ff       	call   1002ae <panic>
  f->ref++;
  1034cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ce:	8b 40 04             	mov    0x4(%eax),%eax
  1034d1:	8d 50 01             	lea    0x1(%eax),%edx
  1034d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1034d7:	89 50 04             	mov    %edx,0x4(%eax)
  return f;
  1034da:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1034dd:	c9                   	leave
  1034de:	c3                   	ret

001034df <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
  1034df:	55                   	push   %ebp
  1034e0:	89 e5                	mov    %esp,%ebp
  1034e2:	83 ec 28             	sub    $0x28,%esp
  struct file ff;

  if(f->ref < 1)
  1034e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1034e8:	8b 40 04             	mov    0x4(%eax),%eax
  1034eb:	85 c0                	test   %eax,%eax
  1034ed:	7f 0d                	jg     1034fc <fileclose+0x1d>
    panic("fileclose");
  1034ef:	83 ec 0c             	sub    $0xc,%esp
  1034f2:	68 9b 44 10 00       	push   $0x10449b
  1034f7:	e8 b2 cd ff ff       	call   1002ae <panic>
  if(--f->ref > 0){
  1034fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ff:	8b 40 04             	mov    0x4(%eax),%eax
  103502:	8d 50 ff             	lea    -0x1(%eax),%edx
  103505:	8b 45 08             	mov    0x8(%ebp),%eax
  103508:	89 50 04             	mov    %edx,0x4(%eax)
  10350b:	8b 45 08             	mov    0x8(%ebp),%eax
  10350e:	8b 40 04             	mov    0x4(%eax),%eax
  103511:	85 c0                	test   %eax,%eax
  103513:	7f 56                	jg     10356b <fileclose+0x8c>
    return;
  }
  ff = *f;
  103515:	8b 45 08             	mov    0x8(%ebp),%eax
  103518:	8b 10                	mov    (%eax),%edx
  10351a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10351d:	8b 50 04             	mov    0x4(%eax),%edx
  103520:	89 55 e8             	mov    %edx,-0x18(%ebp)
  103523:	8b 50 08             	mov    0x8(%eax),%edx
  103526:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103529:	8b 50 0c             	mov    0xc(%eax),%edx
  10352c:	89 55 f0             	mov    %edx,-0x10(%ebp)
  10352f:	8b 40 10             	mov    0x10(%eax),%eax
  103532:	89 45 f4             	mov    %eax,-0xc(%ebp)
  f->ref = 0;
  103535:	8b 45 08             	mov    0x8(%ebp),%eax
  103538:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  f->type = FD_NONE;
  10353f:	8b 45 08             	mov    0x8(%ebp),%eax
  103542:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(ff.type == FD_INODE){
  103548:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10354b:	83 f8 01             	cmp    $0x1,%eax
  10354e:	75 1c                	jne    10356c <fileclose+0x8d>
    begin_op();
  103550:	e8 d2 09 00 00       	call   103f27 <begin_op>
    iput(ff.ip);
  103555:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103558:	83 ec 0c             	sub    $0xc,%esp
  10355b:	50                   	push   %eax
  10355c:	e8 2b f4 ff ff       	call   10298c <iput>
  103561:	83 c4 10             	add    $0x10,%esp
    end_op();
  103564:	e8 c4 09 00 00       	call   103f2d <end_op>
  103569:	eb 01                	jmp    10356c <fileclose+0x8d>
    return;
  10356b:	90                   	nop
  }
}
  10356c:	c9                   	leave
  10356d:	c3                   	ret

0010356e <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
  10356e:	55                   	push   %ebp
  10356f:	89 e5                	mov    %esp,%ebp
  103571:	83 ec 08             	sub    $0x8,%esp
  if(f->type == FD_INODE){
  103574:	8b 45 08             	mov    0x8(%ebp),%eax
  103577:	8b 00                	mov    (%eax),%eax
  103579:	83 f8 01             	cmp    $0x1,%eax
  10357c:	75 2e                	jne    1035ac <filestat+0x3e>
    iread(f->ip);
  10357e:	8b 45 08             	mov    0x8(%ebp),%eax
  103581:	8b 40 0c             	mov    0xc(%eax),%eax
  103584:	83 ec 0c             	sub    $0xc,%esp
  103587:	50                   	push   %eax
  103588:	e8 db f5 ff ff       	call   102b68 <iread>
  10358d:	83 c4 10             	add    $0x10,%esp
    stati(f->ip, st);
  103590:	8b 45 08             	mov    0x8(%ebp),%eax
  103593:	8b 40 0c             	mov    0xc(%eax),%eax
  103596:	83 ec 08             	sub    $0x8,%esp
  103599:	ff 75 0c             	push   0xc(%ebp)
  10359c:	50                   	push   %eax
  10359d:	e8 05 f9 ff ff       	call   102ea7 <stati>
  1035a2:	83 c4 10             	add    $0x10,%esp
    return 0;
  1035a5:	b8 00 00 00 00       	mov    $0x0,%eax
  1035aa:	eb 05                	jmp    1035b1 <filestat+0x43>
  }
  return -1;
  1035ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  1035b1:	c9                   	leave
  1035b2:	c3                   	ret

001035b3 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
  1035b3:	55                   	push   %ebp
  1035b4:	89 e5                	mov    %esp,%ebp
  1035b6:	83 ec 18             	sub    $0x18,%esp
  int r;

  if(f->readable == 0)
  1035b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1035bc:	0f b6 40 08          	movzbl 0x8(%eax),%eax
  1035c0:	84 c0                	test   %al,%al
  1035c2:	75 07                	jne    1035cb <fileread+0x18>
    return -1;
  1035c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1035c9:	eb 65                	jmp    103630 <fileread+0x7d>
  if(f->type == FD_INODE){
  1035cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1035ce:	8b 00                	mov    (%eax),%eax
  1035d0:	83 f8 01             	cmp    $0x1,%eax
  1035d3:	75 4e                	jne    103623 <fileread+0x70>
    iread(f->ip);
  1035d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1035d8:	8b 40 0c             	mov    0xc(%eax),%eax
  1035db:	83 ec 0c             	sub    $0xc,%esp
  1035de:	50                   	push   %eax
  1035df:	e8 84 f5 ff ff       	call   102b68 <iread>
  1035e4:	83 c4 10             	add    $0x10,%esp
    if((r = readi(f->ip, addr, f->off, n)) > 0)
  1035e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1035ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1035ed:	8b 50 10             	mov    0x10(%eax),%edx
  1035f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1035f3:	8b 40 0c             	mov    0xc(%eax),%eax
  1035f6:	51                   	push   %ecx
  1035f7:	52                   	push   %edx
  1035f8:	ff 75 0c             	push   0xc(%ebp)
  1035fb:	50                   	push   %eax
  1035fc:	e8 ec f8 ff ff       	call   102eed <readi>
  103601:	83 c4 10             	add    $0x10,%esp
  103604:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103607:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10360b:	7e 11                	jle    10361e <fileread+0x6b>
      f->off += r;
  10360d:	8b 45 08             	mov    0x8(%ebp),%eax
  103610:	8b 50 10             	mov    0x10(%eax),%edx
  103613:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103616:	01 c2                	add    %eax,%edx
  103618:	8b 45 08             	mov    0x8(%ebp),%eax
  10361b:	89 50 10             	mov    %edx,0x10(%eax)
    return r;
  10361e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103621:	eb 0d                	jmp    103630 <fileread+0x7d>
  }
  panic("fileread");
  103623:	83 ec 0c             	sub    $0xc,%esp
  103626:	68 a5 44 10 00       	push   $0x1044a5
  10362b:	e8 7e cc ff ff       	call   1002ae <panic>
}
  103630:	c9                   	leave
  103631:	c3                   	ret

00103632 <filewrite>:

// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
  103632:	55                   	push   %ebp
  103633:	89 e5                	mov    %esp,%ebp
  103635:	53                   	push   %ebx
  103636:	83 ec 14             	sub    $0x14,%esp
  int r;

  if(f->writable == 0)
  103639:	8b 45 08             	mov    0x8(%ebp),%eax
  10363c:	0f b6 40 09          	movzbl 0x9(%eax),%eax
  103640:	84 c0                	test   %al,%al
  103642:	75 0a                	jne    10364e <filewrite+0x1c>
    return -1;
  103644:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103649:	e9 e2 00 00 00       	jmp    103730 <filewrite+0xfe>
  if(f->type == FD_INODE){
  10364e:	8b 45 08             	mov    0x8(%ebp),%eax
  103651:	8b 00                	mov    (%eax),%eax
  103653:	83 f8 01             	cmp    $0x1,%eax
  103656:	0f 85 c7 00 00 00    	jne    103723 <filewrite+0xf1>
    // write a few blocks at a time
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
  10365c:	c7 45 ec 00 06 00 00 	movl   $0x600,-0x14(%ebp)
    int i = 0;
  103663:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while(i < n){
  10366a:	e9 91 00 00 00       	jmp    103700 <filewrite+0xce>
      int n1 = n - i;
  10366f:	8b 45 10             	mov    0x10(%ebp),%eax
  103672:	2b 45 f4             	sub    -0xc(%ebp),%eax
  103675:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if(n1 > max)
  103678:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10367b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10367e:	7e 06                	jle    103686 <filewrite+0x54>
        n1 = max;
  103680:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103683:	89 45 f0             	mov    %eax,-0x10(%ebp)

			begin_op();
  103686:	e8 9c 08 00 00       	call   103f27 <begin_op>
      iread(f->ip);
  10368b:	8b 45 08             	mov    0x8(%ebp),%eax
  10368e:	8b 40 0c             	mov    0xc(%eax),%eax
  103691:	83 ec 0c             	sub    $0xc,%esp
  103694:	50                   	push   %eax
  103695:	e8 ce f4 ff ff       	call   102b68 <iread>
  10369a:	83 c4 10             	add    $0x10,%esp
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
  10369d:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  1036a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1036a3:	8b 50 10             	mov    0x10(%eax),%edx
  1036a6:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  1036a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036ac:	01 c3                	add    %eax,%ebx
  1036ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1036b1:	8b 40 0c             	mov    0xc(%eax),%eax
  1036b4:	51                   	push   %ecx
  1036b5:	52                   	push   %edx
  1036b6:	53                   	push   %ebx
  1036b7:	50                   	push   %eax
  1036b8:	e8 28 f9 ff ff       	call   102fe5 <writei>
  1036bd:	83 c4 10             	add    $0x10,%esp
  1036c0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1036c3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1036c7:	7e 11                	jle    1036da <filewrite+0xa8>
        f->off += r;
  1036c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1036cc:	8b 50 10             	mov    0x10(%eax),%edx
  1036cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1036d2:	01 c2                	add    %eax,%edx
  1036d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1036d7:	89 50 10             	mov    %edx,0x10(%eax)
      end_op();
  1036da:	e8 4e 08 00 00       	call   103f2d <end_op>

      if(r < 0)
  1036df:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1036e3:	78 29                	js     10370e <filewrite+0xdc>
        break;
      if(r != n1)
  1036e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1036e8:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  1036eb:	74 0d                	je     1036fa <filewrite+0xc8>
        panic("short filewrite");
  1036ed:	83 ec 0c             	sub    $0xc,%esp
  1036f0:	68 ae 44 10 00       	push   $0x1044ae
  1036f5:	e8 b4 cb ff ff       	call   1002ae <panic>
      i += r;
  1036fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1036fd:	01 45 f4             	add    %eax,-0xc(%ebp)
    while(i < n){
  103700:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103703:	3b 45 10             	cmp    0x10(%ebp),%eax
  103706:	0f 8c 63 ff ff ff    	jl     10366f <filewrite+0x3d>
  10370c:	eb 01                	jmp    10370f <filewrite+0xdd>
        break;
  10370e:	90                   	nop
    }
    return i == n ? n : -1;
  10370f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103712:	3b 45 10             	cmp    0x10(%ebp),%eax
  103715:	75 05                	jne    10371c <filewrite+0xea>
  103717:	8b 45 10             	mov    0x10(%ebp),%eax
  10371a:	eb 14                	jmp    103730 <filewrite+0xfe>
  10371c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103721:	eb 0d                	jmp    103730 <filewrite+0xfe>
  }
  panic("filewrite");
  103723:	83 ec 0c             	sub    $0xc,%esp
  103726:	68 be 44 10 00       	push   $0x1044be
  10372b:	e8 7e cb ff ff       	call   1002ae <panic>
}
  103730:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103733:	c9                   	leave
  103734:	c3                   	ret

00103735 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
int
isdirempty(struct inode *dp)
{
  103735:	55                   	push   %ebp
  103736:	89 e5                	mov    %esp,%ebp
  103738:	83 ec 28             	sub    $0x28,%esp
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
  10373b:	c7 45 f4 20 00 00 00 	movl   $0x20,-0xc(%ebp)
  103742:	eb 40                	jmp    103784 <isdirempty+0x4f>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  103744:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103747:	6a 10                	push   $0x10
  103749:	50                   	push   %eax
  10374a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  10374d:	50                   	push   %eax
  10374e:	ff 75 08             	push   0x8(%ebp)
  103751:	e8 97 f7 ff ff       	call   102eed <readi>
  103756:	83 c4 10             	add    $0x10,%esp
  103759:	83 f8 10             	cmp    $0x10,%eax
  10375c:	74 0d                	je     10376b <isdirempty+0x36>
      panic("isdirempty: readi");
  10375e:	83 ec 0c             	sub    $0xc,%esp
  103761:	68 c8 44 10 00       	push   $0x1044c8
  103766:	e8 43 cb ff ff       	call   1002ae <panic>
    if(de.inum != 0)
  10376b:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  10376f:	66 85 c0             	test   %ax,%ax
  103772:	74 07                	je     10377b <isdirempty+0x46>
      return 0;
  103774:	b8 00 00 00 00       	mov    $0x0,%eax
  103779:	eb 1b                	jmp    103796 <isdirempty+0x61>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
  10377b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10377e:	83 c0 10             	add    $0x10,%eax
  103781:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103784:	8b 45 08             	mov    0x8(%ebp),%eax
  103787:	8b 40 18             	mov    0x18(%eax),%eax
  10378a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10378d:	39 c2                	cmp    %eax,%edx
  10378f:	72 b3                	jb     103744 <isdirempty+0xf>
  }
  return 1;
  103791:	b8 01 00 00 00       	mov    $0x1,%eax
}
  103796:	c9                   	leave
  103797:	c3                   	ret

00103798 <unlink>:

int
unlink(char* path, char* name)
{
  103798:	55                   	push   %ebp
  103799:	89 e5                	mov    %esp,%ebp
  10379b:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip, *dp;
  struct dirent de;
  uint off;

	begin_op();
  10379e:	e8 84 07 00 00       	call   103f27 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
  1037a3:	83 ec 08             	sub    $0x8,%esp
  1037a6:	ff 75 0c             	push   0xc(%ebp)
  1037a9:	ff 75 08             	push   0x8(%ebp)
  1037ac:	e8 a5 fc ff ff       	call   103456 <nameiparent>
  1037b1:	83 c4 10             	add    $0x10,%esp
  1037b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1037b7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1037bb:	75 0f                	jne    1037cc <unlink+0x34>
    end_op();
  1037bd:	e8 6b 07 00 00       	call   103f2d <end_op>
    return -1;
  1037c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1037c7:	e9 8c 01 00 00       	jmp    103958 <unlink+0x1c0>
  }

  iread(dp);
  1037cc:	83 ec 0c             	sub    $0xc,%esp
  1037cf:	ff 75 f4             	push   -0xc(%ebp)
  1037d2:	e8 91 f3 ff ff       	call   102b68 <iread>
  1037d7:	83 c4 10             	add    $0x10,%esp

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
  1037da:	83 ec 08             	sub    $0x8,%esp
  1037dd:	68 da 44 10 00       	push   $0x1044da
  1037e2:	ff 75 0c             	push   0xc(%ebp)
  1037e5:	e8 18 f9 ff ff       	call   103102 <namecmp>
  1037ea:	83 c4 10             	add    $0x10,%esp
  1037ed:	85 c0                	test   %eax,%eax
  1037ef:	0f 84 47 01 00 00    	je     10393c <unlink+0x1a4>
  1037f5:	83 ec 08             	sub    $0x8,%esp
  1037f8:	68 dc 44 10 00       	push   $0x1044dc
  1037fd:	ff 75 0c             	push   0xc(%ebp)
  103800:	e8 fd f8 ff ff       	call   103102 <namecmp>
  103805:	83 c4 10             	add    $0x10,%esp
  103808:	85 c0                	test   %eax,%eax
  10380a:	0f 84 2c 01 00 00    	je     10393c <unlink+0x1a4>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
  103810:	83 ec 04             	sub    $0x4,%esp
  103813:	8d 45 dc             	lea    -0x24(%ebp),%eax
  103816:	50                   	push   %eax
  103817:	ff 75 0c             	push   0xc(%ebp)
  10381a:	ff 75 f4             	push   -0xc(%ebp)
  10381d:	e8 fb f8 ff ff       	call   10311d <dirlookup>
  103822:	83 c4 10             	add    $0x10,%esp
  103825:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103828:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10382c:	0f 84 0d 01 00 00    	je     10393f <unlink+0x1a7>
    goto bad;
  iread(ip);
  103832:	83 ec 0c             	sub    $0xc,%esp
  103835:	ff 75 f0             	push   -0x10(%ebp)
  103838:	e8 2b f3 ff ff       	call   102b68 <iread>
  10383d:	83 c4 10             	add    $0x10,%esp

  if(ip->nlink < 1)
  103840:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103843:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  103847:	66 85 c0             	test   %ax,%ax
  10384a:	7f 0d                	jg     103859 <unlink+0xc1>
    panic("unlink: nlink < 1");
  10384c:	83 ec 0c             	sub    $0xc,%esp
  10384f:	68 df 44 10 00       	push   $0x1044df
  103854:	e8 55 ca ff ff       	call   1002ae <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
  103859:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10385c:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103860:	66 83 f8 01          	cmp    $0x1,%ax
  103864:	75 25                	jne    10388b <unlink+0xf3>
  103866:	83 ec 0c             	sub    $0xc,%esp
  103869:	ff 75 f0             	push   -0x10(%ebp)
  10386c:	e8 c4 fe ff ff       	call   103735 <isdirempty>
  103871:	83 c4 10             	add    $0x10,%esp
  103874:	85 c0                	test   %eax,%eax
  103876:	75 13                	jne    10388b <unlink+0xf3>
    iput(ip);
  103878:	83 ec 0c             	sub    $0xc,%esp
  10387b:	ff 75 f0             	push   -0x10(%ebp)
  10387e:	e8 09 f1 ff ff       	call   10298c <iput>
  103883:	83 c4 10             	add    $0x10,%esp
    goto bad;
  103886:	e9 b5 00 00 00       	jmp    103940 <unlink+0x1a8>
  }

  memset(&de, 0, sizeof(de));
  10388b:	83 ec 04             	sub    $0x4,%esp
  10388e:	6a 10                	push   $0x10
  103890:	6a 00                	push   $0x0
  103892:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103895:	50                   	push   %eax
  103896:	e8 12 d6 ff ff       	call   100ead <memset>
  10389b:	83 c4 10             	add    $0x10,%esp
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  10389e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1038a1:	6a 10                	push   $0x10
  1038a3:	50                   	push   %eax
  1038a4:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1038a7:	50                   	push   %eax
  1038a8:	ff 75 f4             	push   -0xc(%ebp)
  1038ab:	e8 35 f7 ff ff       	call   102fe5 <writei>
  1038b0:	83 c4 10             	add    $0x10,%esp
  1038b3:	83 f8 10             	cmp    $0x10,%eax
  1038b6:	74 0d                	je     1038c5 <unlink+0x12d>
    panic("unlink: writei");
  1038b8:	83 ec 0c             	sub    $0xc,%esp
  1038bb:	68 f1 44 10 00       	push   $0x1044f1
  1038c0:	e8 e9 c9 ff ff       	call   1002ae <panic>
  if(ip->type == T_DIR){
  1038c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1038c8:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  1038cc:	66 83 f8 01          	cmp    $0x1,%ax
  1038d0:	75 21                	jne    1038f3 <unlink+0x15b>
    dp->nlink--;
  1038d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1038d5:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  1038d9:	83 e8 01             	sub    $0x1,%eax
  1038dc:	89 c2                	mov    %eax,%edx
  1038de:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1038e1:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
  1038e5:	83 ec 0c             	sub    $0xc,%esp
  1038e8:	ff 75 f4             	push   -0xc(%ebp)
  1038eb:	e8 08 f1 ff ff       	call   1029f8 <iupdate>
  1038f0:	83 c4 10             	add    $0x10,%esp
  }
  iput(dp);
  1038f3:	83 ec 0c             	sub    $0xc,%esp
  1038f6:	ff 75 f4             	push   -0xc(%ebp)
  1038f9:	e8 8e f0 ff ff       	call   10298c <iput>
  1038fe:	83 c4 10             	add    $0x10,%esp

  ip->nlink--;
  103901:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103904:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  103908:	83 e8 01             	sub    $0x1,%eax
  10390b:	89 c2                	mov    %eax,%edx
  10390d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103910:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
  103914:	83 ec 0c             	sub    $0xc,%esp
  103917:	ff 75 f0             	push   -0x10(%ebp)
  10391a:	e8 d9 f0 ff ff       	call   1029f8 <iupdate>
  10391f:	83 c4 10             	add    $0x10,%esp
  iput(ip);
  103922:	83 ec 0c             	sub    $0xc,%esp
  103925:	ff 75 f0             	push   -0x10(%ebp)
  103928:	e8 5f f0 ff ff       	call   10298c <iput>
  10392d:	83 c4 10             	add    $0x10,%esp

  end_op();
  103930:	e8 f8 05 00 00       	call   103f2d <end_op>
  return 0;
  103935:	b8 00 00 00 00       	mov    $0x0,%eax
  10393a:	eb 1c                	jmp    103958 <unlink+0x1c0>
    goto bad;
  10393c:	90                   	nop
  10393d:	eb 01                	jmp    103940 <unlink+0x1a8>
    goto bad;
  10393f:	90                   	nop

bad:
  iput(dp);
  103940:	83 ec 0c             	sub    $0xc,%esp
  103943:	ff 75 f4             	push   -0xc(%ebp)
  103946:	e8 41 f0 ff ff       	call   10298c <iput>
  10394b:	83 c4 10             	add    $0x10,%esp
  end_op();
  10394e:	e8 da 05 00 00       	call   103f2d <end_op>
  return -1;
  103953:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  103958:	c9                   	leave
  103959:	c3                   	ret

0010395a <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
  10395a:	55                   	push   %ebp
  10395b:	89 e5                	mov    %esp,%ebp
  10395d:	83 ec 38             	sub    $0x38,%esp
  103960:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  103963:	8b 55 10             	mov    0x10(%ebp),%edx
  103966:	8b 45 14             	mov    0x14(%ebp),%eax
  103969:	66 89 4d d4          	mov    %cx,-0x2c(%ebp)
  10396d:	66 89 55 d0          	mov    %dx,-0x30(%ebp)
  103971:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
  103975:	83 ec 08             	sub    $0x8,%esp
  103978:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  10397b:	50                   	push   %eax
  10397c:	ff 75 08             	push   0x8(%ebp)
  10397f:	e8 d2 fa ff ff       	call   103456 <nameiparent>
  103984:	83 c4 10             	add    $0x10,%esp
  103987:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10398a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10398e:	75 0a                	jne    10399a <create+0x40>
    return 0;
  103990:	b8 00 00 00 00       	mov    $0x0,%eax
  103995:	e9 8e 01 00 00       	jmp    103b28 <create+0x1ce>
  iread(dp);
  10399a:	83 ec 0c             	sub    $0xc,%esp
  10399d:	ff 75 f4             	push   -0xc(%ebp)
  1039a0:	e8 c3 f1 ff ff       	call   102b68 <iread>
  1039a5:	83 c4 10             	add    $0x10,%esp

  if((ip = dirlookup(dp, name, 0)) != 0){
  1039a8:	83 ec 04             	sub    $0x4,%esp
  1039ab:	6a 00                	push   $0x0
  1039ad:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  1039b0:	50                   	push   %eax
  1039b1:	ff 75 f4             	push   -0xc(%ebp)
  1039b4:	e8 64 f7 ff ff       	call   10311d <dirlookup>
  1039b9:	83 c4 10             	add    $0x10,%esp
  1039bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1039bf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1039c3:	74 50                	je     103a15 <create+0xbb>
    iput(dp);
  1039c5:	83 ec 0c             	sub    $0xc,%esp
  1039c8:	ff 75 f4             	push   -0xc(%ebp)
  1039cb:	e8 bc ef ff ff       	call   10298c <iput>
  1039d0:	83 c4 10             	add    $0x10,%esp
    iread(ip);
  1039d3:	83 ec 0c             	sub    $0xc,%esp
  1039d6:	ff 75 f0             	push   -0x10(%ebp)
  1039d9:	e8 8a f1 ff ff       	call   102b68 <iread>
  1039de:	83 c4 10             	add    $0x10,%esp
    if(type == T_FILE && ip->type == T_FILE)
  1039e1:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
  1039e6:	75 15                	jne    1039fd <create+0xa3>
  1039e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1039eb:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  1039ef:	66 83 f8 02          	cmp    $0x2,%ax
  1039f3:	75 08                	jne    1039fd <create+0xa3>
      return ip;
  1039f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1039f8:	e9 2b 01 00 00       	jmp    103b28 <create+0x1ce>
    iput(ip);
  1039fd:	83 ec 0c             	sub    $0xc,%esp
  103a00:	ff 75 f0             	push   -0x10(%ebp)
  103a03:	e8 84 ef ff ff       	call   10298c <iput>
  103a08:	83 c4 10             	add    $0x10,%esp
    return 0;
  103a0b:	b8 00 00 00 00       	mov    $0x0,%eax
  103a10:	e9 13 01 00 00       	jmp    103b28 <create+0x1ce>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
  103a15:	0f bf 55 d4          	movswl -0x2c(%ebp),%edx
  103a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103a1c:	8b 00                	mov    (%eax),%eax
  103a1e:	83 ec 08             	sub    $0x8,%esp
  103a21:	52                   	push   %edx
  103a22:	50                   	push   %eax
  103a23:	e8 8e ee ff ff       	call   1028b6 <ialloc>
  103a28:	83 c4 10             	add    $0x10,%esp
  103a2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103a2e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103a32:	75 0d                	jne    103a41 <create+0xe7>
    panic("create: ialloc");
  103a34:	83 ec 0c             	sub    $0xc,%esp
  103a37:	68 00 45 10 00       	push   $0x104500
  103a3c:	e8 6d c8 ff ff       	call   1002ae <panic>

  iread(ip);
  103a41:	83 ec 0c             	sub    $0xc,%esp
  103a44:	ff 75 f0             	push   -0x10(%ebp)
  103a47:	e8 1c f1 ff ff       	call   102b68 <iread>
  103a4c:	83 c4 10             	add    $0x10,%esp
  ip->major = major;
  103a4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103a52:	0f b7 55 d0          	movzwl -0x30(%ebp),%edx
  103a56:	66 89 50 12          	mov    %dx,0x12(%eax)
  ip->minor = minor;
  103a5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103a5d:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
  103a61:	66 89 50 14          	mov    %dx,0x14(%eax)
  ip->nlink = 1;
  103a65:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103a68:	66 c7 40 16 01 00    	movw   $0x1,0x16(%eax)
  iupdate(ip);
  103a6e:	83 ec 0c             	sub    $0xc,%esp
  103a71:	ff 75 f0             	push   -0x10(%ebp)
  103a74:	e8 7f ef ff ff       	call   1029f8 <iupdate>
  103a79:	83 c4 10             	add    $0x10,%esp

  if(type == T_DIR){  // Create . and .. entries.
  103a7c:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
  103a81:	75 6a                	jne    103aed <create+0x193>
    dp->nlink++;  // for ".."
  103a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103a86:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  103a8a:	83 c0 01             	add    $0x1,%eax
  103a8d:	89 c2                	mov    %eax,%edx
  103a8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103a92:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
  103a96:	83 ec 0c             	sub    $0xc,%esp
  103a99:	ff 75 f4             	push   -0xc(%ebp)
  103a9c:	e8 57 ef ff ff       	call   1029f8 <iupdate>
  103aa1:	83 c4 10             	add    $0x10,%esp
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
  103aa4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103aa7:	8b 40 04             	mov    0x4(%eax),%eax
  103aaa:	83 ec 04             	sub    $0x4,%esp
  103aad:	50                   	push   %eax
  103aae:	68 da 44 10 00       	push   $0x1044da
  103ab3:	ff 75 f0             	push   -0x10(%ebp)
  103ab6:	e8 1c f7 ff ff       	call   1031d7 <dirlink>
  103abb:	83 c4 10             	add    $0x10,%esp
  103abe:	85 c0                	test   %eax,%eax
  103ac0:	78 1e                	js     103ae0 <create+0x186>
  103ac2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103ac5:	8b 40 04             	mov    0x4(%eax),%eax
  103ac8:	83 ec 04             	sub    $0x4,%esp
  103acb:	50                   	push   %eax
  103acc:	68 dc 44 10 00       	push   $0x1044dc
  103ad1:	ff 75 f0             	push   -0x10(%ebp)
  103ad4:	e8 fe f6 ff ff       	call   1031d7 <dirlink>
  103ad9:	83 c4 10             	add    $0x10,%esp
  103adc:	85 c0                	test   %eax,%eax
  103ade:	79 0d                	jns    103aed <create+0x193>
      panic("create dots");
  103ae0:	83 ec 0c             	sub    $0xc,%esp
  103ae3:	68 0f 45 10 00       	push   $0x10450f
  103ae8:	e8 c1 c7 ff ff       	call   1002ae <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
  103aed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103af0:	8b 40 04             	mov    0x4(%eax),%eax
  103af3:	83 ec 04             	sub    $0x4,%esp
  103af6:	50                   	push   %eax
  103af7:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  103afa:	50                   	push   %eax
  103afb:	ff 75 f4             	push   -0xc(%ebp)
  103afe:	e8 d4 f6 ff ff       	call   1031d7 <dirlink>
  103b03:	83 c4 10             	add    $0x10,%esp
  103b06:	85 c0                	test   %eax,%eax
  103b08:	79 0d                	jns    103b17 <create+0x1bd>
    panic("create: dirlink");
  103b0a:	83 ec 0c             	sub    $0xc,%esp
  103b0d:	68 1b 45 10 00       	push   $0x10451b
  103b12:	e8 97 c7 ff ff       	call   1002ae <panic>

  iput(dp);
  103b17:	83 ec 0c             	sub    $0xc,%esp
  103b1a:	ff 75 f4             	push   -0xc(%ebp)
  103b1d:	e8 6a ee ff ff       	call   10298c <iput>
  103b22:	83 c4 10             	add    $0x10,%esp

  return ip;
  103b25:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  103b28:	c9                   	leave
  103b29:	c3                   	ret

00103b2a <open>:


struct file*
open(char* path, int omode)
{
  103b2a:	55                   	push   %ebp
  103b2b:	89 e5                	mov    %esp,%ebp
  103b2d:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;

  begin_op();
  103b30:	e8 f2 03 00 00       	call   103f27 <begin_op>

  if(omode & O_CREATE){
  103b35:	8b 45 0c             	mov    0xc(%ebp),%eax
  103b38:	25 00 02 00 00       	and    $0x200,%eax
  103b3d:	85 c0                	test   %eax,%eax
  103b3f:	74 29                	je     103b6a <open+0x40>
    ip = create(path, T_FILE, 0, 0);
  103b41:	6a 00                	push   $0x0
  103b43:	6a 00                	push   $0x0
  103b45:	6a 02                	push   $0x2
  103b47:	ff 75 08             	push   0x8(%ebp)
  103b4a:	e8 0b fe ff ff       	call   10395a <create>
  103b4f:	83 c4 10             	add    $0x10,%esp
  103b52:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ip == 0){
  103b55:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103b59:	75 73                	jne    103bce <open+0xa4>
      end_op();
  103b5b:	e8 cd 03 00 00       	call   103f2d <end_op>
      return 0;
  103b60:	b8 00 00 00 00       	mov    $0x0,%eax
  103b65:	e9 eb 00 00 00       	jmp    103c55 <open+0x12b>
    }
  } else {
    if((ip = namei(path)) == 0){
  103b6a:	83 ec 0c             	sub    $0xc,%esp
  103b6d:	ff 75 08             	push   0x8(%ebp)
  103b70:	e8 c5 f8 ff ff       	call   10343a <namei>
  103b75:	83 c4 10             	add    $0x10,%esp
  103b78:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103b7b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103b7f:	75 0f                	jne    103b90 <open+0x66>
      end_op();
  103b81:	e8 a7 03 00 00       	call   103f2d <end_op>
      return 0;
  103b86:	b8 00 00 00 00       	mov    $0x0,%eax
  103b8b:	e9 c5 00 00 00       	jmp    103c55 <open+0x12b>
    }
    iread(ip);
  103b90:	83 ec 0c             	sub    $0xc,%esp
  103b93:	ff 75 f4             	push   -0xc(%ebp)
  103b96:	e8 cd ef ff ff       	call   102b68 <iread>
  103b9b:	83 c4 10             	add    $0x10,%esp
    if(ip->type == T_DIR && omode != O_RDONLY){
  103b9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103ba1:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103ba5:	66 83 f8 01          	cmp    $0x1,%ax
  103ba9:	75 23                	jne    103bce <open+0xa4>
  103bab:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103baf:	74 1d                	je     103bce <open+0xa4>
      iput(ip);
  103bb1:	83 ec 0c             	sub    $0xc,%esp
  103bb4:	ff 75 f4             	push   -0xc(%ebp)
  103bb7:	e8 d0 ed ff ff       	call   10298c <iput>
  103bbc:	83 c4 10             	add    $0x10,%esp
      end_op();
  103bbf:	e8 69 03 00 00       	call   103f2d <end_op>
      return 0;
  103bc4:	b8 00 00 00 00       	mov    $0x0,%eax
  103bc9:	e9 87 00 00 00       	jmp    103c55 <open+0x12b>
    }
  }

  struct file* f;
  if((f = filealloc()) == 0) { 
  103bce:	e8 9e f8 ff ff       	call   103471 <filealloc>
  103bd3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103bd6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103bda:	75 1a                	jne    103bf6 <open+0xcc>
    iput(ip);
  103bdc:	83 ec 0c             	sub    $0xc,%esp
  103bdf:	ff 75 f4             	push   -0xc(%ebp)
  103be2:	e8 a5 ed ff ff       	call   10298c <iput>
  103be7:	83 c4 10             	add    $0x10,%esp
    end_op();
  103bea:	e8 3e 03 00 00       	call   103f2d <end_op>
    return 0;
  103bef:	b8 00 00 00 00       	mov    $0x0,%eax
  103bf4:	eb 5f                	jmp    103c55 <open+0x12b>
  }

  f->type = FD_INODE;
  103bf6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103bf9:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  f->ip = ip;
  103bff:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c02:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103c05:	89 50 0c             	mov    %edx,0xc(%eax)
  f->off = 0;
  103c08:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c0b:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  f->readable = !(omode & O_WRONLY);
  103c12:	8b 45 0c             	mov    0xc(%ebp),%eax
  103c15:	83 e0 01             	and    $0x1,%eax
  103c18:	85 c0                	test   %eax,%eax
  103c1a:	0f 94 c0             	sete   %al
  103c1d:	89 c2                	mov    %eax,%edx
  103c1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c22:	88 50 08             	mov    %dl,0x8(%eax)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  103c25:	8b 45 0c             	mov    0xc(%ebp),%eax
  103c28:	83 e0 01             	and    $0x1,%eax
  103c2b:	85 c0                	test   %eax,%eax
  103c2d:	75 0a                	jne    103c39 <open+0x10f>
  103c2f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103c32:	83 e0 02             	and    $0x2,%eax
  103c35:	85 c0                	test   %eax,%eax
  103c37:	74 07                	je     103c40 <open+0x116>
  103c39:	b8 01 00 00 00       	mov    $0x1,%eax
  103c3e:	eb 05                	jmp    103c45 <open+0x11b>
  103c40:	b8 00 00 00 00       	mov    $0x0,%eax
  103c45:	89 c2                	mov    %eax,%edx
  103c47:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c4a:	88 50 09             	mov    %dl,0x9(%eax)
  end_op();
  103c4d:	e8 db 02 00 00       	call   103f2d <end_op>
  return f;
  103c52:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  103c55:	c9                   	leave
  103c56:	c3                   	ret

00103c57 <mkdir>:

int mkdir(char *path)
{
  103c57:	55                   	push   %ebp
  103c58:	89 e5                	mov    %esp,%ebp
  103c5a:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;

  begin_op();
  103c5d:	e8 c5 02 00 00       	call   103f27 <begin_op>
  if((ip = create(path, T_DIR, 0, 0)) == 0){
  103c62:	6a 00                	push   $0x0
  103c64:	6a 00                	push   $0x0
  103c66:	6a 01                	push   $0x1
  103c68:	ff 75 08             	push   0x8(%ebp)
  103c6b:	e8 ea fc ff ff       	call   10395a <create>
  103c70:	83 c4 10             	add    $0x10,%esp
  103c73:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103c76:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103c7a:	75 0c                	jne    103c88 <mkdir+0x31>
    end_op();
  103c7c:	e8 ac 02 00 00       	call   103f2d <end_op>
    return -1;
  103c81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103c86:	eb 18                	jmp    103ca0 <mkdir+0x49>
  }
  iput(ip);
  103c88:	83 ec 0c             	sub    $0xc,%esp
  103c8b:	ff 75 f4             	push   -0xc(%ebp)
  103c8e:	e8 f9 ec ff ff       	call   10298c <iput>
  103c93:	83 c4 10             	add    $0x10,%esp
  end_op();
  103c96:	e8 92 02 00 00       	call   103f2d <end_op>
  return 0;
  103c9b:	b8 00 00 00 00       	mov    $0x0,%eax
  103ca0:	c9                   	leave
  103ca1:	c3                   	ret

00103ca2 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
  103ca2:	55                   	push   %ebp
  103ca3:	89 e5                	mov    %esp,%ebp
  103ca5:	83 ec 28             	sub    $0x28,%esp
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  readsb(dev, &sb);
  103ca8:	83 ec 08             	sub    $0x8,%esp
  103cab:	8d 45 dc             	lea    -0x24(%ebp),%eax
  103cae:	50                   	push   %eax
  103caf:	ff 75 08             	push   0x8(%ebp)
  103cb2:	e8 03 e9 ff ff       	call   1025ba <readsb>
  103cb7:	83 c4 10             	add    $0x10,%esp
  log.start = sb.logstart;
  103cba:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103cbd:	a3 80 cb 10 00       	mov    %eax,0x10cb80
  log.size = sb.nlog;
  103cc2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103cc5:	a3 84 cb 10 00       	mov    %eax,0x10cb84
  log.dev = dev;
  103cca:	8b 45 08             	mov    0x8(%ebp),%eax
  103ccd:	a3 8c cb 10 00       	mov    %eax,0x10cb8c
  recover_from_log();
  103cd2:	e8 2e 02 00 00       	call   103f05 <recover_from_log>
}
  103cd7:	90                   	nop
  103cd8:	c9                   	leave
  103cd9:	c3                   	ret

00103cda <restore_from_log>:

// Copy committed blocks from log to their home location
static void
restore_from_log(void)
{
  103cda:	55                   	push   %ebp
  103cdb:	89 e5                	mov    %esp,%ebp
  103cdd:	83 ec 18             	sub    $0x18,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
  103ce0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103ce7:	e9 95 00 00 00       	jmp    103d81 <restore_from_log+0xa7>
        // we are supposed to write from the buffer  get the new values from cache.
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
  103cec:	8b 15 80 cb 10 00    	mov    0x10cb80,%edx
  103cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103cf5:	01 d0                	add    %edx,%eax
  103cf7:	83 c0 01             	add    $0x1,%eax
  103cfa:	89 c2                	mov    %eax,%edx
  103cfc:	a1 8c cb 10 00       	mov    0x10cb8c,%eax
  103d01:	83 ec 08             	sub    $0x8,%esp
  103d04:	52                   	push   %edx
  103d05:	50                   	push   %eax
  103d06:	e8 30 e3 ff ff       	call   10203b <bread>
  103d0b:	83 c4 10             	add    $0x10,%esp
  103d0e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
  103d11:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103d14:	83 c0 04             	add    $0x4,%eax
  103d17:	8b 04 85 84 cb 10 00 	mov    0x10cb84(,%eax,4),%eax
  103d1e:	89 c2                	mov    %eax,%edx
  103d20:	a1 8c cb 10 00       	mov    0x10cb8c,%eax
  103d25:	83 ec 08             	sub    $0x8,%esp
  103d28:	52                   	push   %edx
  103d29:	50                   	push   %eax
  103d2a:	e8 0c e3 ff ff       	call   10203b <bread>
  103d2f:	83 c4 10             	add    $0x10,%esp
  103d32:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
  103d35:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103d38:	8d 50 1c             	lea    0x1c(%eax),%edx
  103d3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103d3e:	83 c0 1c             	add    $0x1c,%eax
  103d41:	83 ec 04             	sub    $0x4,%esp
  103d44:	68 00 02 00 00       	push   $0x200
  103d49:	52                   	push   %edx
  103d4a:	50                   	push   %eax
  103d4b:	e8 1c d2 ff ff       	call   100f6c <memmove>
  103d50:	83 c4 10             	add    $0x10,%esp
    bwrite(dbuf);  // write dst to disk
  103d53:	83 ec 0c             	sub    $0xc,%esp
  103d56:	ff 75 ec             	push   -0x14(%ebp)
  103d59:	e8 16 e3 ff ff       	call   102074 <bwrite>
  103d5e:	83 c4 10             	add    $0x10,%esp
    brelse(lbuf);
  103d61:	83 ec 0c             	sub    $0xc,%esp
  103d64:	ff 75 f0             	push   -0x10(%ebp)
  103d67:	e8 c8 e3 ff ff       	call   102134 <brelse>
  103d6c:	83 c4 10             	add    $0x10,%esp
    brelse(dbuf);
  103d6f:	83 ec 0c             	sub    $0xc,%esp
  103d72:	ff 75 ec             	push   -0x14(%ebp)
  103d75:	e8 ba e3 ff ff       	call   102134 <brelse>
  103d7a:	83 c4 10             	add    $0x10,%esp
  for (tail = 0; tail < log.lh.n; tail++) {
  103d7d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103d81:	a1 90 cb 10 00       	mov    0x10cb90,%eax
  103d86:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103d89:	0f 8c 5d ff ff ff    	jl     103cec <restore_from_log+0x12>
  }
}
  103d8f:	90                   	nop
  103d90:	90                   	nop
  103d91:	c9                   	leave
  103d92:	c3                   	ret

00103d93 <install_trans>:
static void
install_trans(void)
{
  103d93:	55                   	push   %ebp
  103d94:	89 e5                	mov    %esp,%ebp
  103d96:	83 ec 18             	sub    $0x18,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
  103d99:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103da0:	eb 5e                	jmp    103e00 <install_trans+0x6d>
      if (tail == log.lh.n/2) panic("[UNDOLOG] Panic in install_trans type 5");
    }
        // we are supposed to write from the buffer  get the new values from cache.
    //struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
                // This must be in the cache right now.
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
  103da2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103da5:	83 c0 04             	add    $0x4,%eax
  103da8:	8b 04 85 84 cb 10 00 	mov    0x10cb84(,%eax,4),%eax
  103daf:	89 c2                	mov    %eax,%edx
  103db1:	a1 8c cb 10 00       	mov    0x10cb8c,%eax
  103db6:	83 ec 08             	sub    $0x8,%esp
  103db9:	52                   	push   %edx
  103dba:	50                   	push   %eax
  103dbb:	e8 7b e2 ff ff       	call   10203b <bread>
  103dc0:	83 c4 10             	add    $0x10,%esp
  103dc3:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if((dbuf->flags & (B_DIRTY|B_VALID)) != (B_DIRTY|B_VALID)){
  103dc6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103dc9:	8b 00                	mov    (%eax),%eax
  103dcb:	83 e0 06             	and    $0x6,%eax
  103dce:	83 f8 06             	cmp    $0x6,%eax
  103dd1:	74 0d                	je     103de0 <install_trans+0x4d>
                        panic("Fuck what the fuck stupid ass goddamnit\n");
  103dd3:	83 ec 0c             	sub    $0xc,%esp
  103dd6:	68 2c 45 10 00       	push   $0x10452c
  103ddb:	e8 ce c4 ff ff       	call   1002ae <panic>
                }
    //memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
  103de0:	83 ec 0c             	sub    $0xc,%esp
  103de3:	ff 75 f0             	push   -0x10(%ebp)
  103de6:	e8 89 e2 ff ff       	call   102074 <bwrite>
  103deb:	83 c4 10             	add    $0x10,%esp
    //brelse(lbuf);
    brelse(dbuf);
  103dee:	83 ec 0c             	sub    $0xc,%esp
  103df1:	ff 75 f0             	push   -0x10(%ebp)
  103df4:	e8 3b e3 ff ff       	call   102134 <brelse>
  103df9:	83 c4 10             	add    $0x10,%esp
  for (tail = 0; tail < log.lh.n; tail++) {
  103dfc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103e00:	a1 90 cb 10 00       	mov    0x10cb90,%eax
  103e05:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103e08:	7c 98                	jl     103da2 <install_trans+0xf>
  }
}
  103e0a:	90                   	nop
  103e0b:	90                   	nop
  103e0c:	c9                   	leave
  103e0d:	c3                   	ret

00103e0e <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  103e0e:	55                   	push   %ebp
  103e0f:	89 e5                	mov    %esp,%ebp
  103e11:	83 ec 18             	sub    $0x18,%esp
  struct buf *buf = bread(log.dev, log.start);
  103e14:	a1 80 cb 10 00       	mov    0x10cb80,%eax
  103e19:	89 c2                	mov    %eax,%edx
  103e1b:	a1 8c cb 10 00       	mov    0x10cb8c,%eax
  103e20:	83 ec 08             	sub    $0x8,%esp
  103e23:	52                   	push   %edx
  103e24:	50                   	push   %eax
  103e25:	e8 11 e2 ff ff       	call   10203b <bread>
  103e2a:	83 c4 10             	add    $0x10,%esp
  103e2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  struct logheader *lh = (struct logheader *) (buf->data);
  103e30:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103e33:	83 c0 1c             	add    $0x1c,%eax
  103e36:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int i;
  log.lh.n = lh->n;
  103e39:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103e3c:	8b 00                	mov    (%eax),%eax
  103e3e:	a3 90 cb 10 00       	mov    %eax,0x10cb90
  for (i = 0; i < log.lh.n; i++) {
  103e43:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103e4a:	eb 1b                	jmp    103e67 <read_head+0x59>
    log.lh.block[i] = lh->block[i];
  103e4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103e4f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103e52:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  103e56:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103e59:	83 c2 04             	add    $0x4,%edx
  103e5c:	89 04 95 84 cb 10 00 	mov    %eax,0x10cb84(,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
  103e63:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103e67:	a1 90 cb 10 00       	mov    0x10cb90,%eax
  103e6c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103e6f:	7c db                	jl     103e4c <read_head+0x3e>
  }
  brelse(buf);
  103e71:	83 ec 0c             	sub    $0xc,%esp
  103e74:	ff 75 f0             	push   -0x10(%ebp)
  103e77:	e8 b8 e2 ff ff       	call   102134 <brelse>
  103e7c:	83 c4 10             	add    $0x10,%esp
}
  103e7f:	90                   	nop
  103e80:	c9                   	leave
  103e81:	c3                   	ret

00103e82 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  103e82:	55                   	push   %ebp
  103e83:	89 e5                	mov    %esp,%ebp
  103e85:	83 ec 18             	sub    $0x18,%esp
  struct buf *buf = bread(log.dev, log.start);
  103e88:	a1 80 cb 10 00       	mov    0x10cb80,%eax
  103e8d:	89 c2                	mov    %eax,%edx
  103e8f:	a1 8c cb 10 00       	mov    0x10cb8c,%eax
  103e94:	83 ec 08             	sub    $0x8,%esp
  103e97:	52                   	push   %edx
  103e98:	50                   	push   %eax
  103e99:	e8 9d e1 ff ff       	call   10203b <bread>
  103e9e:	83 c4 10             	add    $0x10,%esp
  103ea1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  struct logheader *hb = (struct logheader *) (buf->data);
  103ea4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ea7:	83 c0 1c             	add    $0x1c,%eax
  103eaa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int i;
  hb->n = log.lh.n;
  103ead:	8b 15 90 cb 10 00    	mov    0x10cb90,%edx
  103eb3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103eb6:	89 10                	mov    %edx,(%eax)
  for (i = 0; i < log.lh.n; i++) {
  103eb8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103ebf:	eb 1b                	jmp    103edc <write_head+0x5a>
    hb->block[i] = log.lh.block[i];
  103ec1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103ec4:	83 c0 04             	add    $0x4,%eax
  103ec7:	8b 0c 85 84 cb 10 00 	mov    0x10cb84(,%eax,4),%ecx
  103ece:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103ed1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103ed4:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
  103ed8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103edc:	a1 90 cb 10 00       	mov    0x10cb90,%eax
  103ee1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103ee4:	7c db                	jl     103ec1 <write_head+0x3f>
  }
  bwrite(buf);
  103ee6:	83 ec 0c             	sub    $0xc,%esp
  103ee9:	ff 75 f0             	push   -0x10(%ebp)
  103eec:	e8 83 e1 ff ff       	call   102074 <bwrite>
  103ef1:	83 c4 10             	add    $0x10,%esp
  brelse(buf);
  103ef4:	83 ec 0c             	sub    $0xc,%esp
  103ef7:	ff 75 f0             	push   -0x10(%ebp)
  103efa:	e8 35 e2 ff ff       	call   102134 <brelse>
  103eff:	83 c4 10             	add    $0x10,%esp
}
  103f02:	90                   	nop
  103f03:	c9                   	leave
  103f04:	c3                   	ret

00103f05 <recover_from_log>:

static void
recover_from_log(void)
{
  103f05:	55                   	push   %ebp
  103f06:	89 e5                	mov    %esp,%ebp
  103f08:	83 ec 08             	sub    $0x8,%esp
  read_head();
  103f0b:	e8 fe fe ff ff       	call   103e0e <read_head>
  restore_from_log(); // if committed, copy from log to disk
  103f10:	e8 c5 fd ff ff       	call   103cda <restore_from_log>
  log.lh.n = 0;
  103f15:	c7 05 90 cb 10 00 00 	movl   $0x0,0x10cb90
  103f1c:	00 00 00 
  write_head(); // clear the log
  103f1f:	e8 5e ff ff ff       	call   103e82 <write_head>
}
  103f24:	90                   	nop
  103f25:	c9                   	leave
  103f26:	c3                   	ret

00103f27 <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
  103f27:	55                   	push   %ebp
  103f28:	89 e5                	mov    %esp,%ebp
  
}
  103f2a:	90                   	nop
  103f2b:	5d                   	pop    %ebp
  103f2c:	c3                   	ret

00103f2d <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
  103f2d:	55                   	push   %ebp
  103f2e:	89 e5                	mov    %esp,%ebp
  103f30:	83 ec 08             	sub    $0x8,%esp
  // call commit w/o holding locks, since not allowed
  // to sleep with locks.
  commit();
  103f33:	e8 03 00 00 00       	call   103f3b <commit>
}
  103f38:	90                   	nop
  103f39:	c9                   	leave
  103f3a:	c3                   	ret

00103f3b <commit>:

/* DO NOT MODIFY THIS FUNCTION*/
static void
commit()
{
  103f3b:	55                   	push   %ebp
  103f3c:	89 e5                	mov    %esp,%ebp
  103f3e:	83 ec 08             	sub    $0x8,%esp
  if (log.lh.n > 0) {
  103f41:	a1 90 cb 10 00       	mov    0x10cb90,%eax
  103f46:	85 c0                	test   %eax,%eax
  103f48:	7e 19                	jle    103f63 <commit+0x28>
    if (PANIC_1) {
      panic("[UNDOLOG] Panic in commit type 1");
    }
    write_head();    // Write header to disk 
  103f4a:	e8 33 ff ff ff       	call   103e82 <write_head>
    if (PANIC_2) {
      panic("[UNDOLOG] Panic in commit type 2");
    }
    install_trans(); // Now install writes to home locations    
  103f4f:	e8 3f fe ff ff       	call   103d93 <install_trans>
    if (PANIC_3) {
      panic("[UNDOLOG] Panic in commit type 3");
    }
    log.lh.n = 0;
  103f54:	c7 05 90 cb 10 00 00 	movl   $0x0,0x10cb90
  103f5b:	00 00 00 
    write_head();    // Erase the transaction from the log 
  103f5e:	e8 1f ff ff ff       	call   103e82 <write_head>
    if (PANIC_4) {
      panic("[UNDOLOG] Panic in commit type 4");
    }  
  }
}
  103f63:	90                   	nop
  103f64:	c9                   	leave
  103f65:	c3                   	ret

00103f66 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
  103f66:	55                   	push   %ebp
  103f67:	89 e5                	mov    %esp,%ebp
  103f69:	83 ec 18             	sub    $0x18,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
  103f6c:	a1 90 cb 10 00       	mov    0x10cb90,%eax
  103f71:	83 f8 1d             	cmp    $0x1d,%eax
  103f74:	7f 12                	jg     103f88 <log_write+0x22>
  103f76:	8b 15 90 cb 10 00    	mov    0x10cb90,%edx
  103f7c:	a1 84 cb 10 00       	mov    0x10cb84,%eax
  103f81:	83 e8 01             	sub    $0x1,%eax
  103f84:	39 c2                	cmp    %eax,%edx
  103f86:	7c 0d                	jl     103f95 <log_write+0x2f>
    panic("too big a transaction");
  103f88:	83 ec 0c             	sub    $0xc,%esp
  103f8b:	68 55 45 10 00       	push   $0x104555
  103f90:	e8 19 c3 ff ff       	call   1002ae <panic>

  for (i = 0; i < log.lh.n; i++) {
  103f95:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103f9c:	eb 1d                	jmp    103fbb <log_write+0x55>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
  103f9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103fa1:	83 c0 04             	add    $0x4,%eax
  103fa4:	8b 04 85 84 cb 10 00 	mov    0x10cb84(,%eax,4),%eax
  103fab:	89 c2                	mov    %eax,%edx
  103fad:	8b 45 08             	mov    0x8(%ebp),%eax
  103fb0:	8b 40 08             	mov    0x8(%eax),%eax
  103fb3:	39 c2                	cmp    %eax,%edx
  103fb5:	74 10                	je     103fc7 <log_write+0x61>
  for (i = 0; i < log.lh.n; i++) {
  103fb7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103fbb:	a1 90 cb 10 00       	mov    0x10cb90,%eax
  103fc0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103fc3:	7c d9                	jl     103f9e <log_write+0x38>
  103fc5:	eb 01                	jmp    103fc8 <log_write+0x62>
      break;
  103fc7:	90                   	nop
  }
  log.lh.block[i] = b->blockno;
  103fc8:	8b 45 08             	mov    0x8(%ebp),%eax
  103fcb:	8b 40 08             	mov    0x8(%eax),%eax
  103fce:	89 c2                	mov    %eax,%edx
  103fd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103fd3:	83 c0 04             	add    $0x4,%eax
  103fd6:	89 14 85 84 cb 10 00 	mov    %edx,0x10cb84(,%eax,4)
  if (i == log.lh.n)
  103fdd:	a1 90 cb 10 00       	mov    0x10cb90,%eax
  103fe2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103fe5:	75 0d                	jne    103ff4 <log_write+0x8e>
    log.lh.n++;
  103fe7:	a1 90 cb 10 00       	mov    0x10cb90,%eax
  103fec:	83 c0 01             	add    $0x1,%eax
  103fef:	a3 90 cb 10 00       	mov    %eax,0x10cb90
  b->flags |= B_DIRTY; // prevent eviction
  103ff4:	8b 45 08             	mov    0x8(%ebp),%eax
  103ff7:	8b 00                	mov    (%eax),%eax
  103ff9:	83 c8 04             	or     $0x4,%eax
  103ffc:	89 c2                	mov    %eax,%edx
  103ffe:	8b 45 08             	mov    0x8(%ebp),%eax
  104001:	89 10                	mov    %edx,(%eax)
        struct buf * old = get_old(b->blockno);
  104003:	8b 45 08             	mov    0x8(%ebp),%eax
  104006:	8b 40 08             	mov    0x8(%eax),%eax
  104009:	83 ec 0c             	sub    $0xc,%esp
  10400c:	50                   	push   %eax
  10400d:	e8 7f de ff ff       	call   101e91 <get_old>
  104012:	83 c4 10             	add    $0x10,%esp
  104015:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if(old == NULL){
  104018:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10401c:	75 1c                	jne    10403a <log_write+0xd4>
                old = bread(log.dev, b->blockno);
  10401e:	8b 45 08             	mov    0x8(%ebp),%eax
  104021:	8b 40 08             	mov    0x8(%eax),%eax
  104024:	8b 15 8c cb 10 00    	mov    0x10cb8c,%edx
  10402a:	83 ec 08             	sub    $0x8,%esp
  10402d:	50                   	push   %eax
  10402e:	52                   	push   %edx
  10402f:	e8 07 e0 ff ff       	call   10203b <bread>
  104034:	83 c4 10             	add    $0x10,%esp
  104037:	89 45 f0             	mov    %eax,-0x10(%ebp)
        }
        if(old->blockno != b->blockno){
  10403a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10403d:	8b 50 08             	mov    0x8(%eax),%edx
  104040:	8b 45 08             	mov    0x8(%ebp),%eax
  104043:	8b 40 08             	mov    0x8(%eax),%eax
  104046:	39 c2                	cmp    %eax,%edx
  104048:	74 0d                	je     104057 <log_write+0xf1>
                panic("bread_wr wasnt called just before calling \n");
  10404a:	83 ec 0c             	sub    $0xc,%esp
  10404d:	68 6c 45 10 00       	push   $0x10456c
  104052:	e8 57 c2 ff ff       	call   1002ae <panic>
        }
        struct buf * to = bread(log.dev, log.start + i + 1);
  104057:	8b 15 80 cb 10 00    	mov    0x10cb80,%edx
  10405d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104060:	01 d0                	add    %edx,%eax
  104062:	83 c0 01             	add    $0x1,%eax
  104065:	89 c2                	mov    %eax,%edx
  104067:	a1 8c cb 10 00       	mov    0x10cb8c,%eax
  10406c:	83 ec 08             	sub    $0x8,%esp
  10406f:	52                   	push   %edx
  104070:	50                   	push   %eax
  104071:	e8 c5 df ff ff       	call   10203b <bread>
  104076:	83 c4 10             	add    $0x10,%esp
  104079:	89 45 ec             	mov    %eax,-0x14(%ebp)
        memmove(to->data, old->data, BSIZE);
  10407c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10407f:	8d 50 1c             	lea    0x1c(%eax),%edx
  104082:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104085:	83 c0 1c             	add    $0x1c,%eax
  104088:	83 ec 04             	sub    $0x4,%esp
  10408b:	68 00 02 00 00       	push   $0x200
  104090:	52                   	push   %edx
  104091:	50                   	push   %eax
  104092:	e8 d5 ce ff ff       	call   100f6c <memmove>
  104097:	83 c4 10             	add    $0x10,%esp
        bwrite(to);
  10409a:	83 ec 0c             	sub    $0xc,%esp
  10409d:	ff 75 ec             	push   -0x14(%ebp)
  1040a0:	e8 cf df ff ff       	call   102074 <bwrite>
  1040a5:	83 c4 10             	add    $0x10,%esp
        brelse(to);
  1040a8:	83 ec 0c             	sub    $0xc,%esp
  1040ab:	ff 75 ec             	push   -0x14(%ebp)
  1040ae:	e8 81 e0 ff ff       	call   102134 <brelse>
  1040b3:	83 c4 10             	add    $0x10,%esp
}
  1040b6:	90                   	nop
  1040b7:	c9                   	leave
  1040b8:	c3                   	ret
