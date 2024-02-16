
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
  10000c:	bc b0 c6 10 00       	mov    $0x10c6b0,%esp

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
  1001e1:	c7 45 ec 6c 3e 10 00 	movl   $0x103e6c,-0x14(%ebp)
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
  100274:	68 73 3e 10 00       	push   $0x103e73
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
  1002c2:	68 80 3e 10 00       	push   $0x103e80
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
  1002e1:	68 94 3e 10 00       	push   $0x103e94
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
  100315:	68 96 3e 10 00       	push   $0x103e96
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
  100544:	68 9c 3e 10 00       	push   $0x103e9c
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
  10077f:	68 d0 3e 10 00       	push   $0x103ed0
  100784:	e8 7f 32 00 00       	call   103a08 <open>
  100789:	83 c4 10             	add    $0x10,%esp
  10078c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10078f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100793:	75 0d                	jne    1007a2 <log_test+0x31>
    panic("Unable to open /hello.txt");
  100795:	83 ec 0c             	sub    $0xc,%esp
  100798:	68 db 3e 10 00       	push   $0x103edb
  10079d:	e8 0c fb ff ff       	call   1002ae <panic>
  n = fileread(gtxt, buffer, 5);
  1007a2:	83 ec 04             	sub    $0x4,%esp
  1007a5:	6a 05                	push   $0x5
  1007a7:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  1007ad:	50                   	push   %eax
  1007ae:	ff 75 f4             	push   -0xc(%ebp)
  1007b1:	e8 db 2c 00 00       	call   103491 <fileread>
  1007b6:	83 c4 10             	add    $0x10,%esp
  1007b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cprintf("[UNDOLOG] READ: %d %s\n", n, buffer);
  1007bc:	83 ec 04             	sub    $0x4,%esp
  1007bf:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  1007c5:	50                   	push   %eax
  1007c6:	ff 75 f0             	push   -0x10(%ebp)
  1007c9:	68 f5 3e 10 00       	push   $0x103ef5
  1007ce:	e8 19 f9 ff ff       	call   1000ec <cprintf>
  1007d3:	83 c4 10             	add    $0x10,%esp
  fileclose(gtxt);
  1007d6:	83 ec 0c             	sub    $0xc,%esp
  1007d9:	ff 75 f4             	push   -0xc(%ebp)
  1007dc:	e8 dc 2b 00 00       	call   1033bd <fileclose>
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
  10080c:	68 d0 3e 10 00       	push   $0x103ed0
  100811:	e8 f2 31 00 00       	call   103a08 <open>
  100816:	83 c4 10             	add    $0x10,%esp
  100819:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10081c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100820:	75 0d                	jne    10082f <log_test+0xbe>
    panic("Failed to create /foo/hello.txt");
  100822:	83 ec 0c             	sub    $0xc,%esp
  100825:	68 0c 3f 10 00       	push   $0x103f0c
  10082a:	e8 7f fa ff ff       	call   1002ae <panic>
  n = filewrite(gtxt, buffer, 5);
  10082f:	83 ec 04             	sub    $0x4,%esp
  100832:	6a 05                	push   $0x5
  100834:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  10083a:	50                   	push   %eax
  10083b:	ff 75 f4             	push   -0xc(%ebp)
  10083e:	e8 cd 2c 00 00       	call   103510 <filewrite>
  100843:	83 c4 10             	add    $0x10,%esp
  100846:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cprintf("[UNDOLOG] WRITE: %d %s\n", n, buffer);
  100849:	83 ec 04             	sub    $0x4,%esp
  10084c:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  100852:	50                   	push   %eax
  100853:	ff 75 f0             	push   -0x10(%ebp)
  100856:	68 2c 3f 10 00       	push   $0x103f2c
  10085b:	e8 8c f8 ff ff       	call   1000ec <cprintf>
  100860:	83 c4 10             	add    $0x10,%esp
  fileclose(gtxt);
  100863:	83 ec 0c             	sub    $0xc,%esp
  100866:	ff 75 f4             	push   -0xc(%ebp)
  100869:	e8 4f 2b 00 00       	call   1033bd <fileclose>
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
  10089e:	e8 a9 18 00 00       	call   10214c <ideinit>
  tvinit();        // trap vectors
  1008a3:	e8 c4 09 00 00       	call   10126c <tvinit>
  binit();         // buffer cache
  1008a8:	e8 e4 15 00 00       	call   101e91 <binit>
  idtinit();       // load idt register
  1008ad:	e8 a0 0a 00 00       	call   101352 <idtinit>
  sti();           // enable interrupts
  1008b2:	e8 ac fe ff ff       	call   100763 <sti>
  iinit(ROOTDEV);  // Read superblock to start reading inodes
  1008b7:	83 ec 0c             	sub    $0xc,%esp
  1008ba:	6a 01                	push   $0x1
  1008bc:	e8 6d 1e 00 00       	call   10272e <iinit>
  1008c1:	83 c4 10             	add    $0x10,%esp
  initlog(ROOTDEV);  // Initialize log
  1008c4:	83 ec 0c             	sub    $0xc,%esp
  1008c7:	6a 01                	push   $0x1
  1008c9:	e8 b2 32 00 00       	call   103b80 <initlog>
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
  100975:	68 44 3f 10 00       	push   $0x103f44
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
  100aa4:	68 49 3f 10 00       	push   $0x103f49
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
  100b2e:	68 4e 3f 10 00       	push   $0x103f4e
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
  100c02:	68 68 3f 10 00       	push   $0x103f68
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
  100d82:	c7 45 f4 87 3f 10 00 	movl   $0x103f87,-0xc(%ebp)
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
  10115b:	68 90 3f 10 00       	push   $0x103f90
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
  1011a4:	68 b6 3f 10 00       	push   $0x103fb6
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
  10137d:	8b 04 85 24 40 10 00 	mov    0x104024(,%eax,4),%eax
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
  10139a:	e8 cb 0f 00 00       	call   10236a <ideintr>
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
  1013ca:	68 c8 3f 10 00       	push   $0x103fc8
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
  1013fd:	68 ec 3f 10 00       	push   $0x103fec
  101402:	e8 e5 ec ff ff       	call   1000ec <cprintf>
  101407:	83 c4 20             	add    $0x20,%esp
    panic("trap");
  10140a:	83 ec 0c             	sub    $0xc,%esp
  10140d:	68 1e 40 10 00       	push   $0x10401e
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

00101e91 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
  101e91:	55                   	push   %ebp
  101e92:	89 e5                	mov    %esp,%ebp
  101e94:	83 ec 10             	sub    $0x10,%esp
  struct buf *b;

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  101e97:	c7 05 58 9c 10 00 48 	movl   $0x109c48,0x109c58
  101e9e:	9c 10 00 
  bcache.head.next = &bcache.head;
  101ea1:	c7 05 5c 9c 10 00 48 	movl   $0x109c48,0x109c5c
  101ea8:	9c 10 00 
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
  101eab:	c7 45 fc 00 5d 10 00 	movl   $0x105d00,-0x4(%ebp)
  101eb2:	eb 30                	jmp    101ee4 <binit+0x53>
    b->next = bcache.head.next;
  101eb4:	8b 15 5c 9c 10 00    	mov    0x109c5c,%edx
  101eba:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101ebd:	89 50 14             	mov    %edx,0x14(%eax)
    b->prev = &bcache.head;
  101ec0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101ec3:	c7 40 10 48 9c 10 00 	movl   $0x109c48,0x10(%eax)
    bcache.head.next->prev = b;
  101eca:	a1 5c 9c 10 00       	mov    0x109c5c,%eax
  101ecf:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101ed2:	89 50 10             	mov    %edx,0x10(%eax)
    bcache.head.next = b;
  101ed5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101ed8:	a3 5c 9c 10 00       	mov    %eax,0x109c5c
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
  101edd:	81 45 fc 1c 02 00 00 	addl   $0x21c,-0x4(%ebp)
  101ee4:	b8 48 9c 10 00       	mov    $0x109c48,%eax
  101ee9:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101eec:	72 c6                	jb     101eb4 <binit+0x23>
  }
}
  101eee:	90                   	nop
  101eef:	90                   	nop
  101ef0:	c9                   	leave
  101ef1:	c3                   	ret

00101ef2 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
  101ef2:	55                   	push   %ebp
  101ef3:	89 e5                	mov    %esp,%ebp
  101ef5:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
  101ef8:	a1 5c 9c 10 00       	mov    0x109c5c,%eax
  101efd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101f00:	eb 33                	jmp    101f35 <bget+0x43>
    if(b->dev == dev && b->blockno == blockno){
  101f02:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f05:	8b 40 04             	mov    0x4(%eax),%eax
  101f08:	39 45 08             	cmp    %eax,0x8(%ebp)
  101f0b:	75 1f                	jne    101f2c <bget+0x3a>
  101f0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f10:	8b 40 08             	mov    0x8(%eax),%eax
  101f13:	39 45 0c             	cmp    %eax,0xc(%ebp)
  101f16:	75 14                	jne    101f2c <bget+0x3a>
      b->refcnt++;
  101f18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f1b:	8b 40 0c             	mov    0xc(%eax),%eax
  101f1e:	8d 50 01             	lea    0x1(%eax),%edx
  101f21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f24:	89 50 0c             	mov    %edx,0xc(%eax)
      return b;
  101f27:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f2a:	eb 7b                	jmp    101fa7 <bget+0xb5>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
  101f2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f2f:	8b 40 14             	mov    0x14(%eax),%eax
  101f32:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101f35:	81 7d f4 48 9c 10 00 	cmpl   $0x109c48,-0xc(%ebp)
  101f3c:	75 c4                	jne    101f02 <bget+0x10>
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
  101f3e:	a1 58 9c 10 00       	mov    0x109c58,%eax
  101f43:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101f46:	eb 49                	jmp    101f91 <bget+0x9f>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
  101f48:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f4b:	8b 40 0c             	mov    0xc(%eax),%eax
  101f4e:	85 c0                	test   %eax,%eax
  101f50:	75 36                	jne    101f88 <bget+0x96>
  101f52:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f55:	8b 00                	mov    (%eax),%eax
  101f57:	83 e0 04             	and    $0x4,%eax
  101f5a:	85 c0                	test   %eax,%eax
  101f5c:	75 2a                	jne    101f88 <bget+0x96>
      b->dev = dev;
  101f5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f61:	8b 55 08             	mov    0x8(%ebp),%edx
  101f64:	89 50 04             	mov    %edx,0x4(%eax)
      b->blockno = blockno;
  101f67:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f6a:	8b 55 0c             	mov    0xc(%ebp),%edx
  101f6d:	89 50 08             	mov    %edx,0x8(%eax)
      b->flags = 0;
  101f70:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f73:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
      b->refcnt = 1;
  101f79:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f7c:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
      return b;
  101f83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f86:	eb 1f                	jmp    101fa7 <bget+0xb5>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
  101f88:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101f8b:	8b 40 10             	mov    0x10(%eax),%eax
  101f8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101f91:	81 7d f4 48 9c 10 00 	cmpl   $0x109c48,-0xc(%ebp)
  101f98:	75 ae                	jne    101f48 <bget+0x56>
    }
  }
  panic("bget: no buffers");
  101f9a:	83 ec 0c             	sub    $0xc,%esp
  101f9d:	68 a4 40 10 00       	push   $0x1040a4
  101fa2:	e8 07 e3 ff ff       	call   1002ae <panic>
}
  101fa7:	c9                   	leave
  101fa8:	c3                   	ret

00101fa9 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
  101fa9:	55                   	push   %ebp
  101faa:	89 e5                	mov    %esp,%ebp
  101fac:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  b = bget(dev, blockno);
  101faf:	83 ec 08             	sub    $0x8,%esp
  101fb2:	ff 75 0c             	push   0xc(%ebp)
  101fb5:	ff 75 08             	push   0x8(%ebp)
  101fb8:	e8 35 ff ff ff       	call   101ef2 <bget>
  101fbd:	83 c4 10             	add    $0x10,%esp
  101fc0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((b->flags & B_VALID) == 0) {
  101fc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101fc6:	8b 00                	mov    (%eax),%eax
  101fc8:	83 e0 02             	and    $0x2,%eax
  101fcb:	85 c0                	test   %eax,%eax
  101fcd:	75 0e                	jne    101fdd <bread+0x34>
    iderw(b);
  101fcf:	83 ec 0c             	sub    $0xc,%esp
  101fd2:	ff 75 f4             	push   -0xc(%ebp)
  101fd5:	e8 1f 04 00 00       	call   1023f9 <iderw>
  101fda:	83 c4 10             	add    $0x10,%esp
  }
  return b;
  101fdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101fe0:	c9                   	leave
  101fe1:	c3                   	ret

00101fe2 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  101fe2:	55                   	push   %ebp
  101fe3:	89 e5                	mov    %esp,%ebp
  101fe5:	83 ec 08             	sub    $0x8,%esp
  b->flags |= B_DIRTY;
  101fe8:	8b 45 08             	mov    0x8(%ebp),%eax
  101feb:	8b 00                	mov    (%eax),%eax
  101fed:	83 c8 04             	or     $0x4,%eax
  101ff0:	89 c2                	mov    %eax,%edx
  101ff2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ff5:	89 10                	mov    %edx,(%eax)
  iderw(b);
  101ff7:	83 ec 0c             	sub    $0xc,%esp
  101ffa:	ff 75 08             	push   0x8(%ebp)
  101ffd:	e8 f7 03 00 00       	call   1023f9 <iderw>
  102002:	83 c4 10             	add    $0x10,%esp
}
  102005:	90                   	nop
  102006:	c9                   	leave
  102007:	c3                   	ret

00102008 <bread_wr>:

struct buf* 
bread_wr(uint dev, uint blockno) {
  102008:	55                   	push   %ebp
  102009:	89 e5                	mov    %esp,%ebp
  // IMPLEMENT YOUR CODE HERE
  return 0;
  10200b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102010:	5d                   	pop    %ebp
  102011:	c3                   	ret

00102012 <brelse>:

// Release a buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  102012:	55                   	push   %ebp
  102013:	89 e5                	mov    %esp,%ebp
  b->refcnt--;
  102015:	8b 45 08             	mov    0x8(%ebp),%eax
  102018:	8b 40 0c             	mov    0xc(%eax),%eax
  10201b:	8d 50 ff             	lea    -0x1(%eax),%edx
  10201e:	8b 45 08             	mov    0x8(%ebp),%eax
  102021:	89 50 0c             	mov    %edx,0xc(%eax)
  if (b->refcnt == 0) {
  102024:	8b 45 08             	mov    0x8(%ebp),%eax
  102027:	8b 40 0c             	mov    0xc(%eax),%eax
  10202a:	85 c0                	test   %eax,%eax
  10202c:	75 47                	jne    102075 <brelse+0x63>
    // no one is waiting for it.
    b->next->prev = b->prev;
  10202e:	8b 45 08             	mov    0x8(%ebp),%eax
  102031:	8b 40 14             	mov    0x14(%eax),%eax
  102034:	8b 55 08             	mov    0x8(%ebp),%edx
  102037:	8b 52 10             	mov    0x10(%edx),%edx
  10203a:	89 50 10             	mov    %edx,0x10(%eax)
    b->prev->next = b->next;
  10203d:	8b 45 08             	mov    0x8(%ebp),%eax
  102040:	8b 40 10             	mov    0x10(%eax),%eax
  102043:	8b 55 08             	mov    0x8(%ebp),%edx
  102046:	8b 52 14             	mov    0x14(%edx),%edx
  102049:	89 50 14             	mov    %edx,0x14(%eax)
    b->next = bcache.head.next;
  10204c:	8b 15 5c 9c 10 00    	mov    0x109c5c,%edx
  102052:	8b 45 08             	mov    0x8(%ebp),%eax
  102055:	89 50 14             	mov    %edx,0x14(%eax)
    b->prev = &bcache.head;
  102058:	8b 45 08             	mov    0x8(%ebp),%eax
  10205b:	c7 40 10 48 9c 10 00 	movl   $0x109c48,0x10(%eax)
    bcache.head.next->prev = b;
  102062:	a1 5c 9c 10 00       	mov    0x109c5c,%eax
  102067:	8b 55 08             	mov    0x8(%ebp),%edx
  10206a:	89 50 10             	mov    %edx,0x10(%eax)
    bcache.head.next = b;
  10206d:	8b 45 08             	mov    0x8(%ebp),%eax
  102070:	a3 5c 9c 10 00       	mov    %eax,0x109c5c
  }
  102075:	90                   	nop
  102076:	5d                   	pop    %ebp
  102077:	c3                   	ret

00102078 <inb>:
// Simple PIO-based (non-DMA) IDE driver code.

#include "types.h"
#include "defs.h"
#include "param.h"
  102078:	55                   	push   %ebp
  102079:	89 e5                	mov    %esp,%ebp
  10207b:	83 ec 14             	sub    $0x14,%esp
  10207e:	8b 45 08             	mov    0x8(%ebp),%eax
  102081:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
#include "mmu.h"
#include "proc.h"
#include "x86.h"
  102085:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  102089:	89 c2                	mov    %eax,%edx
  10208b:	ec                   	in     (%dx),%al
  10208c:	88 45 ff             	mov    %al,-0x1(%ebp)
#include "traps.h"
  10208f:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
#include "fs.h"
  102093:	c9                   	leave
  102094:	c3                   	ret

00102095 <insl>:
#include "buf.h"

#define SECTOR_SIZE   512
#define IDE_BSY       0x80
  102095:	55                   	push   %ebp
  102096:	89 e5                	mov    %esp,%ebp
  102098:	57                   	push   %edi
  102099:	53                   	push   %ebx
#define IDE_DRDY      0x40
  10209a:	8b 55 08             	mov    0x8(%ebp),%edx
  10209d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1020a0:	8b 45 10             	mov    0x10(%ebp),%eax
  1020a3:	89 cb                	mov    %ecx,%ebx
  1020a5:	89 df                	mov    %ebx,%edi
  1020a7:	89 c1                	mov    %eax,%ecx
  1020a9:	fc                   	cld
  1020aa:	f3 6d                	rep insl (%dx),%es:(%edi)
  1020ac:	89 c8                	mov    %ecx,%eax
  1020ae:	89 fb                	mov    %edi,%ebx
  1020b0:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  1020b3:	89 45 10             	mov    %eax,0x10(%ebp)
#define IDE_DF        0x20
#define IDE_ERR       0x01

#define IDE_CMD_READ  0x20
  1020b6:	90                   	nop
  1020b7:	5b                   	pop    %ebx
  1020b8:	5f                   	pop    %edi
  1020b9:	5d                   	pop    %ebp
  1020ba:	c3                   	ret

001020bb <outb>:
#define IDE_CMD_WRITE 0x30
#define IDE_CMD_RDMUL 0xc4
#define IDE_CMD_WRMUL 0xc5

  1020bb:	55                   	push   %ebp
  1020bc:	89 e5                	mov    %esp,%ebp
  1020be:	83 ec 08             	sub    $0x8,%esp
  1020c1:	8b 55 08             	mov    0x8(%ebp),%edx
  1020c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1020c7:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  1020cb:	88 45 f8             	mov    %al,-0x8(%ebp)
// idequeue points to the buf now being read/written to the disk.
  1020ce:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  1020d2:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  1020d6:	ee                   	out    %al,(%dx)
// idequeue->qnext points to the next buf to be processed.
  1020d7:	90                   	nop
  1020d8:	c9                   	leave
  1020d9:	c3                   	ret

001020da <outsl>:
static int havedisk1;
static void idestart(struct buf*);

// Wait for IDE disk to become ready.
static int
idewait(int checkerr)
  1020da:	55                   	push   %ebp
  1020db:	89 e5                	mov    %esp,%ebp
  1020dd:	56                   	push   %esi
  1020de:	53                   	push   %ebx
{
  1020df:	8b 55 08             	mov    0x8(%ebp),%edx
  1020e2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1020e5:	8b 45 10             	mov    0x10(%ebp),%eax
  1020e8:	89 cb                	mov    %ecx,%ebx
  1020ea:	89 de                	mov    %ebx,%esi
  1020ec:	89 c1                	mov    %eax,%ecx
  1020ee:	fc                   	cld
  1020ef:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  1020f1:	89 c8                	mov    %ecx,%eax
  1020f3:	89 f3                	mov    %esi,%ebx
  1020f5:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  1020f8:	89 45 10             	mov    %eax,0x10(%ebp)
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY);
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
  1020fb:	90                   	nop
  1020fc:	5b                   	pop    %ebx
  1020fd:	5e                   	pop    %esi
  1020fe:	5d                   	pop    %ebp
  1020ff:	c3                   	ret

00102100 <noop>:
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
  102100:	55                   	push   %ebp
  102101:	89 e5                	mov    %esp,%ebp

  102103:	90                   	nop
  b->flags |= B_VALID;
  102104:	90                   	nop
  102105:	5d                   	pop    %ebp
  102106:	c3                   	ret

00102107 <idewait>:
{
  102107:	55                   	push   %ebp
  102108:	89 e5                	mov    %esp,%ebp
  10210a:	83 ec 10             	sub    $0x10,%esp
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY);
  10210d:	90                   	nop
  10210e:	68 f7 01 00 00       	push   $0x1f7
  102113:	e8 60 ff ff ff       	call   102078 <inb>
  102118:	83 c4 04             	add    $0x4,%esp
  10211b:	0f b6 c0             	movzbl %al,%eax
  10211e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  102121:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102124:	25 c0 00 00 00       	and    $0xc0,%eax
  102129:	83 f8 40             	cmp    $0x40,%eax
  10212c:	75 e0                	jne    10210e <idewait+0x7>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
  10212e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102132:	74 11                	je     102145 <idewait+0x3e>
  102134:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102137:	83 e0 21             	and    $0x21,%eax
  10213a:	85 c0                	test   %eax,%eax
  10213c:	74 07                	je     102145 <idewait+0x3e>
    return -1;
  10213e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102143:	eb 05                	jmp    10214a <idewait+0x43>
  return 0;
  102145:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10214a:	c9                   	leave
  10214b:	c3                   	ret

0010214c <ideinit>:
{
  10214c:	55                   	push   %ebp
  10214d:	89 e5                	mov    %esp,%ebp
  10214f:	83 ec 18             	sub    $0x18,%esp
  ioapicenable(IRQ_IDE, ncpu - 1);
  102152:	a1 c0 54 10 00       	mov    0x1054c0,%eax
  102157:	83 e8 01             	sub    $0x1,%eax
  10215a:	83 ec 08             	sub    $0x8,%esp
  10215d:	50                   	push   %eax
  10215e:	6a 0e                	push   $0xe
  102160:	e8 40 e4 ff ff       	call   1005a5 <ioapicenable>
  102165:	83 c4 10             	add    $0x10,%esp
  idewait(0);
  102168:	83 ec 0c             	sub    $0xc,%esp
  10216b:	6a 00                	push   $0x0
  10216d:	e8 95 ff ff ff       	call   102107 <idewait>
  102172:	83 c4 10             	add    $0x10,%esp
  outb(0x1f6, 0xe0 | (1<<4));
  102175:	83 ec 08             	sub    $0x8,%esp
  102178:	68 f0 00 00 00       	push   $0xf0
  10217d:	68 f6 01 00 00       	push   $0x1f6
  102182:	e8 34 ff ff ff       	call   1020bb <outb>
  102187:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<1000; i++){
  10218a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102191:	eb 24                	jmp    1021b7 <ideinit+0x6b>
    if(inb(0x1f7) != 0){
  102193:	83 ec 0c             	sub    $0xc,%esp
  102196:	68 f7 01 00 00       	push   $0x1f7
  10219b:	e8 d8 fe ff ff       	call   102078 <inb>
  1021a0:	83 c4 10             	add    $0x10,%esp
  1021a3:	84 c0                	test   %al,%al
  1021a5:	74 0c                	je     1021b3 <ideinit+0x67>
      havedisk1 = 1;
  1021a7:	c7 05 68 9e 10 00 01 	movl   $0x1,0x109e68
  1021ae:	00 00 00 
      break;
  1021b1:	eb 0d                	jmp    1021c0 <ideinit+0x74>
  for(i=0; i<1000; i++){
  1021b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1021b7:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  1021be:	7e d3                	jle    102193 <ideinit+0x47>
  outb(0x1f6, 0xe0 | (0<<4));
  1021c0:	83 ec 08             	sub    $0x8,%esp
  1021c3:	68 e0 00 00 00       	push   $0xe0
  1021c8:	68 f6 01 00 00       	push   $0x1f6
  1021cd:	e8 e9 fe ff ff       	call   1020bb <outb>
  1021d2:	83 c4 10             	add    $0x10,%esp
}
  1021d5:	90                   	nop
  1021d6:	c9                   	leave
  1021d7:	c3                   	ret

001021d8 <idestart>:
{
  1021d8:	55                   	push   %ebp
  1021d9:	89 e5                	mov    %esp,%ebp
  1021db:	83 ec 18             	sub    $0x18,%esp
  if(b == 0)
  1021de:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1021e2:	75 0d                	jne    1021f1 <idestart+0x19>
    panic("idestart");
  1021e4:	83 ec 0c             	sub    $0xc,%esp
  1021e7:	68 b5 40 10 00       	push   $0x1040b5
  1021ec:	e8 bd e0 ff ff       	call   1002ae <panic>
  if(b->blockno >= FSSIZE)
  1021f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1021f4:	8b 40 08             	mov    0x8(%eax),%eax
  1021f7:	3d e7 03 00 00       	cmp    $0x3e7,%eax
  1021fc:	76 0d                	jbe    10220b <idestart+0x33>
    panic("incorrect blockno");
  1021fe:	83 ec 0c             	sub    $0xc,%esp
  102201:	68 be 40 10 00       	push   $0x1040be
  102206:	e8 a3 e0 ff ff       	call   1002ae <panic>
  int sector_per_block =  BSIZE/SECTOR_SIZE;
  10220b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  int sector = b->blockno * sector_per_block;
  102212:	8b 45 08             	mov    0x8(%ebp),%eax
  102215:	8b 50 08             	mov    0x8(%eax),%edx
  102218:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10221b:	0f af c2             	imul   %edx,%eax
  10221e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  int read_cmd = (sector_per_block == 1) ? IDE_CMD_READ :  IDE_CMD_RDMUL;
  102221:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  102225:	75 07                	jne    10222e <idestart+0x56>
  102227:	b8 20 00 00 00       	mov    $0x20,%eax
  10222c:	eb 05                	jmp    102233 <idestart+0x5b>
  10222e:	b8 c4 00 00 00       	mov    $0xc4,%eax
  102233:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int write_cmd = (sector_per_block == 1) ? IDE_CMD_WRITE : IDE_CMD_WRMUL;
  102236:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  10223a:	75 07                	jne    102243 <idestart+0x6b>
  10223c:	b8 30 00 00 00       	mov    $0x30,%eax
  102241:	eb 05                	jmp    102248 <idestart+0x70>
  102243:	b8 c5 00 00 00       	mov    $0xc5,%eax
  102248:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if (sector_per_block > 7) panic("idestart");
  10224b:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
  10224f:	7e 0d                	jle    10225e <idestart+0x86>
  102251:	83 ec 0c             	sub    $0xc,%esp
  102254:	68 b5 40 10 00       	push   $0x1040b5
  102259:	e8 50 e0 ff ff       	call   1002ae <panic>
  idewait(0);
  10225e:	83 ec 0c             	sub    $0xc,%esp
  102261:	6a 00                	push   $0x0
  102263:	e8 9f fe ff ff       	call   102107 <idewait>
  102268:	83 c4 10             	add    $0x10,%esp
  outb(0x3f6, 0);  // generate interrupt
  10226b:	83 ec 08             	sub    $0x8,%esp
  10226e:	6a 00                	push   $0x0
  102270:	68 f6 03 00 00       	push   $0x3f6
  102275:	e8 41 fe ff ff       	call   1020bb <outb>
  10227a:	83 c4 10             	add    $0x10,%esp
  outb(0x1f2, sector_per_block);  // number of sectors
  10227d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102280:	0f b6 c0             	movzbl %al,%eax
  102283:	83 ec 08             	sub    $0x8,%esp
  102286:	50                   	push   %eax
  102287:	68 f2 01 00 00       	push   $0x1f2
  10228c:	e8 2a fe ff ff       	call   1020bb <outb>
  102291:	83 c4 10             	add    $0x10,%esp
  outb(0x1f3, sector & 0xff);
  102294:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102297:	0f b6 c0             	movzbl %al,%eax
  10229a:	83 ec 08             	sub    $0x8,%esp
  10229d:	50                   	push   %eax
  10229e:	68 f3 01 00 00       	push   $0x1f3
  1022a3:	e8 13 fe ff ff       	call   1020bb <outb>
  1022a8:	83 c4 10             	add    $0x10,%esp
  outb(0x1f4, (sector >> 8) & 0xff);
  1022ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1022ae:	c1 f8 08             	sar    $0x8,%eax
  1022b1:	0f b6 c0             	movzbl %al,%eax
  1022b4:	83 ec 08             	sub    $0x8,%esp
  1022b7:	50                   	push   %eax
  1022b8:	68 f4 01 00 00       	push   $0x1f4
  1022bd:	e8 f9 fd ff ff       	call   1020bb <outb>
  1022c2:	83 c4 10             	add    $0x10,%esp
  outb(0x1f5, (sector >> 16) & 0xff);
  1022c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1022c8:	c1 f8 10             	sar    $0x10,%eax
  1022cb:	0f b6 c0             	movzbl %al,%eax
  1022ce:	83 ec 08             	sub    $0x8,%esp
  1022d1:	50                   	push   %eax
  1022d2:	68 f5 01 00 00       	push   $0x1f5
  1022d7:	e8 df fd ff ff       	call   1020bb <outb>
  1022dc:	83 c4 10             	add    $0x10,%esp
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  1022df:	8b 45 08             	mov    0x8(%ebp),%eax
  1022e2:	8b 40 04             	mov    0x4(%eax),%eax
  1022e5:	c1 e0 04             	shl    $0x4,%eax
  1022e8:	83 e0 10             	and    $0x10,%eax
  1022eb:	89 c2                	mov    %eax,%edx
  1022ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1022f0:	c1 f8 18             	sar    $0x18,%eax
  1022f3:	83 e0 0f             	and    $0xf,%eax
  1022f6:	09 d0                	or     %edx,%eax
  1022f8:	83 c8 e0             	or     $0xffffffe0,%eax
  1022fb:	0f b6 c0             	movzbl %al,%eax
  1022fe:	83 ec 08             	sub    $0x8,%esp
  102301:	50                   	push   %eax
  102302:	68 f6 01 00 00       	push   $0x1f6
  102307:	e8 af fd ff ff       	call   1020bb <outb>
  10230c:	83 c4 10             	add    $0x10,%esp
  if(b->flags & B_DIRTY){
  10230f:	8b 45 08             	mov    0x8(%ebp),%eax
  102312:	8b 00                	mov    (%eax),%eax
  102314:	83 e0 04             	and    $0x4,%eax
  102317:	85 c0                	test   %eax,%eax
  102319:	74 35                	je     102350 <idestart+0x178>
    outb(0x1f7, write_cmd);
  10231b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10231e:	0f b6 c0             	movzbl %al,%eax
  102321:	83 ec 08             	sub    $0x8,%esp
  102324:	50                   	push   %eax
  102325:	68 f7 01 00 00       	push   $0x1f7
  10232a:	e8 8c fd ff ff       	call   1020bb <outb>
  10232f:	83 c4 10             	add    $0x10,%esp
    outsl(0x1f0, b->data, BSIZE/4);
  102332:	8b 45 08             	mov    0x8(%ebp),%eax
  102335:	83 c0 1c             	add    $0x1c,%eax
  102338:	83 ec 04             	sub    $0x4,%esp
  10233b:	68 80 00 00 00       	push   $0x80
  102340:	50                   	push   %eax
  102341:	68 f0 01 00 00       	push   $0x1f0
  102346:	e8 8f fd ff ff       	call   1020da <outsl>
  10234b:	83 c4 10             	add    $0x10,%esp
}
  10234e:	eb 17                	jmp    102367 <idestart+0x18f>
    outb(0x1f7, read_cmd);
  102350:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102353:	0f b6 c0             	movzbl %al,%eax
  102356:	83 ec 08             	sub    $0x8,%esp
  102359:	50                   	push   %eax
  10235a:	68 f7 01 00 00       	push   $0x1f7
  10235f:	e8 57 fd ff ff       	call   1020bb <outb>
  102364:	83 c4 10             	add    $0x10,%esp
}
  102367:	90                   	nop
  102368:	c9                   	leave
  102369:	c3                   	ret

0010236a <ideintr>:
{
  10236a:	55                   	push   %ebp
  10236b:	89 e5                	mov    %esp,%ebp
  10236d:	83 ec 18             	sub    $0x18,%esp
  if((b = idequeue) == 0){
  102370:	a1 64 9e 10 00       	mov    0x109e64,%eax
  102375:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102378:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10237c:	74 78                	je     1023f6 <ideintr+0x8c>
  idequeue = b->qnext;
  10237e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102381:	8b 40 18             	mov    0x18(%eax),%eax
  102384:	a3 64 9e 10 00       	mov    %eax,0x109e64
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
  102389:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10238c:	8b 00                	mov    (%eax),%eax
  10238e:	83 e0 04             	and    $0x4,%eax
  102391:	85 c0                	test   %eax,%eax
  102393:	75 27                	jne    1023bc <ideintr+0x52>
  102395:	6a 01                	push   $0x1
  102397:	e8 6b fd ff ff       	call   102107 <idewait>
  10239c:	83 c4 04             	add    $0x4,%esp
  10239f:	85 c0                	test   %eax,%eax
  1023a1:	78 19                	js     1023bc <ideintr+0x52>
    insl(0x1f0, b->data, BSIZE/4);
  1023a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1023a6:	83 c0 1c             	add    $0x1c,%eax
  1023a9:	68 80 00 00 00       	push   $0x80
  1023ae:	50                   	push   %eax
  1023af:	68 f0 01 00 00       	push   $0x1f0
  1023b4:	e8 dc fc ff ff       	call   102095 <insl>
  1023b9:	83 c4 0c             	add    $0xc,%esp
  b->flags |= B_VALID;
  1023bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1023bf:	8b 00                	mov    (%eax),%eax
  1023c1:	83 c8 02             	or     $0x2,%eax
  1023c4:	89 c2                	mov    %eax,%edx
  1023c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1023c9:	89 10                	mov    %edx,(%eax)
  b->flags &= ~B_DIRTY;
  1023cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1023ce:	8b 00                	mov    (%eax),%eax
  1023d0:	83 e0 fb             	and    $0xfffffffb,%eax
  1023d3:	89 c2                	mov    %eax,%edx
  1023d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1023d8:	89 10                	mov    %edx,(%eax)

  // Start disk on next buf in queue.
  if(idequeue != 0)
  1023da:	a1 64 9e 10 00       	mov    0x109e64,%eax
  1023df:	85 c0                	test   %eax,%eax
  1023e1:	74 14                	je     1023f7 <ideintr+0x8d>
    idestart(idequeue);
  1023e3:	a1 64 9e 10 00       	mov    0x109e64,%eax
  1023e8:	83 ec 0c             	sub    $0xc,%esp
  1023eb:	50                   	push   %eax
  1023ec:	e8 e7 fd ff ff       	call   1021d8 <idestart>
  1023f1:	83 c4 10             	add    $0x10,%esp
  1023f4:	eb 01                	jmp    1023f7 <ideintr+0x8d>
    return;
  1023f6:	90                   	nop
}
  1023f7:	c9                   	leave
  1023f8:	c3                   	ret

001023f9 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
  1023f9:	55                   	push   %ebp
  1023fa:	89 e5                	mov    %esp,%ebp
  1023fc:	83 ec 18             	sub    $0x18,%esp
  struct buf **pp;

  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
  1023ff:	8b 45 08             	mov    0x8(%ebp),%eax
  102402:	8b 00                	mov    (%eax),%eax
  102404:	83 e0 06             	and    $0x6,%eax
  102407:	83 f8 02             	cmp    $0x2,%eax
  10240a:	75 0d                	jne    102419 <iderw+0x20>
    panic("iderw: nothing to do");
  10240c:	83 ec 0c             	sub    $0xc,%esp
  10240f:	68 d0 40 10 00       	push   $0x1040d0
  102414:	e8 95 de ff ff       	call   1002ae <panic>
  if(b->dev != 0 && !havedisk1)
  102419:	8b 45 08             	mov    0x8(%ebp),%eax
  10241c:	8b 40 04             	mov    0x4(%eax),%eax
  10241f:	85 c0                	test   %eax,%eax
  102421:	74 16                	je     102439 <iderw+0x40>
  102423:	a1 68 9e 10 00       	mov    0x109e68,%eax
  102428:	85 c0                	test   %eax,%eax
  10242a:	75 0d                	jne    102439 <iderw+0x40>
    panic("iderw: ide disk 1 not present");
  10242c:	83 ec 0c             	sub    $0xc,%esp
  10242f:	68 e5 40 10 00       	push   $0x1040e5
  102434:	e8 75 de ff ff       	call   1002ae <panic>

  // Append b to idequeue.
  b->qnext = 0;
  102439:	8b 45 08             	mov    0x8(%ebp),%eax
  10243c:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
  102443:	c7 45 f4 64 9e 10 00 	movl   $0x109e64,-0xc(%ebp)
  10244a:	eb 0b                	jmp    102457 <iderw+0x5e>
  10244c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10244f:	8b 00                	mov    (%eax),%eax
  102451:	83 c0 18             	add    $0x18,%eax
  102454:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102457:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10245a:	8b 00                	mov    (%eax),%eax
  10245c:	85 c0                	test   %eax,%eax
  10245e:	75 ec                	jne    10244c <iderw+0x53>
    ;
  *pp = b;
  102460:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102463:	8b 55 08             	mov    0x8(%ebp),%edx
  102466:	89 10                	mov    %edx,(%eax)

  // Start disk if necessary.
  if(idequeue == b)
  102468:	a1 64 9e 10 00       	mov    0x109e64,%eax
  10246d:	39 45 08             	cmp    %eax,0x8(%ebp)
  102470:	75 15                	jne    102487 <iderw+0x8e>
    idestart(b);
  102472:	83 ec 0c             	sub    $0xc,%esp
  102475:	ff 75 08             	push   0x8(%ebp)
  102478:	e8 5b fd ff ff       	call   1021d8 <idestart>
  10247d:	83 c4 10             	add    $0x10,%esp

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID)
  102480:	eb 05                	jmp    102487 <iderw+0x8e>
  {
    // Warning: If we do not call noop(), compiler generates code that does not
    // read "b->flags" again and therefore never come out of this while loop. 
    // "b->flags" is modified by the trap handler in ideintr().  
    noop();
  102482:	e8 79 fc ff ff       	call   102100 <noop>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID)
  102487:	8b 45 08             	mov    0x8(%ebp),%eax
  10248a:	8b 00                	mov    (%eax),%eax
  10248c:	83 e0 06             	and    $0x6,%eax
  10248f:	83 f8 02             	cmp    $0x2,%eax
  102492:	75 ee                	jne    102482 <iderw+0x89>
  }
}
  102494:	90                   	nop
  102495:	90                   	nop
  102496:	c9                   	leave
  102497:	c3                   	ret

00102498 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
  102498:	55                   	push   %ebp
  102499:	89 e5                	mov    %esp,%ebp
  10249b:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;

  bp = bread(dev, 1);
  10249e:	8b 45 08             	mov    0x8(%ebp),%eax
  1024a1:	83 ec 08             	sub    $0x8,%esp
  1024a4:	6a 01                	push   $0x1
  1024a6:	50                   	push   %eax
  1024a7:	e8 fd fa ff ff       	call   101fa9 <bread>
  1024ac:	83 c4 10             	add    $0x10,%esp
  1024af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memmove(sb, bp->data, sizeof(*sb));
  1024b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1024b5:	83 c0 1c             	add    $0x1c,%eax
  1024b8:	83 ec 04             	sub    $0x4,%esp
  1024bb:	6a 1c                	push   $0x1c
  1024bd:	50                   	push   %eax
  1024be:	ff 75 0c             	push   0xc(%ebp)
  1024c1:	e8 a6 ea ff ff       	call   100f6c <memmove>
  1024c6:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  1024c9:	83 ec 0c             	sub    $0xc,%esp
  1024cc:	ff 75 f4             	push   -0xc(%ebp)
  1024cf:	e8 3e fb ff ff       	call   102012 <brelse>
  1024d4:	83 c4 10             	add    $0x10,%esp
}
  1024d7:	90                   	nop
  1024d8:	c9                   	leave
  1024d9:	c3                   	ret

001024da <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
  1024da:	55                   	push   %ebp
  1024db:	89 e5                	mov    %esp,%ebp
  1024dd:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;

  bp = bread_wr(dev, bno);
  1024e0:	8b 55 0c             	mov    0xc(%ebp),%edx
  1024e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1024e6:	83 ec 08             	sub    $0x8,%esp
  1024e9:	52                   	push   %edx
  1024ea:	50                   	push   %eax
  1024eb:	e8 18 fb ff ff       	call   102008 <bread_wr>
  1024f0:	83 c4 10             	add    $0x10,%esp
  1024f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(bp->data, 0, BSIZE);
  1024f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1024f9:	83 c0 1c             	add    $0x1c,%eax
  1024fc:	83 ec 04             	sub    $0x4,%esp
  1024ff:	68 00 02 00 00       	push   $0x200
  102504:	6a 00                	push   $0x0
  102506:	50                   	push   %eax
  102507:	e8 a1 e9 ff ff       	call   100ead <memset>
  10250c:	83 c4 10             	add    $0x10,%esp
  log_write(bp);
  10250f:	83 ec 0c             	sub    $0xc,%esp
  102512:	ff 75 f4             	push   -0xc(%ebp)
  102515:	e8 af 18 00 00       	call   103dc9 <log_write>
  10251a:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  10251d:	83 ec 0c             	sub    $0xc,%esp
  102520:	ff 75 f4             	push   -0xc(%ebp)
  102523:	e8 ea fa ff ff       	call   102012 <brelse>
  102528:	83 c4 10             	add    $0x10,%esp
}
  10252b:	90                   	nop
  10252c:	c9                   	leave
  10252d:	c3                   	ret

0010252e <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
  10252e:	55                   	push   %ebp
  10252f:	89 e5                	mov    %esp,%ebp
  102531:	83 ec 18             	sub    $0x18,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  102534:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(b = 0; b < sb.size; b += BPB){
  10253b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102542:	e9 0b 01 00 00       	jmp    102652 <balloc+0x124>
    bp = bread_wr(dev, BBLOCK(b, sb));
  102547:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10254a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
  102550:	85 c0                	test   %eax,%eax
  102552:	0f 48 c2             	cmovs  %edx,%eax
  102555:	c1 f8 0c             	sar    $0xc,%eax
  102558:	89 c2                	mov    %eax,%edx
  10255a:	a1 98 9e 10 00       	mov    0x109e98,%eax
  10255f:	01 d0                	add    %edx,%eax
  102561:	83 ec 08             	sub    $0x8,%esp
  102564:	50                   	push   %eax
  102565:	ff 75 08             	push   0x8(%ebp)
  102568:	e8 9b fa ff ff       	call   102008 <bread_wr>
  10256d:	83 c4 10             	add    $0x10,%esp
  102570:	89 45 ec             	mov    %eax,-0x14(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
  102573:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  10257a:	e9 9e 00 00 00       	jmp    10261d <balloc+0xef>
      m = 1 << (bi % 8);
  10257f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102582:	83 e0 07             	and    $0x7,%eax
  102585:	ba 01 00 00 00       	mov    $0x1,%edx
  10258a:	89 c1                	mov    %eax,%ecx
  10258c:	d3 e2                	shl    %cl,%edx
  10258e:	89 d0                	mov    %edx,%eax
  102590:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
  102593:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102596:	8d 50 07             	lea    0x7(%eax),%edx
  102599:	85 c0                	test   %eax,%eax
  10259b:	0f 48 c2             	cmovs  %edx,%eax
  10259e:	c1 f8 03             	sar    $0x3,%eax
  1025a1:	89 c2                	mov    %eax,%edx
  1025a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1025a6:	0f b6 44 10 1c       	movzbl 0x1c(%eax,%edx,1),%eax
  1025ab:	0f b6 c0             	movzbl %al,%eax
  1025ae:	23 45 e8             	and    -0x18(%ebp),%eax
  1025b1:	85 c0                	test   %eax,%eax
  1025b3:	75 64                	jne    102619 <balloc+0xeb>
        bp->data[bi/8] |= m;  // Mark block in use.
  1025b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1025b8:	8d 50 07             	lea    0x7(%eax),%edx
  1025bb:	85 c0                	test   %eax,%eax
  1025bd:	0f 48 c2             	cmovs  %edx,%eax
  1025c0:	c1 f8 03             	sar    $0x3,%eax
  1025c3:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1025c6:	0f b6 54 02 1c       	movzbl 0x1c(%edx,%eax,1),%edx
  1025cb:	89 d1                	mov    %edx,%ecx
  1025cd:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1025d0:	09 ca                	or     %ecx,%edx
  1025d2:	89 d1                	mov    %edx,%ecx
  1025d4:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1025d7:	88 4c 02 1c          	mov    %cl,0x1c(%edx,%eax,1)
        log_write(bp);
  1025db:	83 ec 0c             	sub    $0xc,%esp
  1025de:	ff 75 ec             	push   -0x14(%ebp)
  1025e1:	e8 e3 17 00 00       	call   103dc9 <log_write>
  1025e6:	83 c4 10             	add    $0x10,%esp
        brelse(bp);
  1025e9:	83 ec 0c             	sub    $0xc,%esp
  1025ec:	ff 75 ec             	push   -0x14(%ebp)
  1025ef:	e8 1e fa ff ff       	call   102012 <brelse>
  1025f4:	83 c4 10             	add    $0x10,%esp
        bzero(dev, b + bi);
  1025f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1025fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1025fd:	01 c2                	add    %eax,%edx
  1025ff:	8b 45 08             	mov    0x8(%ebp),%eax
  102602:	83 ec 08             	sub    $0x8,%esp
  102605:	52                   	push   %edx
  102606:	50                   	push   %eax
  102607:	e8 ce fe ff ff       	call   1024da <bzero>
  10260c:	83 c4 10             	add    $0x10,%esp
        return b + bi;
  10260f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102612:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102615:	01 d0                	add    %edx,%eax
  102617:	eb 56                	jmp    10266f <balloc+0x141>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
  102619:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  10261d:	81 7d f0 ff 0f 00 00 	cmpl   $0xfff,-0x10(%ebp)
  102624:	7f 17                	jg     10263d <balloc+0x10f>
  102626:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102629:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10262c:	01 d0                	add    %edx,%eax
  10262e:	89 c2                	mov    %eax,%edx
  102630:	a1 80 9e 10 00       	mov    0x109e80,%eax
  102635:	39 c2                	cmp    %eax,%edx
  102637:	0f 82 42 ff ff ff    	jb     10257f <balloc+0x51>
      }
    }
    brelse(bp);
  10263d:	83 ec 0c             	sub    $0xc,%esp
  102640:	ff 75 ec             	push   -0x14(%ebp)
  102643:	e8 ca f9 ff ff       	call   102012 <brelse>
  102648:	83 c4 10             	add    $0x10,%esp
  for(b = 0; b < sb.size; b += BPB){
  10264b:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  102652:	a1 80 9e 10 00       	mov    0x109e80,%eax
  102657:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10265a:	39 c2                	cmp    %eax,%edx
  10265c:	0f 82 e5 fe ff ff    	jb     102547 <balloc+0x19>
  }
  panic("balloc: out of blocks");
  102662:	83 ec 0c             	sub    $0xc,%esp
  102665:	68 04 41 10 00       	push   $0x104104
  10266a:	e8 3f dc ff ff       	call   1002ae <panic>
}
  10266f:	c9                   	leave
  102670:	c3                   	ret

00102671 <bfree>:


// Free a disk block.
static void
bfree(int dev, uint b)
{
  102671:	55                   	push   %ebp
  102672:	89 e5                	mov    %esp,%ebp
  102674:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  int bi, m;

  bp = bread_wr(dev, BBLOCK(b, sb));
  102677:	8b 45 0c             	mov    0xc(%ebp),%eax
  10267a:	c1 e8 0c             	shr    $0xc,%eax
  10267d:	89 c2                	mov    %eax,%edx
  10267f:	a1 98 9e 10 00       	mov    0x109e98,%eax
  102684:	01 c2                	add    %eax,%edx
  102686:	8b 45 08             	mov    0x8(%ebp),%eax
  102689:	83 ec 08             	sub    $0x8,%esp
  10268c:	52                   	push   %edx
  10268d:	50                   	push   %eax
  10268e:	e8 75 f9 ff ff       	call   102008 <bread_wr>
  102693:	83 c4 10             	add    $0x10,%esp
  102696:	89 45 f4             	mov    %eax,-0xc(%ebp)
  bi = b % BPB;
  102699:	8b 45 0c             	mov    0xc(%ebp),%eax
  10269c:	25 ff 0f 00 00       	and    $0xfff,%eax
  1026a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  m = 1 << (bi % 8);
  1026a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1026a7:	83 e0 07             	and    $0x7,%eax
  1026aa:	ba 01 00 00 00       	mov    $0x1,%edx
  1026af:	89 c1                	mov    %eax,%ecx
  1026b1:	d3 e2                	shl    %cl,%edx
  1026b3:	89 d0                	mov    %edx,%eax
  1026b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((bp->data[bi/8] & m) == 0)
  1026b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1026bb:	8d 50 07             	lea    0x7(%eax),%edx
  1026be:	85 c0                	test   %eax,%eax
  1026c0:	0f 48 c2             	cmovs  %edx,%eax
  1026c3:	c1 f8 03             	sar    $0x3,%eax
  1026c6:	89 c2                	mov    %eax,%edx
  1026c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1026cb:	0f b6 44 10 1c       	movzbl 0x1c(%eax,%edx,1),%eax
  1026d0:	0f b6 c0             	movzbl %al,%eax
  1026d3:	23 45 ec             	and    -0x14(%ebp),%eax
  1026d6:	85 c0                	test   %eax,%eax
  1026d8:	75 0d                	jne    1026e7 <bfree+0x76>
    panic("freeing free block");
  1026da:	83 ec 0c             	sub    $0xc,%esp
  1026dd:	68 1a 41 10 00       	push   $0x10411a
  1026e2:	e8 c7 db ff ff       	call   1002ae <panic>
  bp->data[bi/8] &= ~m;
  1026e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1026ea:	8d 50 07             	lea    0x7(%eax),%edx
  1026ed:	85 c0                	test   %eax,%eax
  1026ef:	0f 48 c2             	cmovs  %edx,%eax
  1026f2:	c1 f8 03             	sar    $0x3,%eax
  1026f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1026f8:	0f b6 54 02 1c       	movzbl 0x1c(%edx,%eax,1),%edx
  1026fd:	89 d1                	mov    %edx,%ecx
  1026ff:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102702:	f7 d2                	not    %edx
  102704:	21 ca                	and    %ecx,%edx
  102706:	89 d1                	mov    %edx,%ecx
  102708:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10270b:	88 4c 02 1c          	mov    %cl,0x1c(%edx,%eax,1)
  log_write(bp);
  10270f:	83 ec 0c             	sub    $0xc,%esp
  102712:	ff 75 f4             	push   -0xc(%ebp)
  102715:	e8 af 16 00 00       	call   103dc9 <log_write>
  10271a:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  10271d:	83 ec 0c             	sub    $0xc,%esp
  102720:	ff 75 f4             	push   -0xc(%ebp)
  102723:	e8 ea f8 ff ff       	call   102012 <brelse>
  102728:	83 c4 10             	add    $0x10,%esp
}
  10272b:	90                   	nop
  10272c:	c9                   	leave
  10272d:	c3                   	ret

0010272e <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
  10272e:	55                   	push   %ebp
  10272f:	89 e5                	mov    %esp,%ebp
  102731:	57                   	push   %edi
  102732:	56                   	push   %esi
  102733:	53                   	push   %ebx
  102734:	83 ec 1c             	sub    $0x1c,%esp
  readsb(dev, &sb);
  102737:	83 ec 08             	sub    $0x8,%esp
  10273a:	68 80 9e 10 00       	push   $0x109e80
  10273f:	ff 75 08             	push   0x8(%ebp)
  102742:	e8 51 fd ff ff       	call   102498 <readsb>
  102747:	83 c4 10             	add    $0x10,%esp
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
  10274a:	a1 98 9e 10 00       	mov    0x109e98,%eax
  10274f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102752:	8b 3d 94 9e 10 00    	mov    0x109e94,%edi
  102758:	8b 35 90 9e 10 00    	mov    0x109e90,%esi
  10275e:	8b 1d 8c 9e 10 00    	mov    0x109e8c,%ebx
  102764:	8b 0d 88 9e 10 00    	mov    0x109e88,%ecx
  10276a:	8b 15 84 9e 10 00    	mov    0x109e84,%edx
  102770:	a1 80 9e 10 00       	mov    0x109e80,%eax
  102775:	ff 75 e4             	push   -0x1c(%ebp)
  102778:	57                   	push   %edi
  102779:	56                   	push   %esi
  10277a:	53                   	push   %ebx
  10277b:	51                   	push   %ecx
  10277c:	52                   	push   %edx
  10277d:	50                   	push   %eax
  10277e:	68 30 41 10 00       	push   $0x104130
  102783:	e8 64 d9 ff ff       	call   1000ec <cprintf>
  102788:	83 c4 20             	add    $0x20,%esp
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
  10278b:	90                   	nop
  10278c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10278f:	5b                   	pop    %ebx
  102790:	5e                   	pop    %esi
  102791:	5f                   	pop    %edi
  102792:	5d                   	pop    %ebp
  102793:	c3                   	ret

00102794 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
  102794:	55                   	push   %ebp
  102795:	89 e5                	mov    %esp,%ebp
  102797:	83 ec 28             	sub    $0x28,%esp
  10279a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10279d:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
  1027a1:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  1027a8:	e9 9e 00 00 00       	jmp    10284b <ialloc+0xb7>
    bp = bread_wr(dev, IBLOCK(inum, sb));
  1027ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1027b0:	c1 e8 03             	shr    $0x3,%eax
  1027b3:	89 c2                	mov    %eax,%edx
  1027b5:	a1 94 9e 10 00       	mov    0x109e94,%eax
  1027ba:	01 d0                	add    %edx,%eax
  1027bc:	83 ec 08             	sub    $0x8,%esp
  1027bf:	50                   	push   %eax
  1027c0:	ff 75 08             	push   0x8(%ebp)
  1027c3:	e8 40 f8 ff ff       	call   102008 <bread_wr>
  1027c8:	83 c4 10             	add    $0x10,%esp
  1027cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    dip = (struct dinode*)bp->data + inum%IPB;
  1027ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027d1:	8d 50 1c             	lea    0x1c(%eax),%edx
  1027d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1027d7:	83 e0 07             	and    $0x7,%eax
  1027da:	c1 e0 06             	shl    $0x6,%eax
  1027dd:	01 d0                	add    %edx,%eax
  1027df:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(dip->type == 0){  // a free inode
  1027e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1027e5:	0f b7 00             	movzwl (%eax),%eax
  1027e8:	66 85 c0             	test   %ax,%ax
  1027eb:	75 4c                	jne    102839 <ialloc+0xa5>
      memset(dip, 0, sizeof(*dip));
  1027ed:	83 ec 04             	sub    $0x4,%esp
  1027f0:	6a 40                	push   $0x40
  1027f2:	6a 00                	push   $0x0
  1027f4:	ff 75 ec             	push   -0x14(%ebp)
  1027f7:	e8 b1 e6 ff ff       	call   100ead <memset>
  1027fc:	83 c4 10             	add    $0x10,%esp
      dip->type = type;
  1027ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102802:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
  102806:	66 89 10             	mov    %dx,(%eax)
      log_write(bp);   // mark it allocated on the disk
  102809:	83 ec 0c             	sub    $0xc,%esp
  10280c:	ff 75 f0             	push   -0x10(%ebp)
  10280f:	e8 b5 15 00 00       	call   103dc9 <log_write>
  102814:	83 c4 10             	add    $0x10,%esp
      brelse(bp);
  102817:	83 ec 0c             	sub    $0xc,%esp
  10281a:	ff 75 f0             	push   -0x10(%ebp)
  10281d:	e8 f0 f7 ff ff       	call   102012 <brelse>
  102822:	83 c4 10             	add    $0x10,%esp
      return iget(dev, inum);
  102825:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102828:	83 ec 08             	sub    $0x8,%esp
  10282b:	50                   	push   %eax
  10282c:	ff 75 08             	push   0x8(%ebp)
  10282f:	e8 63 01 00 00       	call   102997 <iget>
  102834:	83 c4 10             	add    $0x10,%esp
  102837:	eb 2f                	jmp    102868 <ialloc+0xd4>
    }
    brelse(bp);
  102839:	83 ec 0c             	sub    $0xc,%esp
  10283c:	ff 75 f0             	push   -0x10(%ebp)
  10283f:	e8 ce f7 ff ff       	call   102012 <brelse>
  102844:	83 c4 10             	add    $0x10,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
  102847:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10284b:	a1 88 9e 10 00       	mov    0x109e88,%eax
  102850:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102853:	39 c2                	cmp    %eax,%edx
  102855:	0f 82 52 ff ff ff    	jb     1027ad <ialloc+0x19>
  }
  panic("ialloc: no inodes");
  10285b:	83 ec 0c             	sub    $0xc,%esp
  10285e:	68 83 41 10 00       	push   $0x104183
  102863:	e8 46 da ff ff       	call   1002ae <panic>
}
  102868:	c9                   	leave
  102869:	c3                   	ret

0010286a <iput>:
// be recycled.
// If that was the last reference and the inode has no links
// to it, free the inode (and its content) on disk.
void
iput(struct inode *ip)
{
  10286a:	55                   	push   %ebp
  10286b:	89 e5                	mov    %esp,%ebp
  10286d:	83 ec 18             	sub    $0x18,%esp
  if(ip->valid && ip->nlink == 0){
  102870:	8b 45 08             	mov    0x8(%ebp),%eax
  102873:	8b 40 0c             	mov    0xc(%eax),%eax
  102876:	85 c0                	test   %eax,%eax
  102878:	74 4a                	je     1028c4 <iput+0x5a>
  10287a:	8b 45 08             	mov    0x8(%ebp),%eax
  10287d:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  102881:	66 85 c0             	test   %ax,%ax
  102884:	75 3e                	jne    1028c4 <iput+0x5a>
    int r = ip->ref;
  102886:	8b 45 08             	mov    0x8(%ebp),%eax
  102889:	8b 40 08             	mov    0x8(%eax),%eax
  10288c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(r == 1){
  10288f:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
  102893:	75 2f                	jne    1028c4 <iput+0x5a>
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
  102895:	83 ec 0c             	sub    $0xc,%esp
  102898:	ff 75 08             	push   0x8(%ebp)
  10289b:	e8 c1 03 00 00       	call   102c61 <itrunc>
  1028a0:	83 c4 10             	add    $0x10,%esp
      ip->type = 0;
  1028a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1028a6:	66 c7 40 10 00 00    	movw   $0x0,0x10(%eax)
      iupdate(ip);
  1028ac:	83 ec 0c             	sub    $0xc,%esp
  1028af:	ff 75 08             	push   0x8(%ebp)
  1028b2:	e8 1f 00 00 00       	call   1028d6 <iupdate>
  1028b7:	83 c4 10             	add    $0x10,%esp
      ip->valid = 0;
  1028ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1028bd:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    }
  }
  ip->ref--;
  1028c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1028c7:	8b 40 08             	mov    0x8(%eax),%eax
  1028ca:	8d 50 ff             	lea    -0x1(%eax),%edx
  1028cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1028d0:	89 50 08             	mov    %edx,0x8(%eax)
}
  1028d3:	90                   	nop
  1028d4:	c9                   	leave
  1028d5:	c3                   	ret

001028d6 <iupdate>:
// Copy a modified in-memory inode to disk.
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
void
iupdate(struct inode *ip)
{
  1028d6:	55                   	push   %ebp
  1028d7:	89 e5                	mov    %esp,%ebp
  1028d9:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  struct dinode *dip;

  bp = bread_wr(ip->dev, IBLOCK(ip->inum, sb));
  1028dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1028df:	8b 40 04             	mov    0x4(%eax),%eax
  1028e2:	c1 e8 03             	shr    $0x3,%eax
  1028e5:	89 c2                	mov    %eax,%edx
  1028e7:	a1 94 9e 10 00       	mov    0x109e94,%eax
  1028ec:	01 c2                	add    %eax,%edx
  1028ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1028f1:	8b 00                	mov    (%eax),%eax
  1028f3:	83 ec 08             	sub    $0x8,%esp
  1028f6:	52                   	push   %edx
  1028f7:	50                   	push   %eax
  1028f8:	e8 0b f7 ff ff       	call   102008 <bread_wr>
  1028fd:	83 c4 10             	add    $0x10,%esp
  102900:	89 45 f4             	mov    %eax,-0xc(%ebp)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  102903:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102906:	8d 50 1c             	lea    0x1c(%eax),%edx
  102909:	8b 45 08             	mov    0x8(%ebp),%eax
  10290c:	8b 40 04             	mov    0x4(%eax),%eax
  10290f:	83 e0 07             	and    $0x7,%eax
  102912:	c1 e0 06             	shl    $0x6,%eax
  102915:	01 d0                	add    %edx,%eax
  102917:	89 45 f0             	mov    %eax,-0x10(%ebp)
  dip->type = ip->type;
  10291a:	8b 45 08             	mov    0x8(%ebp),%eax
  10291d:	0f b7 50 10          	movzwl 0x10(%eax),%edx
  102921:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102924:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
  102927:	8b 45 08             	mov    0x8(%ebp),%eax
  10292a:	0f b7 50 12          	movzwl 0x12(%eax),%edx
  10292e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102931:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
  102935:	8b 45 08             	mov    0x8(%ebp),%eax
  102938:	0f b7 50 14          	movzwl 0x14(%eax),%edx
  10293c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10293f:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
  102943:	8b 45 08             	mov    0x8(%ebp),%eax
  102946:	0f b7 50 16          	movzwl 0x16(%eax),%edx
  10294a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10294d:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
  102951:	8b 45 08             	mov    0x8(%ebp),%eax
  102954:	8b 50 18             	mov    0x18(%eax),%edx
  102957:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10295a:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  10295d:	8b 45 08             	mov    0x8(%ebp),%eax
  102960:	8d 50 1c             	lea    0x1c(%eax),%edx
  102963:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102966:	83 c0 0c             	add    $0xc,%eax
  102969:	83 ec 04             	sub    $0x4,%esp
  10296c:	6a 34                	push   $0x34
  10296e:	52                   	push   %edx
  10296f:	50                   	push   %eax
  102970:	e8 f7 e5 ff ff       	call   100f6c <memmove>
  102975:	83 c4 10             	add    $0x10,%esp
  log_write(bp);
  102978:	83 ec 0c             	sub    $0xc,%esp
  10297b:	ff 75 f4             	push   -0xc(%ebp)
  10297e:	e8 46 14 00 00       	call   103dc9 <log_write>
  102983:	83 c4 10             	add    $0x10,%esp
  brelse(bp);
  102986:	83 ec 0c             	sub    $0xc,%esp
  102989:	ff 75 f4             	push   -0xc(%ebp)
  10298c:	e8 81 f6 ff ff       	call   102012 <brelse>
  102991:	83 c4 10             	add    $0x10,%esp
}
  102994:	90                   	nop
  102995:	c9                   	leave
  102996:	c3                   	ret

00102997 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
struct inode*
iget(uint dev, uint inum)
{
  102997:	55                   	push   %ebp
  102998:	89 e5                	mov    %esp,%ebp
  10299a:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip, *empty;

  // Is the inode already cached?
  empty = 0;
  10299d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
  1029a4:	c7 45 f4 a0 9e 10 00 	movl   $0x109ea0,-0xc(%ebp)
  1029ab:	eb 4d                	jmp    1029fa <iget+0x63>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
  1029ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029b0:	8b 40 08             	mov    0x8(%eax),%eax
  1029b3:	85 c0                	test   %eax,%eax
  1029b5:	7e 29                	jle    1029e0 <iget+0x49>
  1029b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029ba:	8b 00                	mov    (%eax),%eax
  1029bc:	39 45 08             	cmp    %eax,0x8(%ebp)
  1029bf:	75 1f                	jne    1029e0 <iget+0x49>
  1029c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029c4:	8b 40 04             	mov    0x4(%eax),%eax
  1029c7:	39 45 0c             	cmp    %eax,0xc(%ebp)
  1029ca:	75 14                	jne    1029e0 <iget+0x49>
      ip->ref++;
  1029cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029cf:	8b 40 08             	mov    0x8(%eax),%eax
  1029d2:	8d 50 01             	lea    0x1(%eax),%edx
  1029d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029d8:	89 50 08             	mov    %edx,0x8(%eax)
      return ip;
  1029db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029de:	eb 64                	jmp    102a44 <iget+0xad>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
  1029e0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1029e4:	75 10                	jne    1029f6 <iget+0x5f>
  1029e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029e9:	8b 40 08             	mov    0x8(%eax),%eax
  1029ec:	85 c0                	test   %eax,%eax
  1029ee:	75 06                	jne    1029f6 <iget+0x5f>
      empty = ip;
  1029f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
  1029f6:	83 45 f4 50          	addl   $0x50,-0xc(%ebp)
  1029fa:	81 7d f4 40 ae 10 00 	cmpl   $0x10ae40,-0xc(%ebp)
  102a01:	72 aa                	jb     1029ad <iget+0x16>
  }

  // Recycle an inode cache entry.
  if(empty == 0)
  102a03:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102a07:	75 0d                	jne    102a16 <iget+0x7f>
    panic("iget: no inodes");
  102a09:	83 ec 0c             	sub    $0xc,%esp
  102a0c:	68 95 41 10 00       	push   $0x104195
  102a11:	e8 98 d8 ff ff       	call   1002ae <panic>

  ip = empty;
  102a16:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a19:	89 45 f4             	mov    %eax,-0xc(%ebp)
  ip->dev = dev;
  102a1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a1f:	8b 55 08             	mov    0x8(%ebp),%edx
  102a22:	89 10                	mov    %edx,(%eax)
  ip->inum = inum;
  102a24:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a27:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a2a:	89 50 04             	mov    %edx,0x4(%eax)
  ip->ref = 1;
  102a2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a30:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  ip->valid = 0;
  102a37:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a3a:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)

  return ip;
  102a41:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102a44:	c9                   	leave
  102a45:	c3                   	ret

00102a46 <iread>:

// Reads the inode from disk if necessary.
void
iread(struct inode *ip)
{
  102a46:	55                   	push   %ebp
  102a47:	89 e5                	mov    %esp,%ebp
  102a49:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
  102a4c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102a50:	74 0a                	je     102a5c <iread+0x16>
  102a52:	8b 45 08             	mov    0x8(%ebp),%eax
  102a55:	8b 40 08             	mov    0x8(%eax),%eax
  102a58:	85 c0                	test   %eax,%eax
  102a5a:	7f 0d                	jg     102a69 <iread+0x23>
    panic("iread");
  102a5c:	83 ec 0c             	sub    $0xc,%esp
  102a5f:	68 a5 41 10 00       	push   $0x1041a5
  102a64:	e8 45 d8 ff ff       	call   1002ae <panic>

  if(ip->valid == 0){
  102a69:	8b 45 08             	mov    0x8(%ebp),%eax
  102a6c:	8b 40 0c             	mov    0xc(%eax),%eax
  102a6f:	85 c0                	test   %eax,%eax
  102a71:	0f 85 cd 00 00 00    	jne    102b44 <iread+0xfe>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  102a77:	8b 45 08             	mov    0x8(%ebp),%eax
  102a7a:	8b 40 04             	mov    0x4(%eax),%eax
  102a7d:	c1 e8 03             	shr    $0x3,%eax
  102a80:	89 c2                	mov    %eax,%edx
  102a82:	a1 94 9e 10 00       	mov    0x109e94,%eax
  102a87:	01 c2                	add    %eax,%edx
  102a89:	8b 45 08             	mov    0x8(%ebp),%eax
  102a8c:	8b 00                	mov    (%eax),%eax
  102a8e:	83 ec 08             	sub    $0x8,%esp
  102a91:	52                   	push   %edx
  102a92:	50                   	push   %eax
  102a93:	e8 11 f5 ff ff       	call   101fa9 <bread>
  102a98:	83 c4 10             	add    $0x10,%esp
  102a9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
  102a9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102aa1:	8d 50 1c             	lea    0x1c(%eax),%edx
  102aa4:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa7:	8b 40 04             	mov    0x4(%eax),%eax
  102aaa:	83 e0 07             	and    $0x7,%eax
  102aad:	c1 e0 06             	shl    $0x6,%eax
  102ab0:	01 d0                	add    %edx,%eax
  102ab2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    ip->type = dip->type;
  102ab5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ab8:	0f b7 10             	movzwl (%eax),%edx
  102abb:	8b 45 08             	mov    0x8(%ebp),%eax
  102abe:	66 89 50 10          	mov    %dx,0x10(%eax)
    ip->major = dip->major;
  102ac2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ac5:	0f b7 50 02          	movzwl 0x2(%eax),%edx
  102ac9:	8b 45 08             	mov    0x8(%ebp),%eax
  102acc:	66 89 50 12          	mov    %dx,0x12(%eax)
    ip->minor = dip->minor;
  102ad0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ad3:	0f b7 50 04          	movzwl 0x4(%eax),%edx
  102ad7:	8b 45 08             	mov    0x8(%ebp),%eax
  102ada:	66 89 50 14          	mov    %dx,0x14(%eax)
    ip->nlink = dip->nlink;
  102ade:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ae1:	0f b7 50 06          	movzwl 0x6(%eax),%edx
  102ae5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae8:	66 89 50 16          	mov    %dx,0x16(%eax)
    ip->size = dip->size;
  102aec:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102aef:	8b 50 08             	mov    0x8(%eax),%edx
  102af2:	8b 45 08             	mov    0x8(%ebp),%eax
  102af5:	89 50 18             	mov    %edx,0x18(%eax)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
  102af8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102afb:	8d 50 0c             	lea    0xc(%eax),%edx
  102afe:	8b 45 08             	mov    0x8(%ebp),%eax
  102b01:	83 c0 1c             	add    $0x1c,%eax
  102b04:	83 ec 04             	sub    $0x4,%esp
  102b07:	6a 34                	push   $0x34
  102b09:	52                   	push   %edx
  102b0a:	50                   	push   %eax
  102b0b:	e8 5c e4 ff ff       	call   100f6c <memmove>
  102b10:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  102b13:	83 ec 0c             	sub    $0xc,%esp
  102b16:	ff 75 f4             	push   -0xc(%ebp)
  102b19:	e8 f4 f4 ff ff       	call   102012 <brelse>
  102b1e:	83 c4 10             	add    $0x10,%esp
    ip->valid = 1;
  102b21:	8b 45 08             	mov    0x8(%ebp),%eax
  102b24:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
    if(ip->type == 0)
  102b2b:	8b 45 08             	mov    0x8(%ebp),%eax
  102b2e:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  102b32:	66 85 c0             	test   %ax,%ax
  102b35:	75 0d                	jne    102b44 <iread+0xfe>
      panic("iread: no type");
  102b37:	83 ec 0c             	sub    $0xc,%esp
  102b3a:	68 ab 41 10 00       	push   $0x1041ab
  102b3f:	e8 6a d7 ff ff       	call   1002ae <panic>
  }
}
  102b44:	90                   	nop
  102b45:	c9                   	leave
  102b46:	c3                   	ret

00102b47 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
  102b47:	55                   	push   %ebp
  102b48:	89 e5                	mov    %esp,%ebp
  102b4a:	83 ec 18             	sub    $0x18,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
  102b4d:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
  102b51:	77 42                	ja     102b95 <bmap+0x4e>
    if((addr = ip->addrs[bn]) == 0)
  102b53:	8b 45 08             	mov    0x8(%ebp),%eax
  102b56:	8b 55 0c             	mov    0xc(%ebp),%edx
  102b59:	83 c2 04             	add    $0x4,%edx
  102b5c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102b60:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b63:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102b67:	75 24                	jne    102b8d <bmap+0x46>
      ip->addrs[bn] = addr = balloc(ip->dev);
  102b69:	8b 45 08             	mov    0x8(%ebp),%eax
  102b6c:	8b 00                	mov    (%eax),%eax
  102b6e:	83 ec 0c             	sub    $0xc,%esp
  102b71:	50                   	push   %eax
  102b72:	e8 b7 f9 ff ff       	call   10252e <balloc>
  102b77:	83 c4 10             	add    $0x10,%esp
  102b7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b7d:	8b 45 08             	mov    0x8(%ebp),%eax
  102b80:	8b 55 0c             	mov    0xc(%ebp),%edx
  102b83:	8d 4a 04             	lea    0x4(%edx),%ecx
  102b86:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b89:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    return addr;
  102b8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b90:	e9 ca 00 00 00       	jmp    102c5f <bmap+0x118>
  }
  bn -= NDIRECT;
  102b95:	83 6d 0c 0c          	subl   $0xc,0xc(%ebp)

  if(bn < NINDIRECT){
  102b99:	83 7d 0c 7f          	cmpl   $0x7f,0xc(%ebp)
  102b9d:	0f 87 af 00 00 00    	ja     102c52 <bmap+0x10b>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
  102ba3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ba6:	8b 40 4c             	mov    0x4c(%eax),%eax
  102ba9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102bac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102bb0:	75 1d                	jne    102bcf <bmap+0x88>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
  102bb2:	8b 45 08             	mov    0x8(%ebp),%eax
  102bb5:	8b 00                	mov    (%eax),%eax
  102bb7:	83 ec 0c             	sub    $0xc,%esp
  102bba:	50                   	push   %eax
  102bbb:	e8 6e f9 ff ff       	call   10252e <balloc>
  102bc0:	83 c4 10             	add    $0x10,%esp
  102bc3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102bc6:	8b 45 08             	mov    0x8(%ebp),%eax
  102bc9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bcc:	89 50 4c             	mov    %edx,0x4c(%eax)
    bp = bread(ip->dev, addr);
  102bcf:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd2:	8b 00                	mov    (%eax),%eax
  102bd4:	83 ec 08             	sub    $0x8,%esp
  102bd7:	ff 75 f4             	push   -0xc(%ebp)
  102bda:	50                   	push   %eax
  102bdb:	e8 c9 f3 ff ff       	call   101fa9 <bread>
  102be0:	83 c4 10             	add    $0x10,%esp
  102be3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    a = (uint*)bp->data;
  102be6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102be9:	83 c0 1c             	add    $0x1c,%eax
  102bec:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((addr = a[bn]) == 0){
  102bef:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bf2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102bf9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102bfc:	01 d0                	add    %edx,%eax
  102bfe:	8b 00                	mov    (%eax),%eax
  102c00:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c03:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  102c07:	75 36                	jne    102c3f <bmap+0xf8>
      a[bn] = addr = balloc(ip->dev);
  102c09:	8b 45 08             	mov    0x8(%ebp),%eax
  102c0c:	8b 00                	mov    (%eax),%eax
  102c0e:	83 ec 0c             	sub    $0xc,%esp
  102c11:	50                   	push   %eax
  102c12:	e8 17 f9 ff ff       	call   10252e <balloc>
  102c17:	83 c4 10             	add    $0x10,%esp
  102c1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c20:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102c27:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c2a:	01 c2                	add    %eax,%edx
  102c2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c2f:	89 02                	mov    %eax,(%edx)
      log_write(bp);
  102c31:	83 ec 0c             	sub    $0xc,%esp
  102c34:	ff 75 f0             	push   -0x10(%ebp)
  102c37:	e8 8d 11 00 00       	call   103dc9 <log_write>
  102c3c:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  102c3f:	83 ec 0c             	sub    $0xc,%esp
  102c42:	ff 75 f0             	push   -0x10(%ebp)
  102c45:	e8 c8 f3 ff ff       	call   102012 <brelse>
  102c4a:	83 c4 10             	add    $0x10,%esp
    return addr;
  102c4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c50:	eb 0d                	jmp    102c5f <bmap+0x118>
  }

  panic("bmap: out of range");
  102c52:	83 ec 0c             	sub    $0xc,%esp
  102c55:	68 ba 41 10 00       	push   $0x1041ba
  102c5a:	e8 4f d6 ff ff       	call   1002ae <panic>
}
  102c5f:	c9                   	leave
  102c60:	c3                   	ret

00102c61 <itrunc>:
// to it (no directory entries referring to it)
// and has no in-memory reference to it (is
// not an open file or current directory).
static void
itrunc(struct inode *ip)
{
  102c61:	55                   	push   %ebp
  102c62:	89 e5                	mov    %esp,%ebp
  102c64:	83 ec 18             	sub    $0x18,%esp
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
  102c67:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102c6e:	eb 45                	jmp    102cb5 <itrunc+0x54>
    if(ip->addrs[i]){
  102c70:	8b 45 08             	mov    0x8(%ebp),%eax
  102c73:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c76:	83 c2 04             	add    $0x4,%edx
  102c79:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102c7d:	85 c0                	test   %eax,%eax
  102c7f:	74 30                	je     102cb1 <itrunc+0x50>
      bfree(ip->dev, ip->addrs[i]);
  102c81:	8b 45 08             	mov    0x8(%ebp),%eax
  102c84:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c87:	83 c2 04             	add    $0x4,%edx
  102c8a:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
  102c8e:	8b 55 08             	mov    0x8(%ebp),%edx
  102c91:	8b 12                	mov    (%edx),%edx
  102c93:	83 ec 08             	sub    $0x8,%esp
  102c96:	50                   	push   %eax
  102c97:	52                   	push   %edx
  102c98:	e8 d4 f9 ff ff       	call   102671 <bfree>
  102c9d:	83 c4 10             	add    $0x10,%esp
      ip->addrs[i] = 0;
  102ca0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ca6:	83 c2 04             	add    $0x4,%edx
  102ca9:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
  102cb0:	00 
  for(i = 0; i < NDIRECT; i++){
  102cb1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  102cb5:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
  102cb9:	7e b5                	jle    102c70 <itrunc+0xf>
    }
  }

  if(ip->addrs[NDIRECT]){
  102cbb:	8b 45 08             	mov    0x8(%ebp),%eax
  102cbe:	8b 40 4c             	mov    0x4c(%eax),%eax
  102cc1:	85 c0                	test   %eax,%eax
  102cc3:	0f 84 a1 00 00 00    	je     102d6a <itrunc+0x109>
    bp = bread_wr(ip->dev, ip->addrs[NDIRECT]);
  102cc9:	8b 45 08             	mov    0x8(%ebp),%eax
  102ccc:	8b 50 4c             	mov    0x4c(%eax),%edx
  102ccf:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd2:	8b 00                	mov    (%eax),%eax
  102cd4:	83 ec 08             	sub    $0x8,%esp
  102cd7:	52                   	push   %edx
  102cd8:	50                   	push   %eax
  102cd9:	e8 2a f3 ff ff       	call   102008 <bread_wr>
  102cde:	83 c4 10             	add    $0x10,%esp
  102ce1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    a = (uint*)bp->data;
  102ce4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ce7:	83 c0 1c             	add    $0x1c,%eax
  102cea:	89 45 e8             	mov    %eax,-0x18(%ebp)
    for(j = 0; j < NINDIRECT; j++){
  102ced:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  102cf4:	eb 3c                	jmp    102d32 <itrunc+0xd1>
      if(a[j])
  102cf6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cf9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102d00:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d03:	01 d0                	add    %edx,%eax
  102d05:	8b 00                	mov    (%eax),%eax
  102d07:	85 c0                	test   %eax,%eax
  102d09:	74 23                	je     102d2e <itrunc+0xcd>
        bfree(ip->dev, a[j]);
  102d0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d0e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102d15:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d18:	01 d0                	add    %edx,%eax
  102d1a:	8b 00                	mov    (%eax),%eax
  102d1c:	8b 55 08             	mov    0x8(%ebp),%edx
  102d1f:	8b 12                	mov    (%edx),%edx
  102d21:	83 ec 08             	sub    $0x8,%esp
  102d24:	50                   	push   %eax
  102d25:	52                   	push   %edx
  102d26:	e8 46 f9 ff ff       	call   102671 <bfree>
  102d2b:	83 c4 10             	add    $0x10,%esp
    for(j = 0; j < NINDIRECT; j++){
  102d2e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  102d32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d35:	83 f8 7f             	cmp    $0x7f,%eax
  102d38:	76 bc                	jbe    102cf6 <itrunc+0x95>
    }
    brelse(bp);
  102d3a:	83 ec 0c             	sub    $0xc,%esp
  102d3d:	ff 75 ec             	push   -0x14(%ebp)
  102d40:	e8 cd f2 ff ff       	call   102012 <brelse>
  102d45:	83 c4 10             	add    $0x10,%esp
    bfree(ip->dev, ip->addrs[NDIRECT]);
  102d48:	8b 45 08             	mov    0x8(%ebp),%eax
  102d4b:	8b 40 4c             	mov    0x4c(%eax),%eax
  102d4e:	8b 55 08             	mov    0x8(%ebp),%edx
  102d51:	8b 12                	mov    (%edx),%edx
  102d53:	83 ec 08             	sub    $0x8,%esp
  102d56:	50                   	push   %eax
  102d57:	52                   	push   %edx
  102d58:	e8 14 f9 ff ff       	call   102671 <bfree>
  102d5d:	83 c4 10             	add    $0x10,%esp
    ip->addrs[NDIRECT] = 0;
  102d60:	8b 45 08             	mov    0x8(%ebp),%eax
  102d63:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
  }

  ip->size = 0;
  102d6a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6d:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  iupdate(ip);
  102d74:	83 ec 0c             	sub    $0xc,%esp
  102d77:	ff 75 08             	push   0x8(%ebp)
  102d7a:	e8 57 fb ff ff       	call   1028d6 <iupdate>
  102d7f:	83 c4 10             	add    $0x10,%esp
}
  102d82:	90                   	nop
  102d83:	c9                   	leave
  102d84:	c3                   	ret

00102d85 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
  102d85:	55                   	push   %ebp
  102d86:	89 e5                	mov    %esp,%ebp
  st->dev = ip->dev;
  102d88:	8b 45 08             	mov    0x8(%ebp),%eax
  102d8b:	8b 00                	mov    (%eax),%eax
  102d8d:	89 c2                	mov    %eax,%edx
  102d8f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d92:	89 50 04             	mov    %edx,0x4(%eax)
  st->ino = ip->inum;
  102d95:	8b 45 08             	mov    0x8(%ebp),%eax
  102d98:	8b 50 04             	mov    0x4(%eax),%edx
  102d9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d9e:	89 50 08             	mov    %edx,0x8(%eax)
  st->type = ip->type;
  102da1:	8b 45 08             	mov    0x8(%ebp),%eax
  102da4:	0f b7 50 10          	movzwl 0x10(%eax),%edx
  102da8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dab:	66 89 10             	mov    %dx,(%eax)
  st->nlink = ip->nlink;
  102dae:	8b 45 08             	mov    0x8(%ebp),%eax
  102db1:	0f b7 50 16          	movzwl 0x16(%eax),%edx
  102db5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102db8:	66 89 50 0c          	mov    %dx,0xc(%eax)
  st->size = ip->size;
  102dbc:	8b 45 08             	mov    0x8(%ebp),%eax
  102dbf:	8b 50 18             	mov    0x18(%eax),%edx
  102dc2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dc5:	89 50 10             	mov    %edx,0x10(%eax)
}
  102dc8:	90                   	nop
  102dc9:	5d                   	pop    %ebp
  102dca:	c3                   	ret

00102dcb <readi>:

// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
  102dcb:	55                   	push   %ebp
  102dcc:	89 e5                	mov    %esp,%ebp
  102dce:	83 ec 18             	sub    $0x18,%esp
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off || ip->nlink < 1)
  102dd1:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd4:	8b 40 18             	mov    0x18(%eax),%eax
  102dd7:	3b 45 10             	cmp    0x10(%ebp),%eax
  102dda:	72 19                	jb     102df5 <readi+0x2a>
  102ddc:	8b 55 10             	mov    0x10(%ebp),%edx
  102ddf:	8b 45 14             	mov    0x14(%ebp),%eax
  102de2:	01 d0                	add    %edx,%eax
  102de4:	3b 45 10             	cmp    0x10(%ebp),%eax
  102de7:	72 0c                	jb     102df5 <readi+0x2a>
  102de9:	8b 45 08             	mov    0x8(%ebp),%eax
  102dec:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  102df0:	66 85 c0             	test   %ax,%ax
  102df3:	7f 0a                	jg     102dff <readi+0x34>
    return -1;
  102df5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102dfa:	e9 c2 00 00 00       	jmp    102ec1 <readi+0xf6>
  if(off + n > ip->size)
  102dff:	8b 55 10             	mov    0x10(%ebp),%edx
  102e02:	8b 45 14             	mov    0x14(%ebp),%eax
  102e05:	01 c2                	add    %eax,%edx
  102e07:	8b 45 08             	mov    0x8(%ebp),%eax
  102e0a:	8b 40 18             	mov    0x18(%eax),%eax
  102e0d:	39 d0                	cmp    %edx,%eax
  102e0f:	73 0c                	jae    102e1d <readi+0x52>
    n = ip->size - off;
  102e11:	8b 45 08             	mov    0x8(%ebp),%eax
  102e14:	8b 40 18             	mov    0x18(%eax),%eax
  102e17:	2b 45 10             	sub    0x10(%ebp),%eax
  102e1a:	89 45 14             	mov    %eax,0x14(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
  102e1d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102e24:	e9 89 00 00 00       	jmp    102eb2 <readi+0xe7>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
  102e29:	8b 45 10             	mov    0x10(%ebp),%eax
  102e2c:	c1 e8 09             	shr    $0x9,%eax
  102e2f:	83 ec 08             	sub    $0x8,%esp
  102e32:	50                   	push   %eax
  102e33:	ff 75 08             	push   0x8(%ebp)
  102e36:	e8 0c fd ff ff       	call   102b47 <bmap>
  102e3b:	83 c4 10             	add    $0x10,%esp
  102e3e:	8b 55 08             	mov    0x8(%ebp),%edx
  102e41:	8b 12                	mov    (%edx),%edx
  102e43:	83 ec 08             	sub    $0x8,%esp
  102e46:	50                   	push   %eax
  102e47:	52                   	push   %edx
  102e48:	e8 5c f1 ff ff       	call   101fa9 <bread>
  102e4d:	83 c4 10             	add    $0x10,%esp
  102e50:	89 45 f0             	mov    %eax,-0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
  102e53:	8b 45 10             	mov    0x10(%ebp),%eax
  102e56:	25 ff 01 00 00       	and    $0x1ff,%eax
  102e5b:	ba 00 02 00 00       	mov    $0x200,%edx
  102e60:	29 c2                	sub    %eax,%edx
  102e62:	8b 45 14             	mov    0x14(%ebp),%eax
  102e65:	2b 45 f4             	sub    -0xc(%ebp),%eax
  102e68:	39 c2                	cmp    %eax,%edx
  102e6a:	0f 46 c2             	cmovbe %edx,%eax
  102e6d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(dst, bp->data + off%BSIZE, m);
  102e70:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e73:	8d 50 1c             	lea    0x1c(%eax),%edx
  102e76:	8b 45 10             	mov    0x10(%ebp),%eax
  102e79:	25 ff 01 00 00       	and    $0x1ff,%eax
  102e7e:	01 d0                	add    %edx,%eax
  102e80:	83 ec 04             	sub    $0x4,%esp
  102e83:	ff 75 ec             	push   -0x14(%ebp)
  102e86:	50                   	push   %eax
  102e87:	ff 75 0c             	push   0xc(%ebp)
  102e8a:	e8 dd e0 ff ff       	call   100f6c <memmove>
  102e8f:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  102e92:	83 ec 0c             	sub    $0xc,%esp
  102e95:	ff 75 f0             	push   -0x10(%ebp)
  102e98:	e8 75 f1 ff ff       	call   102012 <brelse>
  102e9d:	83 c4 10             	add    $0x10,%esp
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
  102ea0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ea3:	01 45 f4             	add    %eax,-0xc(%ebp)
  102ea6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ea9:	01 45 10             	add    %eax,0x10(%ebp)
  102eac:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102eaf:	01 45 0c             	add    %eax,0xc(%ebp)
  102eb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102eb5:	3b 45 14             	cmp    0x14(%ebp),%eax
  102eb8:	0f 82 6b ff ff ff    	jb     102e29 <readi+0x5e>
  }
  return n;
  102ebe:	8b 45 14             	mov    0x14(%ebp),%eax
}
  102ec1:	c9                   	leave
  102ec2:	c3                   	ret

00102ec3 <writei>:

// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
  102ec3:	55                   	push   %ebp
  102ec4:	89 e5                	mov    %esp,%ebp
  102ec6:	83 ec 18             	sub    $0x18,%esp
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
  102ec9:	8b 45 08             	mov    0x8(%ebp),%eax
  102ecc:	8b 40 18             	mov    0x18(%eax),%eax
  102ecf:	3b 45 10             	cmp    0x10(%ebp),%eax
  102ed2:	72 0d                	jb     102ee1 <writei+0x1e>
  102ed4:	8b 55 10             	mov    0x10(%ebp),%edx
  102ed7:	8b 45 14             	mov    0x14(%ebp),%eax
  102eda:	01 d0                	add    %edx,%eax
  102edc:	3b 45 10             	cmp    0x10(%ebp),%eax
  102edf:	73 0a                	jae    102eeb <writei+0x28>
    return -1;
  102ee1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102ee6:	e9 f3 00 00 00       	jmp    102fde <writei+0x11b>
  if(off + n > MAXFILE*BSIZE)
  102eeb:	8b 55 10             	mov    0x10(%ebp),%edx
  102eee:	8b 45 14             	mov    0x14(%ebp),%eax
  102ef1:	01 d0                	add    %edx,%eax
  102ef3:	3d 00 18 01 00       	cmp    $0x11800,%eax
  102ef8:	76 0a                	jbe    102f04 <writei+0x41>
    return -1;
  102efa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102eff:	e9 da 00 00 00       	jmp    102fde <writei+0x11b>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
  102f04:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102f0b:	e9 97 00 00 00       	jmp    102fa7 <writei+0xe4>
    bp = bread_wr(ip->dev, bmap(ip, off/BSIZE));
  102f10:	8b 45 10             	mov    0x10(%ebp),%eax
  102f13:	c1 e8 09             	shr    $0x9,%eax
  102f16:	83 ec 08             	sub    $0x8,%esp
  102f19:	50                   	push   %eax
  102f1a:	ff 75 08             	push   0x8(%ebp)
  102f1d:	e8 25 fc ff ff       	call   102b47 <bmap>
  102f22:	83 c4 10             	add    $0x10,%esp
  102f25:	8b 55 08             	mov    0x8(%ebp),%edx
  102f28:	8b 12                	mov    (%edx),%edx
  102f2a:	83 ec 08             	sub    $0x8,%esp
  102f2d:	50                   	push   %eax
  102f2e:	52                   	push   %edx
  102f2f:	e8 d4 f0 ff ff       	call   102008 <bread_wr>
  102f34:	83 c4 10             	add    $0x10,%esp
  102f37:	89 45 f0             	mov    %eax,-0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
  102f3a:	8b 45 10             	mov    0x10(%ebp),%eax
  102f3d:	25 ff 01 00 00       	and    $0x1ff,%eax
  102f42:	ba 00 02 00 00       	mov    $0x200,%edx
  102f47:	29 c2                	sub    %eax,%edx
  102f49:	8b 45 14             	mov    0x14(%ebp),%eax
  102f4c:	2b 45 f4             	sub    -0xc(%ebp),%eax
  102f4f:	39 c2                	cmp    %eax,%edx
  102f51:	0f 46 c2             	cmovbe %edx,%eax
  102f54:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(bp->data + off%BSIZE, src, m);
  102f57:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f5a:	8d 50 1c             	lea    0x1c(%eax),%edx
  102f5d:	8b 45 10             	mov    0x10(%ebp),%eax
  102f60:	25 ff 01 00 00       	and    $0x1ff,%eax
  102f65:	01 d0                	add    %edx,%eax
  102f67:	83 ec 04             	sub    $0x4,%esp
  102f6a:	ff 75 ec             	push   -0x14(%ebp)
  102f6d:	ff 75 0c             	push   0xc(%ebp)
  102f70:	50                   	push   %eax
  102f71:	e8 f6 df ff ff       	call   100f6c <memmove>
  102f76:	83 c4 10             	add    $0x10,%esp
    log_write(bp);
  102f79:	83 ec 0c             	sub    $0xc,%esp
  102f7c:	ff 75 f0             	push   -0x10(%ebp)
  102f7f:	e8 45 0e 00 00       	call   103dc9 <log_write>
  102f84:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  102f87:	83 ec 0c             	sub    $0xc,%esp
  102f8a:	ff 75 f0             	push   -0x10(%ebp)
  102f8d:	e8 80 f0 ff ff       	call   102012 <brelse>
  102f92:	83 c4 10             	add    $0x10,%esp
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
  102f95:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f98:	01 45 f4             	add    %eax,-0xc(%ebp)
  102f9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f9e:	01 45 10             	add    %eax,0x10(%ebp)
  102fa1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fa4:	01 45 0c             	add    %eax,0xc(%ebp)
  102fa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102faa:	3b 45 14             	cmp    0x14(%ebp),%eax
  102fad:	0f 82 5d ff ff ff    	jb     102f10 <writei+0x4d>
  }

  if(n > 0 && off > ip->size){
  102fb3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  102fb7:	74 22                	je     102fdb <writei+0x118>
  102fb9:	8b 45 08             	mov    0x8(%ebp),%eax
  102fbc:	8b 40 18             	mov    0x18(%eax),%eax
  102fbf:	3b 45 10             	cmp    0x10(%ebp),%eax
  102fc2:	73 17                	jae    102fdb <writei+0x118>
    ip->size = off;
  102fc4:	8b 45 08             	mov    0x8(%ebp),%eax
  102fc7:	8b 55 10             	mov    0x10(%ebp),%edx
  102fca:	89 50 18             	mov    %edx,0x18(%eax)
    iupdate(ip);
  102fcd:	83 ec 0c             	sub    $0xc,%esp
  102fd0:	ff 75 08             	push   0x8(%ebp)
  102fd3:	e8 fe f8 ff ff       	call   1028d6 <iupdate>
  102fd8:	83 c4 10             	add    $0x10,%esp
  }
  return n;
  102fdb:	8b 45 14             	mov    0x14(%ebp),%eax
}
  102fde:	c9                   	leave
  102fdf:	c3                   	ret

00102fe0 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
  102fe0:	55                   	push   %ebp
  102fe1:	89 e5                	mov    %esp,%ebp
  102fe3:	83 ec 08             	sub    $0x8,%esp
  return strncmp(s, t, DIRSIZ);
  102fe6:	83 ec 04             	sub    $0x4,%esp
  102fe9:	6a 0e                	push   $0xe
  102feb:	ff 75 0c             	push   0xc(%ebp)
  102fee:	ff 75 08             	push   0x8(%ebp)
  102ff1:	e8 0c e0 ff ff       	call   101002 <strncmp>
  102ff6:	83 c4 10             	add    $0x10,%esp
}
  102ff9:	c9                   	leave
  102ffa:	c3                   	ret

00102ffb <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
  102ffb:	55                   	push   %ebp
  102ffc:	89 e5                	mov    %esp,%ebp
  102ffe:	83 ec 28             	sub    $0x28,%esp
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
  103001:	8b 45 08             	mov    0x8(%ebp),%eax
  103004:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103008:	66 83 f8 01          	cmp    $0x1,%ax
  10300c:	74 0d                	je     10301b <dirlookup+0x20>
    panic("dirlookup not DIR");
  10300e:	83 ec 0c             	sub    $0xc,%esp
  103011:	68 cd 41 10 00       	push   $0x1041cd
  103016:	e8 93 d2 ff ff       	call   1002ae <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
  10301b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103022:	eb 7b                	jmp    10309f <dirlookup+0xa4>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  103024:	6a 10                	push   $0x10
  103026:	ff 75 f4             	push   -0xc(%ebp)
  103029:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10302c:	50                   	push   %eax
  10302d:	ff 75 08             	push   0x8(%ebp)
  103030:	e8 96 fd ff ff       	call   102dcb <readi>
  103035:	83 c4 10             	add    $0x10,%esp
  103038:	83 f8 10             	cmp    $0x10,%eax
  10303b:	74 0d                	je     10304a <dirlookup+0x4f>
      panic("dirlookup read");
  10303d:	83 ec 0c             	sub    $0xc,%esp
  103040:	68 df 41 10 00       	push   $0x1041df
  103045:	e8 64 d2 ff ff       	call   1002ae <panic>
    if(de.inum == 0)
  10304a:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  10304e:	66 85 c0             	test   %ax,%ax
  103051:	74 47                	je     10309a <dirlookup+0x9f>
      continue;
    if(namecmp(name, de.name) == 0){
  103053:	83 ec 08             	sub    $0x8,%esp
  103056:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103059:	83 c0 02             	add    $0x2,%eax
  10305c:	50                   	push   %eax
  10305d:	ff 75 0c             	push   0xc(%ebp)
  103060:	e8 7b ff ff ff       	call   102fe0 <namecmp>
  103065:	83 c4 10             	add    $0x10,%esp
  103068:	85 c0                	test   %eax,%eax
  10306a:	75 2f                	jne    10309b <dirlookup+0xa0>
      // entry matches path element
      if(poff)
  10306c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103070:	74 08                	je     10307a <dirlookup+0x7f>
        *poff = off;
  103072:	8b 45 10             	mov    0x10(%ebp),%eax
  103075:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103078:	89 10                	mov    %edx,(%eax)
      inum = de.inum;
  10307a:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  10307e:	0f b7 c0             	movzwl %ax,%eax
  103081:	89 45 f0             	mov    %eax,-0x10(%ebp)
      return iget(dp->dev, inum);
  103084:	8b 45 08             	mov    0x8(%ebp),%eax
  103087:	8b 00                	mov    (%eax),%eax
  103089:	83 ec 08             	sub    $0x8,%esp
  10308c:	ff 75 f0             	push   -0x10(%ebp)
  10308f:	50                   	push   %eax
  103090:	e8 02 f9 ff ff       	call   102997 <iget>
  103095:	83 c4 10             	add    $0x10,%esp
  103098:	eb 19                	jmp    1030b3 <dirlookup+0xb8>
      continue;
  10309a:	90                   	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
  10309b:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
  10309f:	8b 45 08             	mov    0x8(%ebp),%eax
  1030a2:	8b 40 18             	mov    0x18(%eax),%eax
  1030a5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1030a8:	0f 82 76 ff ff ff    	jb     103024 <dirlookup+0x29>
    }
  }

  return 0;
  1030ae:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1030b3:	c9                   	leave
  1030b4:	c3                   	ret

001030b5 <dirlink>:


// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
  1030b5:	55                   	push   %ebp
  1030b6:	89 e5                	mov    %esp,%ebp
  1030b8:	83 ec 28             	sub    $0x28,%esp
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
  1030bb:	83 ec 04             	sub    $0x4,%esp
  1030be:	6a 00                	push   $0x0
  1030c0:	ff 75 0c             	push   0xc(%ebp)
  1030c3:	ff 75 08             	push   0x8(%ebp)
  1030c6:	e8 30 ff ff ff       	call   102ffb <dirlookup>
  1030cb:	83 c4 10             	add    $0x10,%esp
  1030ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030d1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1030d5:	74 18                	je     1030ef <dirlink+0x3a>
    iput(ip);
  1030d7:	83 ec 0c             	sub    $0xc,%esp
  1030da:	ff 75 f0             	push   -0x10(%ebp)
  1030dd:	e8 88 f7 ff ff       	call   10286a <iput>
  1030e2:	83 c4 10             	add    $0x10,%esp
    return -1;
  1030e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1030ea:	e9 9c 00 00 00       	jmp    10318b <dirlink+0xd6>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
  1030ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1030f6:	eb 39                	jmp    103131 <dirlink+0x7c>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  1030f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030fb:	6a 10                	push   $0x10
  1030fd:	50                   	push   %eax
  1030fe:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103101:	50                   	push   %eax
  103102:	ff 75 08             	push   0x8(%ebp)
  103105:	e8 c1 fc ff ff       	call   102dcb <readi>
  10310a:	83 c4 10             	add    $0x10,%esp
  10310d:	83 f8 10             	cmp    $0x10,%eax
  103110:	74 0d                	je     10311f <dirlink+0x6a>
      panic("dirlink read");
  103112:	83 ec 0c             	sub    $0xc,%esp
  103115:	68 ee 41 10 00       	push   $0x1041ee
  10311a:	e8 8f d1 ff ff       	call   1002ae <panic>
    if(de.inum == 0)
  10311f:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  103123:	66 85 c0             	test   %ax,%ax
  103126:	74 18                	je     103140 <dirlink+0x8b>
  for(off = 0; off < dp->size; off += sizeof(de)){
  103128:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10312b:	83 c0 10             	add    $0x10,%eax
  10312e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103131:	8b 45 08             	mov    0x8(%ebp),%eax
  103134:	8b 40 18             	mov    0x18(%eax),%eax
  103137:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10313a:	39 c2                	cmp    %eax,%edx
  10313c:	72 ba                	jb     1030f8 <dirlink+0x43>
  10313e:	eb 01                	jmp    103141 <dirlink+0x8c>
      break;
  103140:	90                   	nop
  }

  strncpy(de.name, name, DIRSIZ);
  103141:	83 ec 04             	sub    $0x4,%esp
  103144:	6a 0e                	push   $0xe
  103146:	ff 75 0c             	push   0xc(%ebp)
  103149:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10314c:	83 c0 02             	add    $0x2,%eax
  10314f:	50                   	push   %eax
  103150:	e8 03 df ff ff       	call   101058 <strncpy>
  103155:	83 c4 10             	add    $0x10,%esp
  de.inum = inum;
  103158:	8b 45 10             	mov    0x10(%ebp),%eax
  10315b:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  10315f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103162:	6a 10                	push   $0x10
  103164:	50                   	push   %eax
  103165:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103168:	50                   	push   %eax
  103169:	ff 75 08             	push   0x8(%ebp)
  10316c:	e8 52 fd ff ff       	call   102ec3 <writei>
  103171:	83 c4 10             	add    $0x10,%esp
  103174:	83 f8 10             	cmp    $0x10,%eax
  103177:	74 0d                	je     103186 <dirlink+0xd1>
    panic("dirlink");
  103179:	83 ec 0c             	sub    $0xc,%esp
  10317c:	68 fb 41 10 00       	push   $0x1041fb
  103181:	e8 28 d1 ff ff       	call   1002ae <panic>

  return 0;
  103186:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10318b:	c9                   	leave
  10318c:	c3                   	ret

0010318d <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
  10318d:	55                   	push   %ebp
  10318e:	89 e5                	mov    %esp,%ebp
  103190:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int len;

  while(*path == '/')
  103193:	eb 04                	jmp    103199 <skipelem+0xc>
    path++;
  103195:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path == '/')
  103199:	8b 45 08             	mov    0x8(%ebp),%eax
  10319c:	0f b6 00             	movzbl (%eax),%eax
  10319f:	3c 2f                	cmp    $0x2f,%al
  1031a1:	74 f2                	je     103195 <skipelem+0x8>
  if(*path == 0)
  1031a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031a6:	0f b6 00             	movzbl (%eax),%eax
  1031a9:	84 c0                	test   %al,%al
  1031ab:	75 07                	jne    1031b4 <skipelem+0x27>
    return 0;
  1031ad:	b8 00 00 00 00       	mov    $0x0,%eax
  1031b2:	eb 77                	jmp    10322b <skipelem+0x9e>
  s = path;
  1031b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(*path != '/' && *path != 0)
  1031ba:	eb 04                	jmp    1031c0 <skipelem+0x33>
    path++;
  1031bc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path != '/' && *path != 0)
  1031c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c3:	0f b6 00             	movzbl (%eax),%eax
  1031c6:	3c 2f                	cmp    $0x2f,%al
  1031c8:	74 0a                	je     1031d4 <skipelem+0x47>
  1031ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1031cd:	0f b6 00             	movzbl (%eax),%eax
  1031d0:	84 c0                	test   %al,%al
  1031d2:	75 e8                	jne    1031bc <skipelem+0x2f>
  len = path - s;
  1031d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d7:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1031da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(len >= DIRSIZ)
  1031dd:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1031e1:	7e 15                	jle    1031f8 <skipelem+0x6b>
    memmove(name, s, DIRSIZ);
  1031e3:	83 ec 04             	sub    $0x4,%esp
  1031e6:	6a 0e                	push   $0xe
  1031e8:	ff 75 f4             	push   -0xc(%ebp)
  1031eb:	ff 75 0c             	push   0xc(%ebp)
  1031ee:	e8 79 dd ff ff       	call   100f6c <memmove>
  1031f3:	83 c4 10             	add    $0x10,%esp
  1031f6:	eb 26                	jmp    10321e <skipelem+0x91>
  else {
    memmove(name, s, len);
  1031f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031fb:	83 ec 04             	sub    $0x4,%esp
  1031fe:	50                   	push   %eax
  1031ff:	ff 75 f4             	push   -0xc(%ebp)
  103202:	ff 75 0c             	push   0xc(%ebp)
  103205:	e8 62 dd ff ff       	call   100f6c <memmove>
  10320a:	83 c4 10             	add    $0x10,%esp
    name[len] = 0;
  10320d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103210:	8b 45 0c             	mov    0xc(%ebp),%eax
  103213:	01 d0                	add    %edx,%eax
  103215:	c6 00 00             	movb   $0x0,(%eax)
  }
  while(*path == '/')
  103218:	eb 04                	jmp    10321e <skipelem+0x91>
    path++;
  10321a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path == '/')
  10321e:	8b 45 08             	mov    0x8(%ebp),%eax
  103221:	0f b6 00             	movzbl (%eax),%eax
  103224:	3c 2f                	cmp    $0x2f,%al
  103226:	74 f2                	je     10321a <skipelem+0x8d>
  return path;
  103228:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10322b:	c9                   	leave
  10322c:	c3                   	ret

0010322d <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
  10322d:	55                   	push   %ebp
  10322e:	89 e5                	mov    %esp,%ebp
  103230:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip, *next;

  ip = iget(ROOTDEV, ROOTINO);
  103233:	83 ec 08             	sub    $0x8,%esp
  103236:	6a 01                	push   $0x1
  103238:	6a 01                	push   $0x1
  10323a:	e8 58 f7 ff ff       	call   102997 <iget>
  10323f:	83 c4 10             	add    $0x10,%esp
  103242:	89 45 f4             	mov    %eax,-0xc(%ebp)

  while((path = skipelem(path, name)) != 0){
  103245:	e9 90 00 00 00       	jmp    1032da <namex+0xad>
    iread(ip);
  10324a:	83 ec 0c             	sub    $0xc,%esp
  10324d:	ff 75 f4             	push   -0xc(%ebp)
  103250:	e8 f1 f7 ff ff       	call   102a46 <iread>
  103255:	83 c4 10             	add    $0x10,%esp
    if(ip->type != T_DIR){
  103258:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10325b:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  10325f:	66 83 f8 01          	cmp    $0x1,%ax
  103263:	74 18                	je     10327d <namex+0x50>
      iput(ip);
  103265:	83 ec 0c             	sub    $0xc,%esp
  103268:	ff 75 f4             	push   -0xc(%ebp)
  10326b:	e8 fa f5 ff ff       	call   10286a <iput>
  103270:	83 c4 10             	add    $0x10,%esp
      return 0;
  103273:	b8 00 00 00 00       	mov    $0x0,%eax
  103278:	e9 99 00 00 00       	jmp    103316 <namex+0xe9>
    }
    if(nameiparent && *path == '\0'){
  10327d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103281:	74 12                	je     103295 <namex+0x68>
  103283:	8b 45 08             	mov    0x8(%ebp),%eax
  103286:	0f b6 00             	movzbl (%eax),%eax
  103289:	84 c0                	test   %al,%al
  10328b:	75 08                	jne    103295 <namex+0x68>
      // Stop one level early.
      return ip;
  10328d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103290:	e9 81 00 00 00       	jmp    103316 <namex+0xe9>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
  103295:	83 ec 04             	sub    $0x4,%esp
  103298:	6a 00                	push   $0x0
  10329a:	ff 75 10             	push   0x10(%ebp)
  10329d:	ff 75 f4             	push   -0xc(%ebp)
  1032a0:	e8 56 fd ff ff       	call   102ffb <dirlookup>
  1032a5:	83 c4 10             	add    $0x10,%esp
  1032a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1032af:	75 15                	jne    1032c6 <namex+0x99>
      iput(ip);
  1032b1:	83 ec 0c             	sub    $0xc,%esp
  1032b4:	ff 75 f4             	push   -0xc(%ebp)
  1032b7:	e8 ae f5 ff ff       	call   10286a <iput>
  1032bc:	83 c4 10             	add    $0x10,%esp
      return 0;
  1032bf:	b8 00 00 00 00       	mov    $0x0,%eax
  1032c4:	eb 50                	jmp    103316 <namex+0xe9>
    }
    iput(ip);
  1032c6:	83 ec 0c             	sub    $0xc,%esp
  1032c9:	ff 75 f4             	push   -0xc(%ebp)
  1032cc:	e8 99 f5 ff ff       	call   10286a <iput>
  1032d1:	83 c4 10             	add    $0x10,%esp
    ip = next;
  1032d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while((path = skipelem(path, name)) != 0){
  1032da:	83 ec 08             	sub    $0x8,%esp
  1032dd:	ff 75 10             	push   0x10(%ebp)
  1032e0:	ff 75 08             	push   0x8(%ebp)
  1032e3:	e8 a5 fe ff ff       	call   10318d <skipelem>
  1032e8:	83 c4 10             	add    $0x10,%esp
  1032eb:	89 45 08             	mov    %eax,0x8(%ebp)
  1032ee:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1032f2:	0f 85 52 ff ff ff    	jne    10324a <namex+0x1d>
  }
  if(nameiparent){
  1032f8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1032fc:	74 15                	je     103313 <namex+0xe6>
    iput(ip);
  1032fe:	83 ec 0c             	sub    $0xc,%esp
  103301:	ff 75 f4             	push   -0xc(%ebp)
  103304:	e8 61 f5 ff ff       	call   10286a <iput>
  103309:	83 c4 10             	add    $0x10,%esp
    return 0;
  10330c:	b8 00 00 00 00       	mov    $0x0,%eax
  103311:	eb 03                	jmp    103316 <namex+0xe9>
  }
  return ip;
  103313:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103316:	c9                   	leave
  103317:	c3                   	ret

00103318 <namei>:

struct inode*
namei(char *path)
{
  103318:	55                   	push   %ebp
  103319:	89 e5                	mov    %esp,%ebp
  10331b:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
  10331e:	83 ec 04             	sub    $0x4,%esp
  103321:	8d 45 ea             	lea    -0x16(%ebp),%eax
  103324:	50                   	push   %eax
  103325:	6a 00                	push   $0x0
  103327:	ff 75 08             	push   0x8(%ebp)
  10332a:	e8 fe fe ff ff       	call   10322d <namex>
  10332f:	83 c4 10             	add    $0x10,%esp
}
  103332:	c9                   	leave
  103333:	c3                   	ret

00103334 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
  103334:	55                   	push   %ebp
  103335:	89 e5                	mov    %esp,%ebp
  103337:	83 ec 08             	sub    $0x8,%esp
  return namex(path, 1, name);
  10333a:	83 ec 04             	sub    $0x4,%esp
  10333d:	ff 75 0c             	push   0xc(%ebp)
  103340:	6a 01                	push   $0x1
  103342:	ff 75 08             	push   0x8(%ebp)
  103345:	e8 e3 fe ff ff       	call   10322d <namex>
  10334a:	83 c4 10             	add    $0x10,%esp
}
  10334d:	c9                   	leave
  10334e:	c3                   	ret

0010334f <filealloc>:
} ftable;

// Allocate a file structure.
struct file*
filealloc(void)
{
  10334f:	55                   	push   %ebp
  103350:	89 e5                	mov    %esp,%ebp
  103352:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  for(f = ftable.file; f < ftable.file + NFILE; f++){
  103355:	c7 45 fc 40 ae 10 00 	movl   $0x10ae40,-0x4(%ebp)
  10335c:	eb 1d                	jmp    10337b <filealloc+0x2c>
    if(f->ref == 0){
  10335e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103361:	8b 40 04             	mov    0x4(%eax),%eax
  103364:	85 c0                	test   %eax,%eax
  103366:	75 0f                	jne    103377 <filealloc+0x28>
      f->ref = 1;
  103368:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10336b:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
      return f;
  103372:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103375:	eb 13                	jmp    10338a <filealloc+0x3b>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
  103377:	83 45 fc 14          	addl   $0x14,-0x4(%ebp)
  10337b:	b8 10 b6 10 00       	mov    $0x10b610,%eax
  103380:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  103383:	72 d9                	jb     10335e <filealloc+0xf>
    }
  }
  return 0;
  103385:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10338a:	c9                   	leave
  10338b:	c3                   	ret

0010338c <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
  10338c:	55                   	push   %ebp
  10338d:	89 e5                	mov    %esp,%ebp
  10338f:	83 ec 08             	sub    $0x8,%esp
  if(f->ref < 1)
  103392:	8b 45 08             	mov    0x8(%ebp),%eax
  103395:	8b 40 04             	mov    0x4(%eax),%eax
  103398:	85 c0                	test   %eax,%eax
  10339a:	7f 0d                	jg     1033a9 <filedup+0x1d>
    panic("filedup");
  10339c:	83 ec 0c             	sub    $0xc,%esp
  10339f:	68 03 42 10 00       	push   $0x104203
  1033a4:	e8 05 cf ff ff       	call   1002ae <panic>
  f->ref++;
  1033a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ac:	8b 40 04             	mov    0x4(%eax),%eax
  1033af:	8d 50 01             	lea    0x1(%eax),%edx
  1033b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1033b5:	89 50 04             	mov    %edx,0x4(%eax)
  return f;
  1033b8:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1033bb:	c9                   	leave
  1033bc:	c3                   	ret

001033bd <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
  1033bd:	55                   	push   %ebp
  1033be:	89 e5                	mov    %esp,%ebp
  1033c0:	83 ec 28             	sub    $0x28,%esp
  struct file ff;

  if(f->ref < 1)
  1033c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1033c6:	8b 40 04             	mov    0x4(%eax),%eax
  1033c9:	85 c0                	test   %eax,%eax
  1033cb:	7f 0d                	jg     1033da <fileclose+0x1d>
    panic("fileclose");
  1033cd:	83 ec 0c             	sub    $0xc,%esp
  1033d0:	68 0b 42 10 00       	push   $0x10420b
  1033d5:	e8 d4 ce ff ff       	call   1002ae <panic>
  if(--f->ref > 0){
  1033da:	8b 45 08             	mov    0x8(%ebp),%eax
  1033dd:	8b 40 04             	mov    0x4(%eax),%eax
  1033e0:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1033e6:	89 50 04             	mov    %edx,0x4(%eax)
  1033e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ec:	8b 40 04             	mov    0x4(%eax),%eax
  1033ef:	85 c0                	test   %eax,%eax
  1033f1:	7f 56                	jg     103449 <fileclose+0x8c>
    return;
  }
  ff = *f;
  1033f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1033f6:	8b 10                	mov    (%eax),%edx
  1033f8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1033fb:	8b 50 04             	mov    0x4(%eax),%edx
  1033fe:	89 55 e8             	mov    %edx,-0x18(%ebp)
  103401:	8b 50 08             	mov    0x8(%eax),%edx
  103404:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103407:	8b 50 0c             	mov    0xc(%eax),%edx
  10340a:	89 55 f0             	mov    %edx,-0x10(%ebp)
  10340d:	8b 40 10             	mov    0x10(%eax),%eax
  103410:	89 45 f4             	mov    %eax,-0xc(%ebp)
  f->ref = 0;
  103413:	8b 45 08             	mov    0x8(%ebp),%eax
  103416:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  f->type = FD_NONE;
  10341d:	8b 45 08             	mov    0x8(%ebp),%eax
  103420:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(ff.type == FD_INODE){
  103426:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103429:	83 f8 01             	cmp    $0x1,%eax
  10342c:	75 1c                	jne    10344a <fileclose+0x8d>
    begin_op();
  10342e:	e8 57 09 00 00       	call   103d8a <begin_op>
    iput(ff.ip);
  103433:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103436:	83 ec 0c             	sub    $0xc,%esp
  103439:	50                   	push   %eax
  10343a:	e8 2b f4 ff ff       	call   10286a <iput>
  10343f:	83 c4 10             	add    $0x10,%esp
    end_op();
  103442:	e8 49 09 00 00       	call   103d90 <end_op>
  103447:	eb 01                	jmp    10344a <fileclose+0x8d>
    return;
  103449:	90                   	nop
  }
}
  10344a:	c9                   	leave
  10344b:	c3                   	ret

0010344c <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
  10344c:	55                   	push   %ebp
  10344d:	89 e5                	mov    %esp,%ebp
  10344f:	83 ec 08             	sub    $0x8,%esp
  if(f->type == FD_INODE){
  103452:	8b 45 08             	mov    0x8(%ebp),%eax
  103455:	8b 00                	mov    (%eax),%eax
  103457:	83 f8 01             	cmp    $0x1,%eax
  10345a:	75 2e                	jne    10348a <filestat+0x3e>
    iread(f->ip);
  10345c:	8b 45 08             	mov    0x8(%ebp),%eax
  10345f:	8b 40 0c             	mov    0xc(%eax),%eax
  103462:	83 ec 0c             	sub    $0xc,%esp
  103465:	50                   	push   %eax
  103466:	e8 db f5 ff ff       	call   102a46 <iread>
  10346b:	83 c4 10             	add    $0x10,%esp
    stati(f->ip, st);
  10346e:	8b 45 08             	mov    0x8(%ebp),%eax
  103471:	8b 40 0c             	mov    0xc(%eax),%eax
  103474:	83 ec 08             	sub    $0x8,%esp
  103477:	ff 75 0c             	push   0xc(%ebp)
  10347a:	50                   	push   %eax
  10347b:	e8 05 f9 ff ff       	call   102d85 <stati>
  103480:	83 c4 10             	add    $0x10,%esp
    return 0;
  103483:	b8 00 00 00 00       	mov    $0x0,%eax
  103488:	eb 05                	jmp    10348f <filestat+0x43>
  }
  return -1;
  10348a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  10348f:	c9                   	leave
  103490:	c3                   	ret

00103491 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
  103491:	55                   	push   %ebp
  103492:	89 e5                	mov    %esp,%ebp
  103494:	83 ec 18             	sub    $0x18,%esp
  int r;

  if(f->readable == 0)
  103497:	8b 45 08             	mov    0x8(%ebp),%eax
  10349a:	0f b6 40 08          	movzbl 0x8(%eax),%eax
  10349e:	84 c0                	test   %al,%al
  1034a0:	75 07                	jne    1034a9 <fileread+0x18>
    return -1;
  1034a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1034a7:	eb 65                	jmp    10350e <fileread+0x7d>
  if(f->type == FD_INODE){
  1034a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ac:	8b 00                	mov    (%eax),%eax
  1034ae:	83 f8 01             	cmp    $0x1,%eax
  1034b1:	75 4e                	jne    103501 <fileread+0x70>
    iread(f->ip);
  1034b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b6:	8b 40 0c             	mov    0xc(%eax),%eax
  1034b9:	83 ec 0c             	sub    $0xc,%esp
  1034bc:	50                   	push   %eax
  1034bd:	e8 84 f5 ff ff       	call   102a46 <iread>
  1034c2:	83 c4 10             	add    $0x10,%esp
    if((r = readi(f->ip, addr, f->off, n)) > 0)
  1034c5:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1034c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1034cb:	8b 50 10             	mov    0x10(%eax),%edx
  1034ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1034d1:	8b 40 0c             	mov    0xc(%eax),%eax
  1034d4:	51                   	push   %ecx
  1034d5:	52                   	push   %edx
  1034d6:	ff 75 0c             	push   0xc(%ebp)
  1034d9:	50                   	push   %eax
  1034da:	e8 ec f8 ff ff       	call   102dcb <readi>
  1034df:	83 c4 10             	add    $0x10,%esp
  1034e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1034e5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1034e9:	7e 11                	jle    1034fc <fileread+0x6b>
      f->off += r;
  1034eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ee:	8b 50 10             	mov    0x10(%eax),%edx
  1034f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1034f4:	01 c2                	add    %eax,%edx
  1034f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1034f9:	89 50 10             	mov    %edx,0x10(%eax)
    return r;
  1034fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1034ff:	eb 0d                	jmp    10350e <fileread+0x7d>
  }
  panic("fileread");
  103501:	83 ec 0c             	sub    $0xc,%esp
  103504:	68 15 42 10 00       	push   $0x104215
  103509:	e8 a0 cd ff ff       	call   1002ae <panic>
}
  10350e:	c9                   	leave
  10350f:	c3                   	ret

00103510 <filewrite>:

// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
  103510:	55                   	push   %ebp
  103511:	89 e5                	mov    %esp,%ebp
  103513:	53                   	push   %ebx
  103514:	83 ec 14             	sub    $0x14,%esp
  int r;

  if(f->writable == 0)
  103517:	8b 45 08             	mov    0x8(%ebp),%eax
  10351a:	0f b6 40 09          	movzbl 0x9(%eax),%eax
  10351e:	84 c0                	test   %al,%al
  103520:	75 0a                	jne    10352c <filewrite+0x1c>
    return -1;
  103522:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103527:	e9 e2 00 00 00       	jmp    10360e <filewrite+0xfe>
  if(f->type == FD_INODE){
  10352c:	8b 45 08             	mov    0x8(%ebp),%eax
  10352f:	8b 00                	mov    (%eax),%eax
  103531:	83 f8 01             	cmp    $0x1,%eax
  103534:	0f 85 c7 00 00 00    	jne    103601 <filewrite+0xf1>
    // write a few blocks at a time
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
  10353a:	c7 45 ec 00 06 00 00 	movl   $0x600,-0x14(%ebp)
    int i = 0;
  103541:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while(i < n){
  103548:	e9 91 00 00 00       	jmp    1035de <filewrite+0xce>
      int n1 = n - i;
  10354d:	8b 45 10             	mov    0x10(%ebp),%eax
  103550:	2b 45 f4             	sub    -0xc(%ebp),%eax
  103553:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if(n1 > max)
  103556:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103559:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10355c:	7e 06                	jle    103564 <filewrite+0x54>
        n1 = max;
  10355e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103561:	89 45 f0             	mov    %eax,-0x10(%ebp)

			begin_op();
  103564:	e8 21 08 00 00       	call   103d8a <begin_op>
      iread(f->ip);
  103569:	8b 45 08             	mov    0x8(%ebp),%eax
  10356c:	8b 40 0c             	mov    0xc(%eax),%eax
  10356f:	83 ec 0c             	sub    $0xc,%esp
  103572:	50                   	push   %eax
  103573:	e8 ce f4 ff ff       	call   102a46 <iread>
  103578:	83 c4 10             	add    $0x10,%esp
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
  10357b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  10357e:	8b 45 08             	mov    0x8(%ebp),%eax
  103581:	8b 50 10             	mov    0x10(%eax),%edx
  103584:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  103587:	8b 45 0c             	mov    0xc(%ebp),%eax
  10358a:	01 c3                	add    %eax,%ebx
  10358c:	8b 45 08             	mov    0x8(%ebp),%eax
  10358f:	8b 40 0c             	mov    0xc(%eax),%eax
  103592:	51                   	push   %ecx
  103593:	52                   	push   %edx
  103594:	53                   	push   %ebx
  103595:	50                   	push   %eax
  103596:	e8 28 f9 ff ff       	call   102ec3 <writei>
  10359b:	83 c4 10             	add    $0x10,%esp
  10359e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1035a1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1035a5:	7e 11                	jle    1035b8 <filewrite+0xa8>
        f->off += r;
  1035a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1035aa:	8b 50 10             	mov    0x10(%eax),%edx
  1035ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1035b0:	01 c2                	add    %eax,%edx
  1035b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1035b5:	89 50 10             	mov    %edx,0x10(%eax)
      end_op();
  1035b8:	e8 d3 07 00 00       	call   103d90 <end_op>

      if(r < 0)
  1035bd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1035c1:	78 29                	js     1035ec <filewrite+0xdc>
        break;
      if(r != n1)
  1035c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1035c6:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  1035c9:	74 0d                	je     1035d8 <filewrite+0xc8>
        panic("short filewrite");
  1035cb:	83 ec 0c             	sub    $0xc,%esp
  1035ce:	68 1e 42 10 00       	push   $0x10421e
  1035d3:	e8 d6 cc ff ff       	call   1002ae <panic>
      i += r;
  1035d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1035db:	01 45 f4             	add    %eax,-0xc(%ebp)
    while(i < n){
  1035de:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1035e1:	3b 45 10             	cmp    0x10(%ebp),%eax
  1035e4:	0f 8c 63 ff ff ff    	jl     10354d <filewrite+0x3d>
  1035ea:	eb 01                	jmp    1035ed <filewrite+0xdd>
        break;
  1035ec:	90                   	nop
    }
    return i == n ? n : -1;
  1035ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1035f0:	3b 45 10             	cmp    0x10(%ebp),%eax
  1035f3:	75 05                	jne    1035fa <filewrite+0xea>
  1035f5:	8b 45 10             	mov    0x10(%ebp),%eax
  1035f8:	eb 14                	jmp    10360e <filewrite+0xfe>
  1035fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1035ff:	eb 0d                	jmp    10360e <filewrite+0xfe>
  }
  panic("filewrite");
  103601:	83 ec 0c             	sub    $0xc,%esp
  103604:	68 2e 42 10 00       	push   $0x10422e
  103609:	e8 a0 cc ff ff       	call   1002ae <panic>
}
  10360e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103611:	c9                   	leave
  103612:	c3                   	ret

00103613 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
int
isdirempty(struct inode *dp)
{
  103613:	55                   	push   %ebp
  103614:	89 e5                	mov    %esp,%ebp
  103616:	83 ec 28             	sub    $0x28,%esp
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
  103619:	c7 45 f4 20 00 00 00 	movl   $0x20,-0xc(%ebp)
  103620:	eb 40                	jmp    103662 <isdirempty+0x4f>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  103622:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103625:	6a 10                	push   $0x10
  103627:	50                   	push   %eax
  103628:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  10362b:	50                   	push   %eax
  10362c:	ff 75 08             	push   0x8(%ebp)
  10362f:	e8 97 f7 ff ff       	call   102dcb <readi>
  103634:	83 c4 10             	add    $0x10,%esp
  103637:	83 f8 10             	cmp    $0x10,%eax
  10363a:	74 0d                	je     103649 <isdirempty+0x36>
      panic("isdirempty: readi");
  10363c:	83 ec 0c             	sub    $0xc,%esp
  10363f:	68 38 42 10 00       	push   $0x104238
  103644:	e8 65 cc ff ff       	call   1002ae <panic>
    if(de.inum != 0)
  103649:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  10364d:	66 85 c0             	test   %ax,%ax
  103650:	74 07                	je     103659 <isdirempty+0x46>
      return 0;
  103652:	b8 00 00 00 00       	mov    $0x0,%eax
  103657:	eb 1b                	jmp    103674 <isdirempty+0x61>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
  103659:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10365c:	83 c0 10             	add    $0x10,%eax
  10365f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103662:	8b 45 08             	mov    0x8(%ebp),%eax
  103665:	8b 40 18             	mov    0x18(%eax),%eax
  103668:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10366b:	39 c2                	cmp    %eax,%edx
  10366d:	72 b3                	jb     103622 <isdirempty+0xf>
  }
  return 1;
  10366f:	b8 01 00 00 00       	mov    $0x1,%eax
}
  103674:	c9                   	leave
  103675:	c3                   	ret

00103676 <unlink>:

int
unlink(char* path, char* name)
{
  103676:	55                   	push   %ebp
  103677:	89 e5                	mov    %esp,%ebp
  103679:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip, *dp;
  struct dirent de;
  uint off;

	begin_op();
  10367c:	e8 09 07 00 00       	call   103d8a <begin_op>
  if((dp = nameiparent(path, name)) == 0){
  103681:	83 ec 08             	sub    $0x8,%esp
  103684:	ff 75 0c             	push   0xc(%ebp)
  103687:	ff 75 08             	push   0x8(%ebp)
  10368a:	e8 a5 fc ff ff       	call   103334 <nameiparent>
  10368f:	83 c4 10             	add    $0x10,%esp
  103692:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103695:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103699:	75 0f                	jne    1036aa <unlink+0x34>
    end_op();
  10369b:	e8 f0 06 00 00       	call   103d90 <end_op>
    return -1;
  1036a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1036a5:	e9 8c 01 00 00       	jmp    103836 <unlink+0x1c0>
  }

  iread(dp);
  1036aa:	83 ec 0c             	sub    $0xc,%esp
  1036ad:	ff 75 f4             	push   -0xc(%ebp)
  1036b0:	e8 91 f3 ff ff       	call   102a46 <iread>
  1036b5:	83 c4 10             	add    $0x10,%esp

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
  1036b8:	83 ec 08             	sub    $0x8,%esp
  1036bb:	68 4a 42 10 00       	push   $0x10424a
  1036c0:	ff 75 0c             	push   0xc(%ebp)
  1036c3:	e8 18 f9 ff ff       	call   102fe0 <namecmp>
  1036c8:	83 c4 10             	add    $0x10,%esp
  1036cb:	85 c0                	test   %eax,%eax
  1036cd:	0f 84 47 01 00 00    	je     10381a <unlink+0x1a4>
  1036d3:	83 ec 08             	sub    $0x8,%esp
  1036d6:	68 4c 42 10 00       	push   $0x10424c
  1036db:	ff 75 0c             	push   0xc(%ebp)
  1036de:	e8 fd f8 ff ff       	call   102fe0 <namecmp>
  1036e3:	83 c4 10             	add    $0x10,%esp
  1036e6:	85 c0                	test   %eax,%eax
  1036e8:	0f 84 2c 01 00 00    	je     10381a <unlink+0x1a4>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
  1036ee:	83 ec 04             	sub    $0x4,%esp
  1036f1:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1036f4:	50                   	push   %eax
  1036f5:	ff 75 0c             	push   0xc(%ebp)
  1036f8:	ff 75 f4             	push   -0xc(%ebp)
  1036fb:	e8 fb f8 ff ff       	call   102ffb <dirlookup>
  103700:	83 c4 10             	add    $0x10,%esp
  103703:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103706:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10370a:	0f 84 0d 01 00 00    	je     10381d <unlink+0x1a7>
    goto bad;
  iread(ip);
  103710:	83 ec 0c             	sub    $0xc,%esp
  103713:	ff 75 f0             	push   -0x10(%ebp)
  103716:	e8 2b f3 ff ff       	call   102a46 <iread>
  10371b:	83 c4 10             	add    $0x10,%esp

  if(ip->nlink < 1)
  10371e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103721:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  103725:	66 85 c0             	test   %ax,%ax
  103728:	7f 0d                	jg     103737 <unlink+0xc1>
    panic("unlink: nlink < 1");
  10372a:	83 ec 0c             	sub    $0xc,%esp
  10372d:	68 4f 42 10 00       	push   $0x10424f
  103732:	e8 77 cb ff ff       	call   1002ae <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
  103737:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10373a:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  10373e:	66 83 f8 01          	cmp    $0x1,%ax
  103742:	75 25                	jne    103769 <unlink+0xf3>
  103744:	83 ec 0c             	sub    $0xc,%esp
  103747:	ff 75 f0             	push   -0x10(%ebp)
  10374a:	e8 c4 fe ff ff       	call   103613 <isdirempty>
  10374f:	83 c4 10             	add    $0x10,%esp
  103752:	85 c0                	test   %eax,%eax
  103754:	75 13                	jne    103769 <unlink+0xf3>
    iput(ip);
  103756:	83 ec 0c             	sub    $0xc,%esp
  103759:	ff 75 f0             	push   -0x10(%ebp)
  10375c:	e8 09 f1 ff ff       	call   10286a <iput>
  103761:	83 c4 10             	add    $0x10,%esp
    goto bad;
  103764:	e9 b5 00 00 00       	jmp    10381e <unlink+0x1a8>
  }

  memset(&de, 0, sizeof(de));
  103769:	83 ec 04             	sub    $0x4,%esp
  10376c:	6a 10                	push   $0x10
  10376e:	6a 00                	push   $0x0
  103770:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103773:	50                   	push   %eax
  103774:	e8 34 d7 ff ff       	call   100ead <memset>
  103779:	83 c4 10             	add    $0x10,%esp
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  10377c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10377f:	6a 10                	push   $0x10
  103781:	50                   	push   %eax
  103782:	8d 45 e0             	lea    -0x20(%ebp),%eax
  103785:	50                   	push   %eax
  103786:	ff 75 f4             	push   -0xc(%ebp)
  103789:	e8 35 f7 ff ff       	call   102ec3 <writei>
  10378e:	83 c4 10             	add    $0x10,%esp
  103791:	83 f8 10             	cmp    $0x10,%eax
  103794:	74 0d                	je     1037a3 <unlink+0x12d>
    panic("unlink: writei");
  103796:	83 ec 0c             	sub    $0xc,%esp
  103799:	68 61 42 10 00       	push   $0x104261
  10379e:	e8 0b cb ff ff       	call   1002ae <panic>
  if(ip->type == T_DIR){
  1037a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1037a6:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  1037aa:	66 83 f8 01          	cmp    $0x1,%ax
  1037ae:	75 21                	jne    1037d1 <unlink+0x15b>
    dp->nlink--;
  1037b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1037b3:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  1037b7:	83 e8 01             	sub    $0x1,%eax
  1037ba:	89 c2                	mov    %eax,%edx
  1037bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1037bf:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
  1037c3:	83 ec 0c             	sub    $0xc,%esp
  1037c6:	ff 75 f4             	push   -0xc(%ebp)
  1037c9:	e8 08 f1 ff ff       	call   1028d6 <iupdate>
  1037ce:	83 c4 10             	add    $0x10,%esp
  }
  iput(dp);
  1037d1:	83 ec 0c             	sub    $0xc,%esp
  1037d4:	ff 75 f4             	push   -0xc(%ebp)
  1037d7:	e8 8e f0 ff ff       	call   10286a <iput>
  1037dc:	83 c4 10             	add    $0x10,%esp

  ip->nlink--;
  1037df:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1037e2:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  1037e6:	83 e8 01             	sub    $0x1,%eax
  1037e9:	89 c2                	mov    %eax,%edx
  1037eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1037ee:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
  1037f2:	83 ec 0c             	sub    $0xc,%esp
  1037f5:	ff 75 f0             	push   -0x10(%ebp)
  1037f8:	e8 d9 f0 ff ff       	call   1028d6 <iupdate>
  1037fd:	83 c4 10             	add    $0x10,%esp
  iput(ip);
  103800:	83 ec 0c             	sub    $0xc,%esp
  103803:	ff 75 f0             	push   -0x10(%ebp)
  103806:	e8 5f f0 ff ff       	call   10286a <iput>
  10380b:	83 c4 10             	add    $0x10,%esp

  end_op();
  10380e:	e8 7d 05 00 00       	call   103d90 <end_op>
  return 0;
  103813:	b8 00 00 00 00       	mov    $0x0,%eax
  103818:	eb 1c                	jmp    103836 <unlink+0x1c0>
    goto bad;
  10381a:	90                   	nop
  10381b:	eb 01                	jmp    10381e <unlink+0x1a8>
    goto bad;
  10381d:	90                   	nop

bad:
  iput(dp);
  10381e:	83 ec 0c             	sub    $0xc,%esp
  103821:	ff 75 f4             	push   -0xc(%ebp)
  103824:	e8 41 f0 ff ff       	call   10286a <iput>
  103829:	83 c4 10             	add    $0x10,%esp
  end_op();
  10382c:	e8 5f 05 00 00       	call   103d90 <end_op>
  return -1;
  103831:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  103836:	c9                   	leave
  103837:	c3                   	ret

00103838 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
  103838:	55                   	push   %ebp
  103839:	89 e5                	mov    %esp,%ebp
  10383b:	83 ec 38             	sub    $0x38,%esp
  10383e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  103841:	8b 55 10             	mov    0x10(%ebp),%edx
  103844:	8b 45 14             	mov    0x14(%ebp),%eax
  103847:	66 89 4d d4          	mov    %cx,-0x2c(%ebp)
  10384b:	66 89 55 d0          	mov    %dx,-0x30(%ebp)
  10384f:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
  103853:	83 ec 08             	sub    $0x8,%esp
  103856:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  103859:	50                   	push   %eax
  10385a:	ff 75 08             	push   0x8(%ebp)
  10385d:	e8 d2 fa ff ff       	call   103334 <nameiparent>
  103862:	83 c4 10             	add    $0x10,%esp
  103865:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103868:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10386c:	75 0a                	jne    103878 <create+0x40>
    return 0;
  10386e:	b8 00 00 00 00       	mov    $0x0,%eax
  103873:	e9 8e 01 00 00       	jmp    103a06 <create+0x1ce>
  iread(dp);
  103878:	83 ec 0c             	sub    $0xc,%esp
  10387b:	ff 75 f4             	push   -0xc(%ebp)
  10387e:	e8 c3 f1 ff ff       	call   102a46 <iread>
  103883:	83 c4 10             	add    $0x10,%esp

  if((ip = dirlookup(dp, name, 0)) != 0){
  103886:	83 ec 04             	sub    $0x4,%esp
  103889:	6a 00                	push   $0x0
  10388b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  10388e:	50                   	push   %eax
  10388f:	ff 75 f4             	push   -0xc(%ebp)
  103892:	e8 64 f7 ff ff       	call   102ffb <dirlookup>
  103897:	83 c4 10             	add    $0x10,%esp
  10389a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10389d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1038a1:	74 50                	je     1038f3 <create+0xbb>
    iput(dp);
  1038a3:	83 ec 0c             	sub    $0xc,%esp
  1038a6:	ff 75 f4             	push   -0xc(%ebp)
  1038a9:	e8 bc ef ff ff       	call   10286a <iput>
  1038ae:	83 c4 10             	add    $0x10,%esp
    iread(ip);
  1038b1:	83 ec 0c             	sub    $0xc,%esp
  1038b4:	ff 75 f0             	push   -0x10(%ebp)
  1038b7:	e8 8a f1 ff ff       	call   102a46 <iread>
  1038bc:	83 c4 10             	add    $0x10,%esp
    if(type == T_FILE && ip->type == T_FILE)
  1038bf:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
  1038c4:	75 15                	jne    1038db <create+0xa3>
  1038c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1038c9:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  1038cd:	66 83 f8 02          	cmp    $0x2,%ax
  1038d1:	75 08                	jne    1038db <create+0xa3>
      return ip;
  1038d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1038d6:	e9 2b 01 00 00       	jmp    103a06 <create+0x1ce>
    iput(ip);
  1038db:	83 ec 0c             	sub    $0xc,%esp
  1038de:	ff 75 f0             	push   -0x10(%ebp)
  1038e1:	e8 84 ef ff ff       	call   10286a <iput>
  1038e6:	83 c4 10             	add    $0x10,%esp
    return 0;
  1038e9:	b8 00 00 00 00       	mov    $0x0,%eax
  1038ee:	e9 13 01 00 00       	jmp    103a06 <create+0x1ce>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
  1038f3:	0f bf 55 d4          	movswl -0x2c(%ebp),%edx
  1038f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1038fa:	8b 00                	mov    (%eax),%eax
  1038fc:	83 ec 08             	sub    $0x8,%esp
  1038ff:	52                   	push   %edx
  103900:	50                   	push   %eax
  103901:	e8 8e ee ff ff       	call   102794 <ialloc>
  103906:	83 c4 10             	add    $0x10,%esp
  103909:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10390c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103910:	75 0d                	jne    10391f <create+0xe7>
    panic("create: ialloc");
  103912:	83 ec 0c             	sub    $0xc,%esp
  103915:	68 70 42 10 00       	push   $0x104270
  10391a:	e8 8f c9 ff ff       	call   1002ae <panic>

  iread(ip);
  10391f:	83 ec 0c             	sub    $0xc,%esp
  103922:	ff 75 f0             	push   -0x10(%ebp)
  103925:	e8 1c f1 ff ff       	call   102a46 <iread>
  10392a:	83 c4 10             	add    $0x10,%esp
  ip->major = major;
  10392d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103930:	0f b7 55 d0          	movzwl -0x30(%ebp),%edx
  103934:	66 89 50 12          	mov    %dx,0x12(%eax)
  ip->minor = minor;
  103938:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10393b:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
  10393f:	66 89 50 14          	mov    %dx,0x14(%eax)
  ip->nlink = 1;
  103943:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103946:	66 c7 40 16 01 00    	movw   $0x1,0x16(%eax)
  iupdate(ip);
  10394c:	83 ec 0c             	sub    $0xc,%esp
  10394f:	ff 75 f0             	push   -0x10(%ebp)
  103952:	e8 7f ef ff ff       	call   1028d6 <iupdate>
  103957:	83 c4 10             	add    $0x10,%esp

  if(type == T_DIR){  // Create . and .. entries.
  10395a:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
  10395f:	75 6a                	jne    1039cb <create+0x193>
    dp->nlink++;  // for ".."
  103961:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103964:	0f b7 40 16          	movzwl 0x16(%eax),%eax
  103968:	83 c0 01             	add    $0x1,%eax
  10396b:	89 c2                	mov    %eax,%edx
  10396d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103970:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
  103974:	83 ec 0c             	sub    $0xc,%esp
  103977:	ff 75 f4             	push   -0xc(%ebp)
  10397a:	e8 57 ef ff ff       	call   1028d6 <iupdate>
  10397f:	83 c4 10             	add    $0x10,%esp
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
  103982:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103985:	8b 40 04             	mov    0x4(%eax),%eax
  103988:	83 ec 04             	sub    $0x4,%esp
  10398b:	50                   	push   %eax
  10398c:	68 4a 42 10 00       	push   $0x10424a
  103991:	ff 75 f0             	push   -0x10(%ebp)
  103994:	e8 1c f7 ff ff       	call   1030b5 <dirlink>
  103999:	83 c4 10             	add    $0x10,%esp
  10399c:	85 c0                	test   %eax,%eax
  10399e:	78 1e                	js     1039be <create+0x186>
  1039a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1039a3:	8b 40 04             	mov    0x4(%eax),%eax
  1039a6:	83 ec 04             	sub    $0x4,%esp
  1039a9:	50                   	push   %eax
  1039aa:	68 4c 42 10 00       	push   $0x10424c
  1039af:	ff 75 f0             	push   -0x10(%ebp)
  1039b2:	e8 fe f6 ff ff       	call   1030b5 <dirlink>
  1039b7:	83 c4 10             	add    $0x10,%esp
  1039ba:	85 c0                	test   %eax,%eax
  1039bc:	79 0d                	jns    1039cb <create+0x193>
      panic("create dots");
  1039be:	83 ec 0c             	sub    $0xc,%esp
  1039c1:	68 7f 42 10 00       	push   $0x10427f
  1039c6:	e8 e3 c8 ff ff       	call   1002ae <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
  1039cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1039ce:	8b 40 04             	mov    0x4(%eax),%eax
  1039d1:	83 ec 04             	sub    $0x4,%esp
  1039d4:	50                   	push   %eax
  1039d5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
  1039d8:	50                   	push   %eax
  1039d9:	ff 75 f4             	push   -0xc(%ebp)
  1039dc:	e8 d4 f6 ff ff       	call   1030b5 <dirlink>
  1039e1:	83 c4 10             	add    $0x10,%esp
  1039e4:	85 c0                	test   %eax,%eax
  1039e6:	79 0d                	jns    1039f5 <create+0x1bd>
    panic("create: dirlink");
  1039e8:	83 ec 0c             	sub    $0xc,%esp
  1039eb:	68 8b 42 10 00       	push   $0x10428b
  1039f0:	e8 b9 c8 ff ff       	call   1002ae <panic>

  iput(dp);
  1039f5:	83 ec 0c             	sub    $0xc,%esp
  1039f8:	ff 75 f4             	push   -0xc(%ebp)
  1039fb:	e8 6a ee ff ff       	call   10286a <iput>
  103a00:	83 c4 10             	add    $0x10,%esp

  return ip;
  103a03:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  103a06:	c9                   	leave
  103a07:	c3                   	ret

00103a08 <open>:


struct file*
open(char* path, int omode)
{
  103a08:	55                   	push   %ebp
  103a09:	89 e5                	mov    %esp,%ebp
  103a0b:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;

  begin_op();
  103a0e:	e8 77 03 00 00       	call   103d8a <begin_op>

  if(omode & O_CREATE){
  103a13:	8b 45 0c             	mov    0xc(%ebp),%eax
  103a16:	25 00 02 00 00       	and    $0x200,%eax
  103a1b:	85 c0                	test   %eax,%eax
  103a1d:	74 29                	je     103a48 <open+0x40>
    ip = create(path, T_FILE, 0, 0);
  103a1f:	6a 00                	push   $0x0
  103a21:	6a 00                	push   $0x0
  103a23:	6a 02                	push   $0x2
  103a25:	ff 75 08             	push   0x8(%ebp)
  103a28:	e8 0b fe ff ff       	call   103838 <create>
  103a2d:	83 c4 10             	add    $0x10,%esp
  103a30:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ip == 0){
  103a33:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103a37:	75 73                	jne    103aac <open+0xa4>
      end_op();
  103a39:	e8 52 03 00 00       	call   103d90 <end_op>
      return 0;
  103a3e:	b8 00 00 00 00       	mov    $0x0,%eax
  103a43:	e9 eb 00 00 00       	jmp    103b33 <open+0x12b>
    }
  } else {
    if((ip = namei(path)) == 0){
  103a48:	83 ec 0c             	sub    $0xc,%esp
  103a4b:	ff 75 08             	push   0x8(%ebp)
  103a4e:	e8 c5 f8 ff ff       	call   103318 <namei>
  103a53:	83 c4 10             	add    $0x10,%esp
  103a56:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103a59:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103a5d:	75 0f                	jne    103a6e <open+0x66>
      end_op();
  103a5f:	e8 2c 03 00 00       	call   103d90 <end_op>
      return 0;
  103a64:	b8 00 00 00 00       	mov    $0x0,%eax
  103a69:	e9 c5 00 00 00       	jmp    103b33 <open+0x12b>
    }
    iread(ip);
  103a6e:	83 ec 0c             	sub    $0xc,%esp
  103a71:	ff 75 f4             	push   -0xc(%ebp)
  103a74:	e8 cd ef ff ff       	call   102a46 <iread>
  103a79:	83 c4 10             	add    $0x10,%esp
    if(ip->type == T_DIR && omode != O_RDONLY){
  103a7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103a7f:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  103a83:	66 83 f8 01          	cmp    $0x1,%ax
  103a87:	75 23                	jne    103aac <open+0xa4>
  103a89:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103a8d:	74 1d                	je     103aac <open+0xa4>
      iput(ip);
  103a8f:	83 ec 0c             	sub    $0xc,%esp
  103a92:	ff 75 f4             	push   -0xc(%ebp)
  103a95:	e8 d0 ed ff ff       	call   10286a <iput>
  103a9a:	83 c4 10             	add    $0x10,%esp
      end_op();
  103a9d:	e8 ee 02 00 00       	call   103d90 <end_op>
      return 0;
  103aa2:	b8 00 00 00 00       	mov    $0x0,%eax
  103aa7:	e9 87 00 00 00       	jmp    103b33 <open+0x12b>
    }
  }

  struct file* f;
  if((f = filealloc()) == 0) { 
  103aac:	e8 9e f8 ff ff       	call   10334f <filealloc>
  103ab1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103ab4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103ab8:	75 1a                	jne    103ad4 <open+0xcc>
    iput(ip);
  103aba:	83 ec 0c             	sub    $0xc,%esp
  103abd:	ff 75 f4             	push   -0xc(%ebp)
  103ac0:	e8 a5 ed ff ff       	call   10286a <iput>
  103ac5:	83 c4 10             	add    $0x10,%esp
    end_op();
  103ac8:	e8 c3 02 00 00       	call   103d90 <end_op>
    return 0;
  103acd:	b8 00 00 00 00       	mov    $0x0,%eax
  103ad2:	eb 5f                	jmp    103b33 <open+0x12b>
  }

  f->type = FD_INODE;
  103ad4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ad7:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  f->ip = ip;
  103add:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ae0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103ae3:	89 50 0c             	mov    %edx,0xc(%eax)
  f->off = 0;
  103ae6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ae9:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  f->readable = !(omode & O_WRONLY);
  103af0:	8b 45 0c             	mov    0xc(%ebp),%eax
  103af3:	83 e0 01             	and    $0x1,%eax
  103af6:	85 c0                	test   %eax,%eax
  103af8:	0f 94 c0             	sete   %al
  103afb:	89 c2                	mov    %eax,%edx
  103afd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103b00:	88 50 08             	mov    %dl,0x8(%eax)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  103b03:	8b 45 0c             	mov    0xc(%ebp),%eax
  103b06:	83 e0 01             	and    $0x1,%eax
  103b09:	85 c0                	test   %eax,%eax
  103b0b:	75 0a                	jne    103b17 <open+0x10f>
  103b0d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103b10:	83 e0 02             	and    $0x2,%eax
  103b13:	85 c0                	test   %eax,%eax
  103b15:	74 07                	je     103b1e <open+0x116>
  103b17:	b8 01 00 00 00       	mov    $0x1,%eax
  103b1c:	eb 05                	jmp    103b23 <open+0x11b>
  103b1e:	b8 00 00 00 00       	mov    $0x0,%eax
  103b23:	89 c2                	mov    %eax,%edx
  103b25:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103b28:	88 50 09             	mov    %dl,0x9(%eax)
  end_op();
  103b2b:	e8 60 02 00 00       	call   103d90 <end_op>
  return f;
  103b30:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  103b33:	c9                   	leave
  103b34:	c3                   	ret

00103b35 <mkdir>:

int mkdir(char *path)
{
  103b35:	55                   	push   %ebp
  103b36:	89 e5                	mov    %esp,%ebp
  103b38:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;

  begin_op();
  103b3b:	e8 4a 02 00 00       	call   103d8a <begin_op>
  if((ip = create(path, T_DIR, 0, 0)) == 0){
  103b40:	6a 00                	push   $0x0
  103b42:	6a 00                	push   $0x0
  103b44:	6a 01                	push   $0x1
  103b46:	ff 75 08             	push   0x8(%ebp)
  103b49:	e8 ea fc ff ff       	call   103838 <create>
  103b4e:	83 c4 10             	add    $0x10,%esp
  103b51:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103b54:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103b58:	75 0c                	jne    103b66 <mkdir+0x31>
    end_op();
  103b5a:	e8 31 02 00 00       	call   103d90 <end_op>
    return -1;
  103b5f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  103b64:	eb 18                	jmp    103b7e <mkdir+0x49>
  }
  iput(ip);
  103b66:	83 ec 0c             	sub    $0xc,%esp
  103b69:	ff 75 f4             	push   -0xc(%ebp)
  103b6c:	e8 f9 ec ff ff       	call   10286a <iput>
  103b71:	83 c4 10             	add    $0x10,%esp
  end_op();
  103b74:	e8 17 02 00 00       	call   103d90 <end_op>
  return 0;
  103b79:	b8 00 00 00 00       	mov    $0x0,%eax
  103b7e:	c9                   	leave
  103b7f:	c3                   	ret

00103b80 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
  103b80:	55                   	push   %ebp
  103b81:	89 e5                	mov    %esp,%ebp
  103b83:	83 ec 28             	sub    $0x28,%esp
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  readsb(dev, &sb);
  103b86:	83 ec 08             	sub    $0x8,%esp
  103b89:	8d 45 dc             	lea    -0x24(%ebp),%eax
  103b8c:	50                   	push   %eax
  103b8d:	ff 75 08             	push   0x8(%ebp)
  103b90:	e8 03 e9 ff ff       	call   102498 <readsb>
  103b95:	83 c4 10             	add    $0x10,%esp
  log.start = sb.logstart;
  103b98:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103b9b:	a3 20 b6 10 00       	mov    %eax,0x10b620
  log.size = sb.nlog;
  103ba0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103ba3:	a3 24 b6 10 00       	mov    %eax,0x10b624
  log.dev = dev;
  103ba8:	8b 45 08             	mov    0x8(%ebp),%eax
  103bab:	a3 2c b6 10 00       	mov    %eax,0x10b62c
  recover_from_log();
  103bb0:	e8 b3 01 00 00       	call   103d68 <recover_from_log>
}
  103bb5:	90                   	nop
  103bb6:	c9                   	leave
  103bb7:	c3                   	ret

00103bb8 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
  103bb8:	55                   	push   %ebp
  103bb9:	89 e5                	mov    %esp,%ebp
  103bbb:	83 ec 18             	sub    $0x18,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
  103bbe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103bc5:	e9 95 00 00 00       	jmp    103c5f <install_trans+0xa7>
    if (LOG_FLAG == 5) {
      if (tail == log.lh.n/2) panic("[UNDOLOG] Panic in install_trans type 5");
    }
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
  103bca:	8b 15 20 b6 10 00    	mov    0x10b620,%edx
  103bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103bd3:	01 d0                	add    %edx,%eax
  103bd5:	83 c0 01             	add    $0x1,%eax
  103bd8:	89 c2                	mov    %eax,%edx
  103bda:	a1 2c b6 10 00       	mov    0x10b62c,%eax
  103bdf:	83 ec 08             	sub    $0x8,%esp
  103be2:	52                   	push   %edx
  103be3:	50                   	push   %eax
  103be4:	e8 c0 e3 ff ff       	call   101fa9 <bread>
  103be9:	83 c4 10             	add    $0x10,%esp
  103bec:	89 45 f0             	mov    %eax,-0x10(%ebp)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
  103bef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103bf2:	83 c0 04             	add    $0x4,%eax
  103bf5:	8b 04 85 24 b6 10 00 	mov    0x10b624(,%eax,4),%eax
  103bfc:	89 c2                	mov    %eax,%edx
  103bfe:	a1 2c b6 10 00       	mov    0x10b62c,%eax
  103c03:	83 ec 08             	sub    $0x8,%esp
  103c06:	52                   	push   %edx
  103c07:	50                   	push   %eax
  103c08:	e8 9c e3 ff ff       	call   101fa9 <bread>
  103c0d:	83 c4 10             	add    $0x10,%esp
  103c10:	89 45 ec             	mov    %eax,-0x14(%ebp)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
  103c13:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c16:	8d 50 1c             	lea    0x1c(%eax),%edx
  103c19:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103c1c:	83 c0 1c             	add    $0x1c,%eax
  103c1f:	83 ec 04             	sub    $0x4,%esp
  103c22:	68 00 02 00 00       	push   $0x200
  103c27:	52                   	push   %edx
  103c28:	50                   	push   %eax
  103c29:	e8 3e d3 ff ff       	call   100f6c <memmove>
  103c2e:	83 c4 10             	add    $0x10,%esp
    bwrite(dbuf);  // write dst to disk
  103c31:	83 ec 0c             	sub    $0xc,%esp
  103c34:	ff 75 ec             	push   -0x14(%ebp)
  103c37:	e8 a6 e3 ff ff       	call   101fe2 <bwrite>
  103c3c:	83 c4 10             	add    $0x10,%esp
    brelse(lbuf);
  103c3f:	83 ec 0c             	sub    $0xc,%esp
  103c42:	ff 75 f0             	push   -0x10(%ebp)
  103c45:	e8 c8 e3 ff ff       	call   102012 <brelse>
  103c4a:	83 c4 10             	add    $0x10,%esp
    brelse(dbuf);
  103c4d:	83 ec 0c             	sub    $0xc,%esp
  103c50:	ff 75 ec             	push   -0x14(%ebp)
  103c53:	e8 ba e3 ff ff       	call   102012 <brelse>
  103c58:	83 c4 10             	add    $0x10,%esp
  for (tail = 0; tail < log.lh.n; tail++) {
  103c5b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103c5f:	a1 30 b6 10 00       	mov    0x10b630,%eax
  103c64:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103c67:	0f 8c 5d ff ff ff    	jl     103bca <install_trans+0x12>
  }
}
  103c6d:	90                   	nop
  103c6e:	90                   	nop
  103c6f:	c9                   	leave
  103c70:	c3                   	ret

00103c71 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  103c71:	55                   	push   %ebp
  103c72:	89 e5                	mov    %esp,%ebp
  103c74:	83 ec 18             	sub    $0x18,%esp
  struct buf *buf = bread(log.dev, log.start);
  103c77:	a1 20 b6 10 00       	mov    0x10b620,%eax
  103c7c:	89 c2                	mov    %eax,%edx
  103c7e:	a1 2c b6 10 00       	mov    0x10b62c,%eax
  103c83:	83 ec 08             	sub    $0x8,%esp
  103c86:	52                   	push   %edx
  103c87:	50                   	push   %eax
  103c88:	e8 1c e3 ff ff       	call   101fa9 <bread>
  103c8d:	83 c4 10             	add    $0x10,%esp
  103c90:	89 45 f0             	mov    %eax,-0x10(%ebp)
  struct logheader *lh = (struct logheader *) (buf->data);
  103c93:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c96:	83 c0 1c             	add    $0x1c,%eax
  103c99:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int i;
  log.lh.n = lh->n;
  103c9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103c9f:	8b 00                	mov    (%eax),%eax
  103ca1:	a3 30 b6 10 00       	mov    %eax,0x10b630
  for (i = 0; i < log.lh.n; i++) {
  103ca6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103cad:	eb 1b                	jmp    103cca <read_head+0x59>
    log.lh.block[i] = lh->block[i];
  103caf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103cb2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103cb5:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  103cb9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103cbc:	83 c2 04             	add    $0x4,%edx
  103cbf:	89 04 95 24 b6 10 00 	mov    %eax,0x10b624(,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
  103cc6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103cca:	a1 30 b6 10 00       	mov    0x10b630,%eax
  103ccf:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103cd2:	7c db                	jl     103caf <read_head+0x3e>
  }
  brelse(buf);
  103cd4:	83 ec 0c             	sub    $0xc,%esp
  103cd7:	ff 75 f0             	push   -0x10(%ebp)
  103cda:	e8 33 e3 ff ff       	call   102012 <brelse>
  103cdf:	83 c4 10             	add    $0x10,%esp
}
  103ce2:	90                   	nop
  103ce3:	c9                   	leave
  103ce4:	c3                   	ret

00103ce5 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  103ce5:	55                   	push   %ebp
  103ce6:	89 e5                	mov    %esp,%ebp
  103ce8:	83 ec 18             	sub    $0x18,%esp
  struct buf *buf = bread(log.dev, log.start);
  103ceb:	a1 20 b6 10 00       	mov    0x10b620,%eax
  103cf0:	89 c2                	mov    %eax,%edx
  103cf2:	a1 2c b6 10 00       	mov    0x10b62c,%eax
  103cf7:	83 ec 08             	sub    $0x8,%esp
  103cfa:	52                   	push   %edx
  103cfb:	50                   	push   %eax
  103cfc:	e8 a8 e2 ff ff       	call   101fa9 <bread>
  103d01:	83 c4 10             	add    $0x10,%esp
  103d04:	89 45 f0             	mov    %eax,-0x10(%ebp)
  struct logheader *hb = (struct logheader *) (buf->data);
  103d07:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103d0a:	83 c0 1c             	add    $0x1c,%eax
  103d0d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int i;
  hb->n = log.lh.n;
  103d10:	8b 15 30 b6 10 00    	mov    0x10b630,%edx
  103d16:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103d19:	89 10                	mov    %edx,(%eax)
  for (i = 0; i < log.lh.n; i++) {
  103d1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103d22:	eb 1b                	jmp    103d3f <write_head+0x5a>
    hb->block[i] = log.lh.block[i];
  103d24:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103d27:	83 c0 04             	add    $0x4,%eax
  103d2a:	8b 0c 85 24 b6 10 00 	mov    0x10b624(,%eax,4),%ecx
  103d31:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103d34:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103d37:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
  103d3b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103d3f:	a1 30 b6 10 00       	mov    0x10b630,%eax
  103d44:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103d47:	7c db                	jl     103d24 <write_head+0x3f>
  }
  bwrite(buf);
  103d49:	83 ec 0c             	sub    $0xc,%esp
  103d4c:	ff 75 f0             	push   -0x10(%ebp)
  103d4f:	e8 8e e2 ff ff       	call   101fe2 <bwrite>
  103d54:	83 c4 10             	add    $0x10,%esp
  brelse(buf);
  103d57:	83 ec 0c             	sub    $0xc,%esp
  103d5a:	ff 75 f0             	push   -0x10(%ebp)
  103d5d:	e8 b0 e2 ff ff       	call   102012 <brelse>
  103d62:	83 c4 10             	add    $0x10,%esp
}
  103d65:	90                   	nop
  103d66:	c9                   	leave
  103d67:	c3                   	ret

00103d68 <recover_from_log>:

static void
recover_from_log(void)
{
  103d68:	55                   	push   %ebp
  103d69:	89 e5                	mov    %esp,%ebp
  103d6b:	83 ec 08             	sub    $0x8,%esp
  read_head();
  103d6e:	e8 fe fe ff ff       	call   103c71 <read_head>
  install_trans(); // if committed, copy from log to disk
  103d73:	e8 40 fe ff ff       	call   103bb8 <install_trans>
  log.lh.n = 0;
  103d78:	c7 05 30 b6 10 00 00 	movl   $0x0,0x10b630
  103d7f:	00 00 00 
  write_head(); // clear the log
  103d82:	e8 5e ff ff ff       	call   103ce5 <write_head>
}
  103d87:	90                   	nop
  103d88:	c9                   	leave
  103d89:	c3                   	ret

00103d8a <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
  103d8a:	55                   	push   %ebp
  103d8b:	89 e5                	mov    %esp,%ebp
  
}
  103d8d:	90                   	nop
  103d8e:	5d                   	pop    %ebp
  103d8f:	c3                   	ret

00103d90 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
  103d90:	55                   	push   %ebp
  103d91:	89 e5                	mov    %esp,%ebp
  103d93:	83 ec 08             	sub    $0x8,%esp
  // call commit w/o holding locks, since not allowed
  // to sleep with locks.
  commit();
  103d96:	e8 03 00 00 00       	call   103d9e <commit>
}
  103d9b:	90                   	nop
  103d9c:	c9                   	leave
  103d9d:	c3                   	ret

00103d9e <commit>:

/* DO NOT MODIFY THIS FUNCTION*/
static void
commit()
{
  103d9e:	55                   	push   %ebp
  103d9f:	89 e5                	mov    %esp,%ebp
  103da1:	83 ec 08             	sub    $0x8,%esp
  if (log.lh.n > 0) {
  103da4:	a1 30 b6 10 00       	mov    0x10b630,%eax
  103da9:	85 c0                	test   %eax,%eax
  103dab:	7e 19                	jle    103dc6 <commit+0x28>
    if (PANIC_1) {
      panic("[UNDOLOG] Panic in commit type 1");
    }
    write_head();    // Write header to disk 
  103dad:	e8 33 ff ff ff       	call   103ce5 <write_head>
    if (PANIC_2) {
      panic("[UNDOLOG] Panic in commit type 2");
    }
    install_trans(); // Now install writes to home locations    
  103db2:	e8 01 fe ff ff       	call   103bb8 <install_trans>
    if (PANIC_3) {
      panic("[UNDOLOG] Panic in commit type 3");
    }
    log.lh.n = 0;
  103db7:	c7 05 30 b6 10 00 00 	movl   $0x0,0x10b630
  103dbe:	00 00 00 
    write_head();    // Erase the transaction from the log 
  103dc1:	e8 1f ff ff ff       	call   103ce5 <write_head>
    if (PANIC_4) {
      panic("[UNDOLOG] Panic in commit type 4");
    }  
  }
}
  103dc6:	90                   	nop
  103dc7:	c9                   	leave
  103dc8:	c3                   	ret

00103dc9 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
  103dc9:	55                   	push   %ebp
  103dca:	89 e5                	mov    %esp,%ebp
  103dcc:	83 ec 18             	sub    $0x18,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
  103dcf:	a1 30 b6 10 00       	mov    0x10b630,%eax
  103dd4:	83 f8 1d             	cmp    $0x1d,%eax
  103dd7:	7f 12                	jg     103deb <log_write+0x22>
  103dd9:	8b 15 30 b6 10 00    	mov    0x10b630,%edx
  103ddf:	a1 24 b6 10 00       	mov    0x10b624,%eax
  103de4:	83 e8 01             	sub    $0x1,%eax
  103de7:	39 c2                	cmp    %eax,%edx
  103de9:	7c 0d                	jl     103df8 <log_write+0x2f>
    panic("too big a transaction");
  103deb:	83 ec 0c             	sub    $0xc,%esp
  103dee:	68 9b 42 10 00       	push   $0x10429b
  103df3:	e8 b6 c4 ff ff       	call   1002ae <panic>

  for (i = 0; i < log.lh.n; i++) {
  103df8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103dff:	eb 1d                	jmp    103e1e <log_write+0x55>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
  103e01:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e04:	83 c0 04             	add    $0x4,%eax
  103e07:	8b 04 85 24 b6 10 00 	mov    0x10b624(,%eax,4),%eax
  103e0e:	89 c2                	mov    %eax,%edx
  103e10:	8b 45 08             	mov    0x8(%ebp),%eax
  103e13:	8b 40 08             	mov    0x8(%eax),%eax
  103e16:	39 c2                	cmp    %eax,%edx
  103e18:	74 10                	je     103e2a <log_write+0x61>
  for (i = 0; i < log.lh.n; i++) {
  103e1a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103e1e:	a1 30 b6 10 00       	mov    0x10b630,%eax
  103e23:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103e26:	7c d9                	jl     103e01 <log_write+0x38>
  103e28:	eb 01                	jmp    103e2b <log_write+0x62>
      break;
  103e2a:	90                   	nop
  }
  log.lh.block[i] = b->blockno;
  103e2b:	8b 45 08             	mov    0x8(%ebp),%eax
  103e2e:	8b 40 08             	mov    0x8(%eax),%eax
  103e31:	89 c2                	mov    %eax,%edx
  103e33:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e36:	83 c0 04             	add    $0x4,%eax
  103e39:	89 14 85 24 b6 10 00 	mov    %edx,0x10b624(,%eax,4)
  if (i == log.lh.n)
  103e40:	a1 30 b6 10 00       	mov    0x10b630,%eax
  103e45:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  103e48:	75 0d                	jne    103e57 <log_write+0x8e>
    log.lh.n++;
  103e4a:	a1 30 b6 10 00       	mov    0x10b630,%eax
  103e4f:	83 c0 01             	add    $0x1,%eax
  103e52:	a3 30 b6 10 00       	mov    %eax,0x10b630
  b->flags |= B_DIRTY; // prevent eviction
  103e57:	8b 45 08             	mov    0x8(%ebp),%eax
  103e5a:	8b 00                	mov    (%eax),%eax
  103e5c:	83 c8 04             	or     $0x4,%eax
  103e5f:	89 c2                	mov    %eax,%edx
  103e61:	8b 45 08             	mov    0x8(%ebp),%eax
  103e64:	89 10                	mov    %edx,(%eax)
  103e66:	90                   	nop
  103e67:	c9                   	leave
  103e68:	c3                   	ret
