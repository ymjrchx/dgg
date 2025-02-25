package net.dgg.gspt.dqc.constant;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: LayStatusConstant
 * @Description: 法律状态
 * @Author: jiangsh
 * @Date: 2018/10/22 18:07
 */
public interface LayStatusConstant {

    static String one() {
        return "驳回复审领退信(商标评审申请受理通知书)', '更正商标申请/注册事项完成', '更正商标申请/注册事项完成', '变更商标申请人/注册人名义/地址中', '商标变更完成',  '驳回复审待审中', '', '驳回复审中',  '打印异议答辩清单',  '商标异议申请完成',  '变更程序中',  '排版送达公告(领取商标注册证通知书)',  '排版送达公告(商标部分驳回通知书)',  '商标异议申请中', '排版送达公告(商标 异议答辩通知书)',  '等待驳回 复审', '驳回复审有退信(商标评审申请受理通知书)',  '变更商标申请人/注册人名义/地址完成',  '变更商标代理人完成',  '有退信(变更商标受理通知书)',  '排版送达公告(商标异议 申请受理通知书)', '异议中', '转让程序中";
    }

    static String oneResult() {
        return "关注、转让、变更";
    }

    static String two() {
        return "'商标注册申请完成', '商标注册申请中',  '等待打印受理通知书', '领退信(商标注册申请受理通知书)',  '排版送达公告(商标注册申请受理通知书)',  '等待实质审核', '变更商标代理人中',  '商标转让中',  '等待注册证发文', '商标注册申请等待受理通知书发文', '商标转让完成',  '等待补正回文',  '注册中',  '有退信(领取商标注册证通知书)',  '商标注册申请等待受理中', '申请收文',  '有退信(商标注册证)',  '核准通知书打印发送',  '领退信(商标注册证)',  '商标注册申请等待受理中+', '已注册', '商标已注册'";
    }

    static String twoResult() {
        return "关注、购买、无效、撤三、转让、续展";
    }

    static String three() {
        return "'删减商品/服务项目申请完成', '等待驳回通知发文', '商标异议申请等待裁定书发文', '商标异议申请打印异议答辩清单', '无效宣告中', '商标无效', '商标已无效', '无效商标',  '商标注册申请等待驳回通知发文', '驳回复审排版送达公告(商标评审申请受理通知书)', '商标注册申请驳回通知发文',  '商标注册申请等待驳回复审',  '商标转让等待打印受理通知书',   '驳回复审完成'";
    }

    static String threeResult() {
        return "关注、注册";
    }

    static String four() {
        return "'商标注册申请受理通知书发文', '排版送达 公告(商标注册证)', '核准证明打印发送',  '商标注册申请注册公告排版完成',  '商标注册申请等待注册证发文',  '等待受理通知书发文', '排版送达公告(商标异议申请不予受理通知书)',  '有退信(商 标注册申请受理通知书)', '排版送达公告(商标转让证明)', '等待核准 通知发文', '驳回复审评审实审裁文发文', '评审分案', '等待补证明发文',  '注册证发文'";
    }

    static String fourResult() {
        return "无";
    }

    /**
     * 商标搜索扩展搜索具体条件
     */
    static List<String> extenAggCondition() {
        final List<String> list = new ArrayList<>();
        list.add("已注册");
        list.add("无效");
        list.add("申请中");
        return list;
    }
}
