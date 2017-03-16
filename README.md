swift & spritekit 学习笔记
在size，和position下的属性，都要加!

碰撞检测主要是contactTestBitMask的值(16进制)，就行|的操作。
值可以定义为1<<0  1<<1 1<<2
在碰撞检测的代理方法中
contact.BodyA.contactTestzBitMase | contact.bodyB.contactTestBitMask 等于 之前定义好的值想或，证明是这两个物体相撞，可以进行相应的一些处理。
当习惯了swift之后，会发现，Objective-c简直真的是一个反人类的东西。
