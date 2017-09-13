# encoding: UTF-8
# Question#is_mandatory is now false by default. The default_mandatory option allows you to set
#   is_mandatory for all questions in a survey.

survey "HAPPINOMETER" do

    section "1 : ข้อมูลทั่วไป" do
        q_0101 "เพศ",:pick => :one, :display_type => :inline

        a_1 "ชาย"
        a_2 "หญิง"
        a_3 "เพศทางเลือก"

        q_0101a "ขณะนี้ท่านกำลังตั้งครรภ์หรือไม่ (ถามเฉพาะเพศหญิง)", :pick => :one
        dependency :rule => "A or B"
        condition_A :q_0101, "==", :a_2
        condition_B :q_0101, "==", :a_3
        
        a_1 "ตั้งครรภ์"
        a_2 "ไม่ได้ตั้งครรภ์"
        
        q_0102 "อายุ"

        a "|ปี", :integer

        q_0103 "จังหวัดที่ท่านอาศัยอยู่ในปัจจุบันเป็นจังหวัดเดียวกับภูมิลำเนาหรือไม่", :pick => :one, :display_type => :inline
 
        a "ใช่"
        a "ไม่ใช่"

        q_0104 "ท่านจบการศึกษาสูงสุด ในระดับใด (ไม่รวมระดับการศึกษาที่ยังไม่สำเร็จการศึกษา)", :pick => :one, :display_type => :dropdown
 
        a_1 "ประถมศึกษาหรือต่ำกว่า"
        a_2 "มัธยมศึกษาตอนต้น"
        a_3 "มัธยมศึกษาตอนปลาย"
        a_4 "ปวช"
        a_5 "ปวส"
        a_6 "อนุปริญญาหรือเทียบเท่า"
        a_7 "ปริญญาตรี"
        a_8 "สูงกว่าปริญญาตรี"
        a_9 "ไม่ได้รับการศึกษา"
        a_10 "อื่นๆ (ระบุ)"

        q_0104a "ระบุ"
        dependency :rule => "A"
        condition_A :q_0104, "==", :a_10

        a :string

        q_0105 "สถานภาพสมรส", :pick => :one, :display_type => :dropdown
 
        a_1 "โสด"
        a_2 "แต่งงานและอยู่ร่วมกัน"
        a_3 "แต่งงานแต่ไม่ได้อยู่ด้วยกัน"
        a_4 "อยู่ด้วยกันโดยไม่ได้แต่งงาน"
        a_5 "หม้าย"
        a_6 "หย่า/แยกทาง/เลิกกัน"

        q_0106 "ท่านมีบุตรหรือไม่ (รวมลูกบุญธรรม/ลูกติด/ลูกเลี้ยง)", :pick => :one, :display_type => :dropdown
 
        a_1 "ไม่มี"
        a_2 "มี จำนวน 1 คน"
        a_3 "มี จำนวน 2 คน"
        a_4 "มี จำนวน 3-4 คน"
        a_5 "มี จำนวนตั้งแต่ 5 คนขึ้นไป"

        q_0107 "งานที่ท่านทำเป็นงานลักษณะใด", :pick => :one, :display_type => :dropdown
 
        a_1 "งานสำนักงาน"
        a_2 "งานด้านการผลิต"
        a_3 "งานด้านการบริการ"
        a_4 "งานด้านบริหาร"
        a_5 "งานด้านอื่นๆ (ระบุ)"

        q_0107a "ระบุ"
        dependency :rule => "A"
        condition_A :q_0107, "==", :a_5
 
        a :string

        q_0108 "ท่านปฏิบัติงานในระดับตำแหน่งใด", :pick => :one, :display_type => :dropdown
 
        a_1 "ระดับปฏิบัติงาน"
        a_2 "ระดับหัวหน้างาน"
        a_3 "ระดับผู้บริหารองค์กร"
        a_4 "อื่นๆ (ระบุ)"

        q_0108a "ระบุ"
        dependency :rule => "A"
        condition_A :q_0108, "==", :a_4
 
        a :string

        q_0109 "โปรดเลือกประเภทการจ้างงานของท่าน", :pick => :one, :display_type => :dropdown

        a "ข้าราชการ"
        a "พนักงานราชการ"
        a "พนักงานกระทรวง"
        a "ลูกจ้างประจำ"
        a "ลูกจ้างชั่วคราว"
        
        q_0110 "โปรดเลือกสายงานของท่าน", :pick => :one, :display_type => :dropdown
        a_001 "เจ้าพนักงานการเกษตร"
        a_002 "เจ้าพนักงานการเงินและบัญชี"
        a_003 "เจ้าพนักงานการแพทย์แผนไทย"
        a_004 "เจ้าพนักงานเครื่องคอมพิวเตอร์"
        a_005 "เจ้าพนักงานทันตสาธารณสุข"
        a_006 "เจ้าพนักงานธุรการ"
        a_007 "เจ้าพนักงานเผยแพร่ประชาสัมพันธ์"
        a_008 "เจ้าพนักงานพัสดุ"
        a_009 "เจ้าพนักงานเภสัชกรรม"
        a_010 "เจ้าพนักงานรังสีการแพทย์"
        a_011 "เจ้าพนักงานวิทยาศาสตร์การแพทย์"
        a_012 "เจ้าพนักงานเวชกรรมฟื้นฟู"
        a_013 "เจ้าพนักงานเวชกิจฉุกเฉิน"
        a_014 "เจ้าพนักงานเวชสถิติ"
        a_015 "เจ้าพนักงานสถิติ"
        a_016 "เจ้าพนักงานสาธารณสุข"
        a_017 "เจ้าพนักงานโสตทัศนศึกษา"
        a_018 "เจ้าพนักงานห้องสมุด"
        a_019 "เจ้าพนักงานอาชีวบำบัด"
        a_020 "เจ้าหน้าที่บันทึกข้อมูล"
        a_021 "ช่างกายอุปกรณ์"
        a_022 "ช่างเครื่องช่วยคนพิการ"
        a_023 "ช่างซ่อมเครื่องทําความเย็น"
        a_024 "ช่างซ่อมบำรุง"
        a_025 "ช่างต่อท่อ"
        a_026 "ช่างตัดเย็บผ้า"
        a_027 "ช่างทันตกรรม"
        a_028 "ช่างประปา"
        a_029 "ช่างปูน"
        a_030 "ช่างฝีมือทั่วไป"
        a_031 "ช่างไฟฟ้า"
        a_032 "ช่างไฟฟ้าและอิเลคทรอนิคส์"
        a_033 "ช่างภาพการแพทย์"
        a_034 "ช่างไม้"
        a_035 "ช่างศิลป์"
        a_036 "ช่างเหล็ก"
        a_037 "ช่างอิเลคทรอนิคส์"
        a_038 "ทันตแพทย์"
        a_039 "นักกายภาพบำบัด"
        a_040 "นักการแพทย์แผนไทย"
        a_041 "นักกิจกรรมบำบัด"
        a_042 "นักจัดการงานทั่วไป"
        a_043 "นักจิตวิทยา"
        a_044 "นักจิตวิทยาคลินิก"
        a_045 "นักทรัพยากรบุคคล"
        a_046 "นักเทคนิคการแพทย์"
        a_047 "นักเทคโนโลยีสารสนเทศ"
        a_048 "นักเทคโนโลยีหัวใจและทรวงอก"
        a_049 "นักประชาสัมพันธ์"
        a_050 "นักโภชนาการ"
        a_051 "นักรังสีการแพทย์"
        a_052 "นักวิเคราะห์นโยบายและแผน"
        a_053 "นักวิชาการคอมพิวเตอร์"
        a_054 "นักวิชาการเงินและบัญชี"
        a_055 "นักวิชาการตรวจสอบภายใน"
        a_056 "นักวิชาการเผยแพร่"
        a_057 "นักวิชาการพัสดุ"
        a_058 "นักวิชาการศึกษา"
        a_059 "นักวิชาการศึกษาพิเศษ"
        a_060 "นักวิชาการสถิติ"
        a_061 "นักวิชาการสาธารณสุข"
        a_062 "นักวิชาการโสตทัศนศึกษา"
        a_063 "นักวิทยาศาสตร์"
        a_064 "นักวิทยาศาสตร์การกีฬา"
        a_065 "นักวิทยาศาสตร์การแพทย์"
        a_066 "นักเวชศาสตร์การสื่อความหมาย"
        a_067 "นักสังคมสงเคราะห์"
        a_068 "นายช่างเทคนิค"
        a_069 "นายช่างไฟฟ้า"
        a_070 "นายช่างโยธา"
        a_071 "นายช่างศิลป์"
        a_072 "นายแพทย์"
        a_073 "นิติกร"
        a_074 "บรรณารักษ์"
        a_075 "ผู้ช่วยเจ้าหน้าที่สาธารณสุข"
        a_076 "ผู้ช่วยเจ้าหน้าที่อนามัย"
        a_077 "ผู้ช่วยช่างทั่วไป"
        a_078 "ผู้ช่วยช่างไม้"
        a_079 "ผู้ช่วยทันตแพทย์"
        a_080 "ผู้ช่วยนักกายภาพบำบัด"
        a_081 "ผู้ช่วยพนักงานสุขศึกษา"
        a_082 "ผู้ช่วยพยาบาล"
        a_083 "ผู้ช่วยแพทย์แผนไทย"
        a_084 "ผู้ช่วยเภสัชกร"
        a_085 "ผู้ดูแลหมวดสถานที่"
        a_086 "ผู้ประสานงานโครงการ"
        a_087 "ผู้อำนวยการเฉพาะด้าน(แพทย์)"
        a_088 "พนักงานกายภาพบำบัด"
        a_089 "พนักงานการเงินและบัญชี"
        a_090 "พนักงานการแพทย์และรังสีเทคนิค"
        a_091 "พนักงานกู้ชีพ"
        a_092 "พนักงานเก็บเงิน"
        a_093 "พนักงานเก็บเอกสาร"
        a_094 "พนักงานเกษตรพื้นฐาน"
        a_095 "พนักงานขับรถยนต์"
        a_096 "พนักงานจัดการหอพัก"
        a_097 "พนักงานจัดทำข้อมูลประมวลผล"
        a_098 "พนักงานจุลทัศนากร"
        a_099 "พนักงานช่วยการพยาบาล"
        a_100 "พนักงานช่วยเหลือคนไข้"
        a_101 "พนักงานซักฟอก"
        a_102 "พนักงานทั่วไป"
        a_103 "พนักงานธุรการ"
        a_104 "พนักงานบริการ"
        a_105 "พนักงานบริการเอกสารทั่วไป"
        a_106 "พนักงานบัตรรายงานโรค"
        a_107 "พนักงานปฏิบัติการทดลองพาหะนำโรค"
        a_108 "พนักงานประกอบอาหาร"
        a_109 "พนักงานประจำตึก"
        a_110 "พนักงานประจำห้องทดลอง"
        a_111 "พนักงานประจำห้องยา"
        a_112 "พนักงานประเมินผล"
        a_113 "พนักงานเปล"
        a_114 "พนักงานผลิตน้ำประปา"
        a_115 "พนักงานผ่าและรักษาศพ"
        a_116 "พนักงานพัสดุ"
        a_117 "พนักงานพิมพ์"
        a_118 "พนักงานแพทย์แผนไทย"
        a_119 "พนักงานเภสัชกรรม"
        a_120 "พนักงานเยี่ยมบ้าน"
        a_121 "พนักงานรหัส"
        a_122 "พนักงานระบาดวิทยา"
        a_123 "พนักงานรักษาความปลอดภัย"
        a_124 "พนักงานรับโทรศัพท์"
        a_125 "พนักงานวิทยาศาสตร์"
        a_126 "พนักงานวิทยุ"
        a_127 "พนักงานสถานที่"
        a_128 "พนักงานสถิติ"
        a_129 "พนักงานสื่อสาร"
        a_130 "พนักงานสุขภาพชุมชน"
        a_131 "พนักงานโสตทัศนศึกษา"
        a_132 "พนักงานห้องปฏิบัติการ"
        a_133 "พนักงานห้องผ่าตัด"
        a_134 "พนักงานห้องเฝือก"
        a_135 "พนักงานห้องสมุด"
        a_136 "พยาบาลเทคนิค"
        a_137 "พยาบาลวิชาชีพ"
        a_138 "พี่เลี้ยง"
        a_139 "แพทย์แผนไทย"
        a_140 "แพทย์แผนไทยประยุกต์"
        a_141 "เภสัชกร"
        a_142 "โภชนากร"
        a_143 "แม่บ้าน"
        a_144 "ล่ามภาษาต่างประเทศ"
        a_145 "วิศวกร"
        a_146 "วิศวกรไฟฟ้า"
        a_147 "คนสวน"
        a_148 "อื่นๆ (ระบุ)"

        q_0110a "ระบุ"
        dependency :rule => "A"
        condition_A :q_0110, "==", :a_148
 
        a :string        

        q_0111 "ท่านทำงานเป็นกะ/ทำงานเป็นรอบ/เข้าเวรใช่หรือไม่", :pick => :one

        a_1 "ไม่ใช่"
        a_2 "ทำงานเป็นกะ/เข้าเวร"

        q_0112 "ระยะเวลาที่ท่านทำงานในองค์กรปัจจุบัน รวมทั้งหมด", :pick => :one
 
        a_1 "ไม่ถึง 1 ปี"
        a_2 "เกิน 1 ปี แต่ไม่ถึง 3 ปี"
        a_3 "เกิน 3 ปี แต่ไม่ถึง 5 ปี"
        a_4 "เกิน 5 ปี แต่ไม่ถึง 10 ปี"
        a_5 "10 ปีขึ้นไป"

        q_0113 "ตั้งแต่เริ่มทำงานจนถึงปัจจุบัน ท่านลาออก/ย้าย/เปลี่ยนงานมาแล้วกี่ครั้ง", :pick => :one
 
        a_1 "ไม่เคยลาออกย้ายเปลี่ยนงาน"
        a_2 "1-3 ครั้ง"
        a_3 "4-6 ครั้ง"
        a_4 "7-9 ครั้ง"
        a_5 "10 ครั้งขึ้นไป"

        q_0114 "ท่านมีรายได้ต่อเดือน โดยประมาณเดือนละเท่าใด (รายได้+เงินเดือน+ค่าตอบแทนอื่นๆ)", :pick => :one

        a_1 "น้อยกว่า 10,000 บาท"
        a_2 "10,001-20,000 บาท"
        a_3 "20,001-30,000 บาท"
        a_4 "30,001-40,000 บาท"
        a_5 "40,001-50,000 บาท"
        a_6 "50,001-100,000 บาท"
        a_7 "มากกว่า 100,000 บาท"

    end

    section "2 : Happinometer" do
 
        label "Happy Body / สุขภาพกายดี"

            group "ปัจจุบันท่าน", :display_type => :inline do
                q_02011 "น้ำหนัก"
                a "|กิโลกรัม", :integer

                q_02012 "ส่วนสูง"
                a "|เซนติเมตร", :integer

                q_02013 "เส้นรอบเอว"
                a "|นิ้ว", :integer
            end

            q_0202 "โดยปกติท่านกินอาหารเช้า โดยเฉลี่ยสัปดาห์ละกี่วัน", :pick => :one
 
            a_1 "ไม่กิน"
            a_2 "กินแต่ไม่บ่อย (1-2 วัน)"
            a_3 "กินเป็นบางครั้ง (3-4 วัน)"
            a_4 "กินเป็นประจำ (5-6 วัน)"
            a_5 "กินทุกวัน"

            q_0203 "ปัจจุบันท่านออกกำลังกาย โดยเฉลี่ยสัปดาห์ละกี่วัน", :pick => :one
 
            a_1 "ไม่ได้ออกกำลังกาย"
            a_2 "น้อยกว่า 3 วันต่อสัปดาห์"
            a_3 "จำนวน 3 วันต่อสัปดาห์"
            a_4 "มากกว่า 3 วันต่อสัปดาห์"
            a_5 "ทุกวัน"

            q_0204 "ปัจจุบันท่านสูบบุหรี่/ใบจาก/ยาเส้น หรือไม่", :pick => :one
 
            a_1 "สูบเป็นประจำ"
            a_2 "สูบบ่อยครั้ง"
            a_3 "สูบนานๆครั้ง"
            a_4 "ไม่สูบแต่เคยสูบ"
            a_5 "ไม่เคยสูบเลย"

            q_0205 "ปัจจุบันท่านดื่มเครื่องดื่มแอลกอฮอล์ เช่น เหล้า เบียร์ ไวน์ สาโท หรือสุราพื้นบ้านหรือไม่", :pick => :one
 
            a_1 "ดื่มเกือบทุกวัน/เกือบทุกสัปดาห์"
            a_2 "ดื่มเกือบทุกเดือน"
            a_3 "ดื่มปีละ 1-2 ครั้ง"
            a_4 "ไม่ดื่มแต่เคยดื่ม"
            a_5 "ไม่เคยดื่มเลย"

            q_0206 "โดยรวมแล้ว ท่านพึงพอใจกับสุขภาพกายของท่านหรือไม่", :pick => :one
 
            a_1 "ไม่พอใจเลย/พอใจน้อยที่สุด"
            a_2 "พอใจน้อย"
            a_3 "พอใจปานกลาง"
            a_4 "พอใจมาก"
            a_5 "พอใจมากที่สุด"

        label "Happy Relax / ผ่อนคลายดี"

            q_0207 "โดยรวมแล้ว ท่านรู้สึกว่าได้รับการพักผ่อนเพียงพอหรือไม่", :pick => :one
 
            a_1 "ไม่พอ/น้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0208 "โดยรวมแล้ว ใน 1 สัปดาห์ท่านทำกิจกรรมเพื่อเป็นการพักผ่อนหย่อนใจ (อ่านหนังสือ ดูหนัง ฟังเพลง ซ็อปปิ้ง เล่นเกมส์ ปลูกต้นไม้ ฯลฯ) หรือไม่", :pick => :one

            a_1 "ไม่ได้ทำ/น้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0209 "โดยรวมแล้ว ท่านมีความเครียด (เครียดจากการทำงาน/เรื่องครอบครัว/เรื่องอื่นๆ) บ้างหรือไม่", :pick => :one
 
            a_1 "เครียดมากที่สุด"
            a_2 "เครียดมาก"
            a_3 "เครียดปานกลาง"
            a_4 "เครียดน้อย "
            a_5 "ไม่เครียดเลย"

            q_0210 "โดยรวมแล้ว ท่านคิดว่าชีวิตของท่านเป็นไปตามที่ท่านคาดหวัง หรือไม่", :pick => :one
 
            a_1 "ไม่เป็นไปตามที่คาดหวังเลย"
            a_2 "เป็นไปตามที่คาดหวังเล็กน้อย"
            a_3 "เป็นไปตามที่คาดหวังปานกลาง"
            a_4 "เป็นไปตามที่คาดหวังมาก"
            a_5 "เป็นไปตามที่คาดหวังมากที่สุด"

            q_0211 "เมื่อประสบปัญหาในชีวิต โดยทั่วไปท่านสามารถจัดการกับปัญหาได้ หรือไม่", :pick => :one

            a_1 "ไม่สามารถจัดการได้เลย"
            a_2 "จัดการได้น้อยมาก"
            a_3 "จัดการได้ปานกลาง"
            a_4 "จัดการได้มาก"
            a_5 "จัดการได้มากที่สุด"

        label "Happy Heart / น้ำใจดี"

            q_0212 "โดยรวมแล้ว ท่านรู้สึกเอื้ออาทร/ห่วงใยต่อคนรอบข้าง หรือไม่", :pick => :one
 
            a_1 "ไม่รู้สึกเลย/น้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0213 "โดยรวมแล้ว ท่านให้การช่วยเหลือแก่คนรอบข้าง หรือไม่", :pick => :one

            a_1 "ไม่เคย/แทบจะไม่เคยช่วย"
            a_2 "นานๆ ครั้ง"
            a_3 "ช่วยบ้างบางครั้ง"
            a_4 "ช่วยแทบทุกครั้ง"
            a_5 "ช่วยทุกครั้ง"

            q_0214 "โดยรวมแล้ว ท่านเต็มใจและยินดี ในการทำประโยชน์เพื่อส่วนรวม หรือไม่", :pick => :one

            a_1 "ไม่เต็มใจ/เต็มใจน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0215 "โดยรวมแล้ว ท่านเข้าร่วมกิจกรรมที่เป็นประโยชน์ต่อสังคม เช่น การปลูกป่าการบริจาคสิ่งของ หรือไม่", :pick => :one

            a_1 "ไม่เข้าร่วม/เข้าร่วมน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0216 "โดยรวมแล้ว ท่านได้ทำกิจกรรมที่สามารถทำได้ด้วยตนเอง และมีประโยชน์ต่อสังคม เช่น การคัดแยกขยะ การลดใช้ถุงพลาสติก เป็นต้น", :pick => :one
 
            a_1 "ไม่ทำ/ทำน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

        label "Happy Soul / จิตวิญญาณดี"

            q_0217 "โดยรวมแล้ว ท่านทำนุบำรุงศิลปวัฒนธรรม/ศาสนา/การให้ทาน หรือไม่", :pick => :one
 
            a_1 "ไม่ทำ/ทำน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0218 "โดยรวมแล้ว ท่านปฏิบัติกิจตามศาสนาเพื่อให้จิตใจสงบ หรือไม่", :pick => :one
 
            a_1 "ไม่ปฏิบัติ/ปฏิบัติน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0219 "โดยรวมแล้ว ท่านยกโทษและให้อภัยอย่างจริงใจต่อผู้ที่สำนักผิด", :pick => :one
 
            a_1 "ไม่ยอมรับ/ขอโทษน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0220 "โดยรวมแล้ว ท่านยอมรับและขอโทษในความผิดที่ทำ หรือมีส่วนรับผิดชอบ", :pick => :one

            a_1 "ไม่ยอมรับ/ขอโทษน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0221 "โดยรวมแล้ว ท่านตอบแทนผู้มีพระคุณหรือช่วยเหลือท่าน", :pick => :one

            a_1 "ไม่ตอบแทน/ตอบแทนน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

        label "Happy Family / ครอบครัวดี"

            q_0222 "ท่านมีเวลาอยู่กับครอบครัว เพียงพอหรือไม่", :pick => :one
 
            a_1 "ไม่เพียงพอ"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0223 "ท่านทำกิจกรรม (ออกกำลังกาย ทำบุญ ซื้อของ ฯลฯ) ร่วมกันกับคนในครอบครัว", :pick => :one
 
            a_1 "ไม่ทำ/ทำน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0224 "โดยรวมแล้ว ท่านมีความสุขกับครอบครัวของท่าน หรือไม่", :pick => :one
 
            a_1 "ไม่มี/มีน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

        label "Happy Society / สังคมดี"

            q_0225 "โดยรวมแล้ว เพื่อนบ้านมีความสัมพันธ์ที่ดีต่อท่าน หรือไม่", :pick => :one
 
            a_1 "ไม่มี/มีน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0226 "โดยรวมแล้ว ท่านปฏิบัติตามกฎระเบียบ/ข้อบังคับของสังคม หรือไม่", :pick => :one
 
            a_1 "ไม่ปฏิบัติ/ปฏิบัติน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0227 "โดยรวมแล้ว ท่านรู้สึกปลอดภัยในชีวิตและทรัพย์สิน หรือไม่", :pick => :one
 
            a_1 "ไม่รู้สึก/ปฏิบัติน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0228 "โดยรวมแล้ว เมื่อท่านมีปัญหา ท่านสามารถขอความช่วยเหลือจากคนในชุมชน หรือไม่", :pick => :one
 
            a_1 "ไม่ได้/มีน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0229 "โดยรวมแล้ว ท่านรู้สึกว่า สังคมไทยทุกวันนี้มีความสงบสุข หรือไม่", :pick => :one
 
            a_1 "ไม่ได้/มีน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0230 "โดยรวมแล้ว ทุกวันนี้ท่านใช้ชีวิตในสังคมอย่างมีความสุข หรือไม่", :pick => :one
 
            a_1 "ไม่มี/มีน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

        label "Happy Brain / ใฝ่รู้ดี"

            q_0231 "โดยรวมแล้ว ท่านสนใจในการแสวงหาความรู้ใหม่ๆ เพิ่มเติมจากแหล่งความรู้ต่างๆ หรือไม่", :pick => :one

            a_1 "ไม่สนใจ/สนใจน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0232 "โดยรวมแล้ว ท่านสนใจที่จะพัฒนาตนเอง เพื่อความก้าวหน้าในชีวิต หรือไม่", :pick => :one
 
            a_1 "ไม่สนใจ/สนใจน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0233 "ท่านมีโอกาสที่จะได้รับการอบรม/ศึกษาต่อ/ดูงาน เพื่อพัฒนาทักษะและความสามารถของตนเอง หรือไม่", :pick => :one

            a_1 "ไม่มีโอกาส/มีโอกาสน้อยที่สุด"
            a_2 "มีโอกาสน้อย"
            a_3 "มีโอกาสปานกลาง"
            a_4 "มีโอกาสมาก"
            a_5 "มีโอกาสมากที่สุด"

        label "Happy Money / สุขภาพเงินดี"

            q_0234 "ท่านรู้สึกว่า การผ่อนชำระหนี้สินต่างๆ โดยรวมของท่านในปัจจุบันเป็นภาระ หรือไม่", :pick => :one
 
            a_1 "เป็นภาระหนักที่สุด"
            a_2 "เป็นภาระหนักมาก"
            a_3 "เป็นภาระปานกลาง"
            a_4 "เป็นภาระน้อย"
            a_5 "ไม่เป็นภาระ/ไม่ได้ผ่อนชำระ/ไม่มีหนี้สิน"

            q_0235 "ท่านผ่อนชำระหนี้ตามกำหนดเวลาทุกครั้ง หรือไม่", :pick => :one

            a_1 "ไม่ตรงเวลาทุกครั้ง"
            a_2 "ไม่ตรงเวลาบ่อยครั้ง"
            a_3 "ตรงเวลาบ้างบางครั้ง"
            a_4 "ตรงเวลาเกือบทุกครั้ง"
            a_5 "ตรงเวลาทุกครั้ง/ไม่ได้ผ่อนชำระ/ไม่มีหนี้สิน"

            q_0236 "โดยรวมแล้ว ท่านมีเงินเก็บออมในแต่ละเดือน หรือไม่", :pick => :one
 
            a_1 "ไม่มี/มีน้อยที่สุด"
            a_2 "มี/เก็บออมเพียงเล็กน้อย"
            a_3 "มี/เก็บออมปานกลาง"
            a_4 "มี/เก็บออมมาก"
            a_5 "มี/เก็บออมมากที่สุด"

            q_0237 "โดยรวมแล้ว ค่าตอบแทนที่ท่านได้รับทั้งหมดในแต่ละเดือนเป็นอย่างไร เมื่อเปรียบเทียบกับรายจ่ายทั้งหมดในแต่ละเดือน", :pick => :one
 
            a_1 "รายจ่ายเกินกว่ารายได้มาก"
            a_2 "รายจ่ายเกินกว่าเล็กน้อย"
            a_3 "รายจ่ายพอๆกับรายได้"
            a_4 "รายจ่ายน้อยกว่ารายได้"
            a_5 "รายจ่ายน้อยกว่ารายได้มาก"

        label "Happy Work Life (Happy Plus) / การงานดี"

            q_0238 "งานของท่าน มีความท้าทายและส่งเสริมให้ท่านได้เรียนรู้สิ่งใหม่ๆ หรือไม่", :pick => :one

            a_1 "ไม่มี/มีน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0239 "งานของท่าน มีความชัดเจนของโอกาสในการเติมโตในตำแหน่งหน้าที่ หรือไม่", :pick => :one

            a_1 "ไม่มี/มีน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0240 "งานของท่าน ในขณะนี้มีความมั่นคง หรือไม่", :pick => :one
 
            a_1 "ไม่มั่นคง/มั่นคงน้อยที่สุด"
            a_2 "มั่นคงน้อย"
            a_3 "มั่นคงปานกลาง"
            a_4 "มั่นคงมาก"
            a_5 "มั่นคงมากที่สุด"

            q_0241 "ในการทำงาน ท่านสามารถแสดงความคิดเห็นและมีส่วนร่วมในข้อเสนอแนะกับนายจ้าง หรือหัวหน้างาน หรือไม่", :pick => :one

            a_1 "ไม่มีส่วนร่วม/มีน้อยที่สุด"
            a_2 "มีส่วนร่วมบ้างเล็กน้อย"
            a_3 "มีส่วนร่วมปานกลาง"
            a_4 "มีส่วนร่วมมาก"
            a_5 "มีส่วนร่วมมากที่สุด"

            q_0242 "ท่านได้รับ การปฏิบัติอย่างถูกต้องตามกฎหมายแรงงาน/พรบ.ข้าราชการ 2551/พรบ.แรงงานรัฐวิสาหกิจสัมพันธ์ 2547/กฎหมายอื่นๆ จากองค์กรของท่าน หรือไม่", :pick => :one

            a_1 "ไม่ได้เลย/ได้รับน้อยที่สุด"
            a_2 "ได้รับเล็กน้อย"
            a_3 "ได้รับพอสมควร"
            a_4 "ได้รับมาก"
            a_5 "ได้รับมากที่สุด"

            q_0243 "ท่านได้รับ การพิจารณาเลื่อนขั้น / เลื่อนตำแหน่ง / ปรับขึ้นเงินค่าจ้างประจำปีที่ผ่านมาด้วยความเหมาะสม หรือไม่", :pick => :one
 
            a_1 "ไม่เหมาะสม/เหมาะสมน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0244 "ความถูกต้อง ของการจ่ายค่าจ้าง ค่าล่วงเวลา ฯลฯ ที่ท่านได้รับจากองค์กรของท่านเป็นอย่างไร", :pick => :one
 
            a_1 "ไม่ถูกต้องทุกครั้ง"
            a_2 "ไม่ถูกต้องบ่อยครั้ง"
            a_3 "ถูกต้องบางเป็นบางครั้ง"
            a_4 "ถูกต้องเกือบทุกครั้ง"
            a_5 "ถูกต้องทุกครั้ง"

            q_0245 "ความตรงเวลา ของการจ่ายค่าจ้าง ค่าล่วงเวลา ฯลฯ ที่ท่านได้รับจากองค์กรของท่านเป็นอย่างไร", :pick => :one
 
            a_1 "ไม่ตรงเวลาทุกครั้ง"
            a_2 "ไม่ตรงเวลาบ่อยครั้ง"
            a_3 "ตรงเวลาบ้างเป็นบางครั้ง"
            a_4 "ตรงเวลาเกือบทุกครั้ง"
            a_5 "ตรงเวลาทุกครั้ง"

            q_0246 "ค่าตอบแทนที่ท่านได้รับ คุ้มค่ากับความเสี่ยงที่อาจเกิดจากการทำงาน (การถูกฟ้องร้อง/การได้รับอันตรายจากการทำงาน ฯลฯ)", :pick => :one
 
            a_1 "ไม่คุ้มค่า/คุ้มค่าน้อยที่สุด"
            a_2 "คุ้มค่าน้อย"
            a_3 "คุ้มค่าปานกลาง"
            a_4 "คุ้มค่ามาก"
            a_5 "คุ้มค่ามากที่สุด"

            q_0247 "ท่านได้รับ การดูแลเกี่ยวกับสุขภาพที่ดีจากองค์กร หรือไม่", :pick => :one
 
            a_1 "ไม่ได้รับ/ได้รับน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0248 "ท่านพึงพอใจ ต่อสภาพแวดล้อมโดยรวมขององค์กร หรือไม่", :pick => :one
 
            a_1 "ไม่พอใจเลย/พอใจน้อยที่สุด"
            a_2 "พอใจน้อย"
            a_3 "พอใจปานกลาง"
            a_4 "พอใจมาก"
            a_5 "พอใจมากที่สุด"

            q_0249 "ท่านพึงพอใจ กับสวัสดิการที่องค์กรจัดให้ หรือไม่", :pick => :one
 
            a_1 "ไม่พอใจเลย/พอใจน้อยที่สุด"
            a_2 "พอใจน้อย"
            a_3 "พอใจปานกลาง"
            a_4 "พอใจมาก"
            a_5 "พอใจมากที่สุด"

            q_0250 "โดยรวมแล้ว ที่ทำงานของท่านให้ความสำคัญกับการทำงานเป็นทีม หรือไม่", :pick => :one
 
            a_1 "ไม่ให้/ให้น้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0251 "โดยรวมแล้ว ความสัมพันธ์ในที่ทำงานของท่านเหมือนพี่เหมือนน้อง หรือไม่", :pick => :one
 
            a_1 "ไม่เหมือน/เหมือนน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0252 "โดยรวมแล้ว ท่านสื่อสารพูดคุยกับเพื่อนร่วมงานในที่ทำงาน หรือไม่", :pick => :one
 
            a_1 "ไม่สื่อสารเลย/สื่อสารน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0253 "โดยรวมแล้ว ในที่ทำงานของท่านมีการถ่ายทอดแลกเปลี่ยนแบบอย่างการทำงานระหว่างกัน หรือไม่", :pick => :one
 
            a_1 "ไม่มี/มีน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0254 "โดยรวมแล้ว ท่านทำงานอย่างมี 'ความสุข' หรือไม่", :pick => :one

            a_1 "ไม่มี/มีน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0255 "ท่านจะแนะนำญาติ/เพื่อน/คนรู้จักมาทำงานที่องค์กรของท่าน หรือไม่", :pick => :one

            a_1 "ไม่/แนะนำน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0256 "หากมีใครกล่าวถึงองค์กรในทางที่ไม่เหมาะสม ท่านจะปกป้ององค์กรของท่าน หรือไม่", :pick => :one
 
            a_1 "ไม่/ปกป้องน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0257 "ท่านภาคภูมิใจที่ได้เป็นพนักงาน/บุคลากรขององค์กร/ได้ทำงานในองค์กรนี้ หรือไม่", :pick => :one

            a_1 "ไม่ภาคภูมิใจ/ภูมิใจน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0258 "ขณะที่ทำงานอยู่ในองค์กรนี้ หากท่านมีโอกาสได้ศึกษาต่อและเมื่อสำเร็จการศึกษาแล้ว ท่านจะทำงานต่อหรือว่าลาออก", :pick => :one
 
            a_1 "ลาออกแน่นอน"
            a_2 "อาจจะลาออก"
            a_3 "น่าจะลาออก"
            a_4 "ไม่ลาออก"
            a_5 "ไม่ลาออกแน่นอน"

            q_0259 "ถ้าท่านมีโอกาสเปลี่ยนสถานที่ทำงาน หรือองค์กรอื่นชวน/ติดต่อไปทำงาน ท่านพร้อมที่จะไป หรือไม่", :pick => :one

            a_1 "ไปแน่นอน/ไปทันที"
            a_2 "คิดว่าจะไป"
            a_3 "ไม่แน่ใจ"
            a_4 "ไม่ไป"
            a_5 "ไม่ไปแน่นอน"

            q_0260 "ท่านรู้สึกเป็นเจ้าของร่วมขององค์กรที่ท่านทำงานในปัจจุบัน หรือไม่", :pick => :one
 
            a_1 "ไม่/ทุ่มเทน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0261 "ท่านทุ่มเททำงาน เพื่อประโยชน์ขององค์การของท่าน หรือไม่", :pick => :one
 
            a_1 "ไม่/ทุ่มเมน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0262 "ท่านเป็นคนคิดใหม่ ทำใหม่ เพื่อสร้างความก้าวหน้าให้กับองค์กรของท่าน หรือไม่", :pick => :one
 
            a_1 "ไม่/น้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0263 "ในแต่ละวัน ท่านทำงานอย่างมีเป้าหมาย หรือไม่", :pick => :one
 
            a_1 "ไม่/น้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0264 "ท่านรู้สึกว่าโดยเฉลี่ย ในหนึ่งสัปดาห์ท่านทำงานกี่วัน", :pick => :one
 
            a_1 "ทำงาน 1-2 วัน"
            a_2 "ทำงาน 3-4 วัน"
            a_3 "ทำงาน 5 วัน"
            a_4 "ทำงาน 6 วัน"
            a_5 "ทำงาน 7 วัน (ทุกวัน)"

            q_0265 "ท่านรู้สึกว่าโดยเฉลี่ย ท่านทำงานวันละกี่ชั่วโมง", :pick => :one

            a_1 "น้อยกว่า 6 ชั่วโมง"
            a_2 "6-8 ชั่วโมง"
            a_3 "9-10 ชั่วโมง"
            a_4 "11-12 ชั่วโมง"
            a_5 "มากกว่า 12 ชั่วโมง"

            q_0266 "ท่านรู้สึกว่าได้พักผ่อนโดยเฉลี่ย (ไม่รวมการนอนหลับตอนกลางคืน) วันละกี่ชั่วโมง", :pick => :one
 
            a_1 "น้อยกว่า 1 ชั่วโมง"
            a_2 "1-2 ชั่วโมง"
            a_3 "3-5 ชั่วโมง"
            a_4 "6-7 ชั่วโมง"
            a_5 "8 ชั่วโมง"

            q_0267 "หน่วยงานของท่าน มีความยืดหยุ่นในการทำงาน หรือไม่ (เช่น ความยืดหยุ่นในการทำงานนอกสถานที่ ไม่ต้องเข้างาน/ออกงานตามเวลาที่กำหนด/สามารถเลือกวันหยุดของตนเองได้ ฯลฯ)", :pick => :one
 
            a_1 "ไม่มี/มีน้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            q_0268 "ท่านทำงานตรงตามวุฒิการศึกษา หรือไม่", :pick => :one
 
            a_1 "ไม่ตรงตามวุฒิ/น้อยที่สุด"
            a_2 "น้อย"
            a_3 "ปานกลาง"
            a_4 "มาก"
            a_5 "มากที่สุด"

            grid "ปัจจุบัน ความสุข ของท่านอยู่ในระดับใด โดยคะแนนจะเรียงจากน้อยไปหามาก เริ่มจาก 0 หมายถึง ไม่มีความสุขเลย ไปจนถึง 10 หมายถึงมีความสุขที่สุด" do

                a "1"
                a "2"
                a "3"
                a "4"
                a "5"
                a "6"
                a "7"
                a "8"
                a "9"
                a "10"
                q_0269 "เลือก", :pick => :one
            end
    end
end
