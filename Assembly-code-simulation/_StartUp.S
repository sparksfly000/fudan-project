_InitBegin:
#   using  four bytes to save
#    allocate  room to  stack
	addiu32  $sp, $sp,   3600

	addiu32  r4, zero,   3800   #ed8   store Q
	addiu32  $sp, $sp,   200
	addiu64  $gwr1, $gwr0, 0x7bcd553be2fd48aa71278209c9ae66c3667bd64eb277da907e9a66b13fff5480  #qx_re
	st64     $gwr1, 0($sp)
	addiu64  $gwr1, $gwr0, 0x529f55d5a4ba185804594ff57177b954f8f233bcbd5168729d92fd2d83b69d9e  #qx_im
	st64     $gwr1, 8($sp)
	addiu64  $gwr1, $gwr0, 0x8665582eceb5fa5ca7a0d56b9300323a31a662b8247893b54900e87737a5b02    #qy_re
	st64     $gwr1, 16($sp)
	addiu64  $gwr1, $gwr0, 0x7d7acb3ffe8210975ed64a6f2d4bc7fbe3ad76122ffeddd692e3c9193f83134b   #qy_im
	st64     $gwr1, 24($sp)
	addiu64  $gwr1, $gwr0, 0xa78aef92ad20627cc1a43dea605053967fcb725ef257f927fa4236273c7d2da1    #qz_re
	st64     $gwr1, 32($sp)
	addiu64  $gwr1, $gwr0, 0                                                                    #qz_im
	st64     $gwr1, 40($sp)
	addiu32  $sp, $sp, -200

	addiu32  r5, zero,   3848   #f08   store P
	addiu32  $sp, $sp,   248
	addiu64  $gwr1, $gwr0, 0xa65a5c2cf75dbbc64d47221ead4ca79c2dccc3ac5a689ab49588be6baa834700  #px
	st64     $gwr1, 0($sp)
	addiu64  $gwr1, $gwr0, 0x336a0a628186c866e1cd4c1eafd8ad645f60e1c3f473ca6b46d3409274f48a25  #py
	st64     $gwr1, 8($sp)
	addiu64  $gwr1, $gwr0, 0xa78aef92ad20627cc1a43dea605053967fcb725ef257f927fa4236273c7d2da1    #pz
	st64     $gwr1, 16($sp)
	addiu32  $sp, $sp, -248

	addiu32  r1, zero,   3896
	st32     $r1, 8($sp)        #f38    store para
	addiu32  $sp, $sp, 296
	addiu64  $gwr1, $gwr0, 0x6c140ed00d7fb63041aabf03f20c32cb2ab93a57e15b8f12fbb1a2cd020007af   #gama11
	st64     $gwr1, 0($sp)
	addiu64  $gwr1, $gwr0, 0x2918491e9bc59d0cd66699a46a7f8fb228692345eb935910a22e880063d7ca46   #gama12                                                              #gama11_im
	st64     $gwr1, 8($sp)
	addiu64  $gwr1, $gwr0, 0x41a43a930a2d5e230eaad4de06bcaab080ae8909c1ea9d781f43fd5dc12ecaf1   #gama13
	st64     $gwr1, 16($sp)
	addiu64  $gwr1, $gwr0, 0x37cd598bf148e181eac60709ffbe0360ca90443213b64ec48d5bed010aabe222   #gama14                                                        #gama12_im
	st64     $gwr1, 24($sp)
	addiu64  $gwr1, $gwr0, 0x8bd02bc2ff514ee4a303c12a0a3f3f2a77e7e1fcfb09fd410901f5b8a28008bf   #gama15
	st64     $gwr1, 32($sp)
	addiu64  $gwr1, $gwr0, 0x2918491e9bc59d0cd66699a46a7f8fb228692345eb935910a22e880063d7ca46    #gama21                                                        #gama13_im
	st64     $gwr1, 40($sp)
	addiu64  $gwr1, $gwr0, 0x37cd598bf148e181eac60709ffbe0360ca90443213b64ec48d5bed010aabe222    #gama22
	st64     $gwr1, 48($sp)
	addiu64  $gwr1, $gwr0, 0xeb5106d55834475145f6d65953e73aea22720ec2822f5b3eb2d6500a6d417dc      #gama23                                                      #gama14_im
	st64     $gwr1, 56($sp)
	addiu64  $gwr1, $gwr0, 0x8d27b6e166de09e4ff9d11ab8b0f3792f98970052ee795cb434113277f797b37   #gama24
	st64     $gwr1, 64($sp)
	addiu64  $gwr1, $gwr0, 0x7e72a674115ac56feb3da445f5d0c3e457624f1906c4a0175813ae26d8a5635b    #gama25                                                        #gama15_im
	st64     $gwr1, 72($sp)
	addiu64  $gwr1, $gwr0, 0x41a43a930a2d5e230eaad4de06bcaab080ae8909c1ea9d781f43fd5dc12ecaf1    #gama31
	st64     $gwr1, 80($sp)
	addiu64  $gwr1, $gwr0, 0xeb5106d55834475145f6d65953e73aea22720ec2822f5b3eb2d6500a6d417dc     #gama32                                                       #gama21_im
	st64     $gwr1, 88($sp)
	addiu64  $gwr1, $gwr0, 0x749bc56cf87648cec758d671eed21c94a1440a4158905163c62b9dca22227a8c    #gama33
	st64     $gwr1, 96($sp)
	addiu64  $gwr1, $gwr0, 0xa78aef92ad20627cc1a43dea605053967fcb725ef257f927fa4236273c7d2da1    #gama34                                                        #gama22_im
	st64     $gwr1, 104($sp)
	addiu64  $gwr1, $gwr0, 0x41a43a930a2d5e230eaad4de06bcaab080ae8909c1ea9d781f43fd5dc12ecaf1     #gama35
	st64     $gwr1, 112($sp)
	addiu64  $gwr1, $gwr0, 0x42                                                                   #loop
	st32     $gwr1, 120($sp)
	addiu64  $gwr1, $gwr0, 0xb0989822472d8ab5e4dcb631e1c451d8c45a955ec997c01c38efdee806012f10     #R^2
	st64     $gwr1, 128($sp)
	addiu64  $gwr1, $gwr0, 0x600000000058f98a                                                      #t
	st64     $gwr1, 136($sp)
	addiu64  $gwr1, $gwr0, 0xf937508000000004                                                      #loopIndex
	st64     $gwr1, 144($sp)
	addiu64  $gwr1, $gwr0, 0xa78aef92ad20627cc1a43dea605053967fcb725ef257f927fa4236273c7d2da1      #MontFieldOne
	st64     $gwr1, 152($sp)
	addiu64  $gwr1, $gwr0, 0xb640000002a3a6f1d603ab4ff58ec74521f2934b1a7aeedbe56f9b27e351457d       #p
	st64     $gwr1, 160($sp)
	addiu32  $sp, $sp, -296

	addiu32  fp, zero,   400



#   using    single  byte to save
#   addiu32  $sp, $sp,   14400
#	addiu32  r4, zero,   16768   #1060   store Q
#	addiu32  r5, zero,   16816   #106c   store P
#	addiu32  fp, zero,   400
#	addiu32  r1, zero,   16840
#	st32     $r1, 8($sp)        #1072    store para


_InitEnd:


