# ChatGPT ↔ Codex 同步协议

1. 只有已经实际commit且push的仓库文件能跨助手读取；本地聊天/附件、未推送修改、local私有指针不自动共享。
2. 训练前先检查工作目录、git status及当前规则；有本地改动先保护/审阅。获网络权限后fetch检查远端；干净且可快进才pull --ff-only，不覆盖用户工作、不强行解冲突或force push。
3. Codex维护事实状态/考核/日志/当前任务/codex_to_chatgpt；ChatGPT维护建议计划/chatgpt_to_codex。新计划须引用当前证据，不把计划当完成记录。
4. 任何提交发布前审查git diff及将要加入的路径。禁止加入local/、受限课程原件、录音、私人原答、完整第三方材料或秘密。2026-11-01用户已批准Phase0与后续训练状态的审查后commit/push；原课程资料和local仍不属于公开授权范围。
5. 每次同步写明实际commit hash、push结果、远端可见性；失败保持SYNC_PENDING，不能写“已同步”。初始化基线hash只是旧远端版本，不是本次交付hash。
6. 异地无法解析local://时标LOCAL_ONLY_UNAVAILABLE；使用现存公开摘要辅助计划，不猜测原实现。要分享某项私人证据时先由用户明确授权脱敏。
7. 新面经先Source ID、权限/可读性、URL/hash去重、类别/项目/RTL关联，再更新交接；不复制整份答案库。无法读取只存元数据UNREADABLE，不凭标题编题。

8. 为避免在提交内填写自身尚不存在的hash，handoff保存最近已核验的push回执；承载回执的后续提交hash通过Git文件历史取得。不得用未执行的push填回执。
