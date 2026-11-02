# 弱点入口（历史风险，不等于本轮不及格）

新轮全部UNASSESSED，尚无本轮失败结论。不按“读过/旧PASS”认定掌握。

沿用旧WEAK_POINTS.md与08目录当前进度V0.4，不复制整份错题本。历史高价值待复测：

- K01：阻塞/NBA、同沿旧值、begin/end、位宽/满计数、case在复位else内的位置；旧FIFO修订后静态通过与独立首版无错分开。
- P01：AW/W收齐、异常BRESP/RRESP、Timeout层次；多周期读响应SVA安全性与有界活性；原读响应保持缺陷与后补修复分开。
- P02：Gray跳2/3条件、实际指针监测与r_en关系、EB/Deskew边界与throttle；本人Task及有限验证证据。
- P03/P04：最近生产者、stall/flush、ROB环形年龄、CFC恢复、FRL head/tail、迟到写回身份与原实现边界。
- P05/P06：测量ROI/基准/面积模型；6T/外围/读写；RCA/比较器指标归属、PVT/PEX口径。

只在本人独立答题/代码暴露错误时更新当前条目和对应旧Cheatsheet；不把匿名真实面试的未知原答判为答错。
