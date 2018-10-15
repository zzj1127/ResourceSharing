function check_surname(str) {  
    var str = str.substr(0, 1); //截取用户提交的用户名的前两字节，也就是姓。   
    var surname = " 赵钱孙李周吴郑王冯陈褚卫蒋沈韩杨朱秦尤许何吕施张孔曹严华金魏陶姜戚谢邹喻柏水窦章云苏潘葛奚范彭郎鲁韦昌马苗凤花方俞任袁柳酆鲍史唐费廉岑薛雷贺倪汤 滕殷罗毕郝邬安常乐于时傅皮卞齐康伍余元卜顾孟平黄和穆萧尹姚邵堪汪祁毛禹狄米贝明臧计伏成戴谈宋茅庞熊纪舒屈项祝董粱杜阮蓝闵席季麻强贾路娄危江童颜郭 梅盛林刁钟徐邱骆高夏蔡田樊胡凌霍虞万支柯咎管卢莫经房裘缪干解应宗宣丁贲邓郁单杭洪包诸左石崔吉钮龚程嵇邢滑裴陆荣翁荀羊於惠甄魏加封芮羿储靳汲邴糜松 井段富巫乌焦巴弓牧隗山谷车侯宓蓬全郗班仰秋仲伊宫宁仇栾暴甘钭厉戎祖武符刘姜詹束龙叶幸司韶郜黎蓟薄印宿白怀蒲台从鄂索咸籍赖卓蔺屠蒙池乔阴郁胥能苍双 闻莘党翟谭贡劳逄姬申扶堵冉宰郦雍郤璩桑桂濮牛寿通边扈燕冀郏浦尚农温别庄晏柴瞿阎充慕连茹习宦艾鱼容向古易慎戈廖庚终暨居衡步都耿满弘匡国文寇广禄阙东 殴殳沃利蔚越夔隆师巩厍聂晁勾敖融冷訾辛阚那简饶空曾毋沙乜养鞠须丰巢关蒯相查后江红游竺权逯盖益桓公万俟司马上官欧阳夏侯诸葛闻人东方赫连皇甫尉迟公羊 澹台公冶宗政濮阳淳于仲孙太叔申屠公孙乐正轩辕令狐钟离闾丘长孙慕容鲜于宇文司徒司空亓官司寇仉督子车颛孙端木巫马公西漆雕乐正壤驷公良拓拔夹谷宰父谷粱 晋楚闫法汝鄢涂钦段干百里东郭南门呼延妫海羊舌微生岳帅缑亢况後有琴梁丘左丘东门西门商牟佘佴伯赏南宫墨哈谯笪年爱阳佟第五言福保";
    r = surname.search(str); // 查找字符串。  
    if (r == -1) {  
        return false;  
    }  
    else{  
        return true;  
    }  
}  
function validate(theform) {

    console.log(document.getElementById('username').value);
    if (document.getElementById('realname').value != "") {  
        if (document.getElementById('realname').value.length == 1) {  
            document.getElementById('msg').innerHTML ="真实姓名必须是一个字以上！";
            document.getElementById('realname').value="";
            return false;  
        }  
        var nnname = document.getElementById('realname').value;  
        var reg = /^([\u4E00-\u9FA5])*$/;  
        if (arr = nnname.match(reg)) {  
            if (!check_surname(nnname)) {  
                document.getElementById('msg').innerHTML ="真实姓名格式错误！";
                document.getElementById('realname').value="";
                return false;  
            }  
        } else {  // www.jbxue.com
            document.getElementById('msg').innerHTML ="真实姓名必须全部为中文";
            document.getElementById('realname').value="";
            return false;  
        }  
        document.getElementById('msg').innerHTML ="姓名格式正确！";  
    }else{  
        document.getElementById('msg').innerHTML ="请填入真实姓名！";  
    }  
    return true;

} 