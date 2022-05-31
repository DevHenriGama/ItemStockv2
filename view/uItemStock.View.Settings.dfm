object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmSettings'
  ClientHeight = 257
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Configura'#231#245'es'
    Color = 6316128
    Constraints.MaxHeight = 24
    Constraints.MinHeight = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Image1: TImage
      AlignWithMargins = True
      Left = 463
      Top = 3
      Width = 24
      Height = 18
      Align = alRight
      AutoSize = True
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
        00180806000000E0773DF80000000473424954080808087C0864880000000970
        485973000000B1000000B101C62D498D0000001974455874536F667477617265
        007777772E696E6B73636170652E6F72679BEE3C1A000000F54944415478DA9D
        95BB0EC2300C45E3999D2F05065E03AF81F2BB488889388A8B098E63FB4A5652
        B53DA74D9A14D26FCEB9DEB58D649D6B59DB1268E0FBDA3F062408BDD7FE8324
        24E0708A47C2E19422810EDC2391E0B30405AB5C9302D0241A1C73A0218A4886
        F05C173EC91E89098E1D684E6C735D951B77B51D5D73A303102E18BD8996F9C9
        354154F207D7045E89081F09AC922EDC22187D2D1875316A020B7C28E9093C70
        55220922F0AEA4155856E82B39B6152E302FFFE4D85648E081534C1208C2CD12
        149C2AC40BB748261A224962816B123CDEF049E6120F5C92143876DACF14F7F9
        6762FBB933F83F59A4EF7F237D00AB394B270DC92E070000000049454E44AE42
        6082}
      OnClick = Image1Click
      ExplicitLeft = 613
      ExplicitHeight = 24
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 233
    Width = 490
    Height = 24
    Align = alBottom
    BevelOuter = bvNone
    Color = clBtnText
    Constraints.MaxHeight = 24
    Constraints.MinHeight = 24
    ParentBackground = False
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 24
    Width = 490
    Height = 65
    Align = alTop
    Caption = 'Geral'
    TabOrder = 2
    ExplicitTop = 27
    object Image3: TImage
      AlignWithMargins = True
      Left = 453
      Top = 20
      Width = 32
      Height = 40
      Align = alRight
      AutoSize = True
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF40000000473424954080808087C0864880000000970
        4859730000014B0000014B013BC21B460000001974455874536F667477617265
        007777772E696E6B73636170652E6F72679BEE3C1A000001C14944415478DAED
        974F2804511CC7DFA39C28DAF2E7C641899428E2E6B65252943D2814B5278E8A
        837520572E884239D8E2A2C4456EAB14175172E0E64F89E242313ECF8C5A6B66
        32EBCD6E5BFBEADBFBCDEFF79BDFEF33B3F3DECC4A2144217A14FE8D57D46918
        C69E5D50A600C015C20EE005ED6B6A5C8D2ADD20EC002E48AAD2D15D4A39C334
        EA76271C0138B914FB26CE5F86FFF69F00BF20D201F003225D00DF10817402A8
        5194057003C8C12E8EF3DFE3FF4805C0138A7A69E4329A509D5780548E2C40E6
        02ACA30D74621DD7A310EAF51BE0593561396EDB0559761D165C815F0043345F
        B6F688306AB7FC3B6841ED13C406B197FC0038A4418B75A59B4C5D09F12DE2DD
        563CC6D4AC1B609A06E3140F62EF3AE4B47DBD62A59CC21ED30D10A27894E211
        EC09879C497222E4F408F321D50A3042F1398AABDF7EDE21274CCE2239C3D8B3
        BA01D628DE4FF112EC331448883FA01A72EEC859C5EED30DA0BE966B69704D03
        F530AAE55661C5AE84B93C63C4CAB14F51BE6E00350E5090466F34CA15E667B7
        1AE7F8DEF1E561AB8FCDD63FD64B6A2754573740C3E37827CD1B9856D45DF250
        2BE9ADD84097E8C83A6E14E61F10E9B14EE6BE8CB200DA003E015271F6AA56E1
        DFB50000000049454E44AE426082}
      OnClick = Image3Click
      ExplicitLeft = 304
      ExplicitTop = 6
      ExplicitHeight = 32
    end
    object ckStartOnSys: TCheckBox
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 132
      Height = 40
      Align = alLeft
      Caption = 'Iniciar com o Sistema'
      TabOrder = 0
      ExplicitLeft = 16
      ExplicitTop = 24
      ExplicitHeight = 17
    end
    object ckStartMin: TCheckBox
      AlignWithMargins = True
      Left = 143
      Top = 20
      Width = 128
      Height = 40
      Align = alLeft
      Caption = 'Iniciar Minimizado'
      TabOrder = 1
      ExplicitLeft = 170
      ExplicitTop = 24
      ExplicitHeight = 17
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 89
    Width = 490
    Height = 144
    Align = alClient
    Caption = 'Servi'#231'o API'
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 32
      Width = 31
      Height = 15
      Caption = 'Porta:'
    end
    object Label4: TLabel
      Left = 176
      Top = 32
      Width = 13
      Height = 15
      Caption = 'IP:'
    end
    object Label5: TLabel
      Left = 16
      Top = 96
      Width = 3
      Height = 15
    end
    object lblIPAddress: TLabel
      Left = 195
      Top = 32
      Width = 33
      Height = 15
      Caption = '0.0.0.0'
    end
    object Image2: TImage
      AlignWithMargins = True
      Left = 357
      Top = 20
      Width = 128
      Height = 119
      Align = alRight
      AutoSize = True
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000800000
        00800806000000C33E61CB0000000473424954080808087C0864880000000970
        4859730000037600000376017DD582CC0000001974455874536F667477617265
        007777772E696E6B73636170652E6F72679BEE3C1A00000C1D4944415478DAED
        5D0BD0555515DE97322B276524F335D868E3A46256039A4E262406457FEAE420
        583035F6323432AD040D901F21CDDE84356AD918344A69F902B3411EC98009E5
        54569695D343D34A2D272B32E8FBEE39FFEFE5FFEFBDFF3D7BAFB5D7B9E7EE6F
        66CD1E1E77EFB5D6FECE39FBECBDD63AB55DBB76B92AA256ABBD0DCD2C481FE4
        C59EDD3C03B91DB2127EBACDDA260DD4AA48004CFE9BD0DC25DCED14F8EAFBD6
        B649A37204C0E4BF10CD0390C384BBFE2D641CFCF56F6B1B25514502BC05CD1A
        A5EEA7C15F6BAD6D9444150970399A8B94BABF02FE9A676DA324AA48802D688E
        57EA7E2BFC7582B58D92A8140130F97BA1790AF27CA5219E858C86CFFE696DAB
        14AA46802968BEA73CCC54F84CFA0DC30C5523C05234172B0FB30C3EBBC4DA56
        29548D00F7A079BDF2309BE1B313AD6D9542650880C97F91CB9EFF2F501E6A87
        CBD601FFB2B659025522C0C968D6451A6E32FC76B7B5CD12A81201FAD12C8834
        DC12F86DA1B5CD12884280FCF56C3AE40F906D18F3EF0A636C447392BA311936
        C18689C2FAD347E32187436E46FF4FC630449D0030EC4234F32163F2BFDA09B9
        0E320F63FF55680CEEFFF3F9BFA7AA31CFE13F2E5B07049F0B40F7BDD15C0AF9
        907B6EFFE269C8E7218B31C6FF340D5125008CFB1C9AF35BFC3319CE57B6ABA1
        C3CEC07178356E5033A4392641EF8D817AF3B8FA4AC8012DFECB2AC8BB3449A0
        46801126BF11DB2173A0C70F03C6E2F378B18A21ADB1083AF77BEAFB2A342B20
        6FE8E0BFAB9240850005267F0054E25AC87CE8F3B78263BD12CD6AC8311A0E6A
        839F406640DF5F16D0751F9711F53CC8F30A8CA546027102784C7E239E70D97A
        E1DA768F058C310A0D8F7DF9DCE4F66F4DDA3105C0574F5ECDB7B69A20E84BFD
        66433E05D9DF731C151288122070F21B719FCB1E0BDB86F4CF2BE86CC8B99057
        483A42007F847CC565E47DAC41E757BB8C20123B94E224102380E0E40F807780
        6B5CB650E42289573BAFA2BD04C7D000770ABF0DF92AE474C81C57EC763F1244
        4920420085C96F048F5ECB3EE9B12146826002284F7E426B889020880069F2CD
        114C026F02A4C92F0D8248E045004CFE075CB6E24D28072EC53C7A6D84152600
        267F0F340F410EB1B63A61103C5C7BB9CF219B0F014E4153B90C990A6036E672
        65D11FF910602C9ADF5B5B9B300CC7612EEF2BFA23DF350077BD0EB6B6386110
        0C4FE3F1F48EA23FF4250077B756585B9D30887ECCE3229F1FFA12808731DCA7
        7FADB5E509EE772E4B5AF50A520DD907608AD466677B1297E0DC6998C35B7D7F
        1CBA13C8D0AE775B7BA0877107E6AF2FA4835002BC0CCDAF20FB587BA207C178
        C4A3317FBF09E944E230682E9A2F587BA307E1BDF06B84040178D6FD23173F24
        AB9711B4F06B84543C00831B37597BA5007870F238E491FCCF0741F838930CDC
        D044D0C2AF11921141DF705955AEB2E11F10967561952F06703E0A796CE8E959
        7E2763BCDE81902320AC32C6B8C3BDAD0D1882E085DF6E760B1280615B0FBA72
        388C0927DF82DC0259EFB34396DBC444D337424E735966D34B8DED1259F8ED66
        A37050E805683E63E09801B0AE1FE31458CBE769C98E61DB4B5C567BE823CEBF
        EE602844167EBBD9254C00A636DD0F1917D9310C20FD3A6401EC7924B0AF916C
        E47A6189CBF63F4645B67322EC135D6B69E405DC89666A44A7B07EDF19B0E3FE
        8863D2CED7A0B9C9C9D7236C8755B053749D257D07A033182C126B7B9839FAD3
        61C31391C61B6AEFBE2E5B6B9C1C6948AE65C6C2DEC7C56C1026C015683E1EC9
        19CB211740FF67238DD7CA663EF63EEBB2BC8518B804362F13D35FF02D802B66
        C609EC17C10973A1F7F208E314B19F04F86284A15863E1D0522586E40E380BCD
        3723386039749E1B611C1F1F900031EE046F870FBE23A2B320016254E8E0337F
        AAF56DBF8D0FF838609D42ED35C13AF8E014119D85B6828F7259856E4D70B57F
        ACD582AF802FB830646C9EF6DBC1914552D35BEA1B1010C2B22CAF83B03AC719
        4EF73088EFF9E363BFEAF9227F4564E10BCD7D02D627E06B28EFBCF7FA96ABE9
        9800791D3E46014D72D9A473F263D5E4F91AF47C4FA4B144007F313BF8EC48C3
        B166D1BD2E23C306C8964E4F0A5B1220AF5AC59CF689B91CEBF48B303603B777
        0FD7DEE19346BE63F86B67B36DCCFD023E8636E6B2B95581EB4102E4B7741E7C
        0C4CF804A75775BB089642C74F582BE103F8F4323465A82BCC453383780708B1
        7EE091512740FE8D1DE6FAC5DCD6EC043CD53B4CFA602716F203242E5EAD4F11
        87823A9DC36F2071CB96E7DE22C1050AF832949C63AD44084082ABD07CD05A8F
        16389504B81172A6B5262DF0661040BBFEBF2A40001E8CDD69AD470BAC2601B8
        38B03ADF6E0746F2ECE71BCC5116E45BE47F71E50894198A674880B2568BBE11
        933FD35A0909800437A09961AD4753DD5C7909300B045865AD8404408077A229
        9CBA1D4537575E024C0001B65B2B2101108055C0B70577A4A19B2B2F010EEEB6
        CD9F56C83785FE64AD4753DD5C3909C0B3EE3DB54BA5C7421E72CEEDDAD2E51D
        9495008F62F20FB25642122001EF66075AEB314C2F574E026C070126582B2109
        10806B80F1D67A0CD3CB25024441224031A447402CBD5C3909901681B17473E5
        2400915E0363E8E6CA4B80B411144337575E02A4ADE018BAB9F212201D06C5D0
        CDA5E3605574C371700A085144370484A4903045943E242C0585EAA12B824253
        58B81EBA262CBC85F2293124005D9718D281412935AC00BA3E35AC0303537268
        6BDF542F397404835958F1178AC612293D7C77D8A68737319C1F9212295AD006
        A94044EE07F860B288CE8204E0879245CA968C805422262B8B77B388CE8204E0
        59376FD331BE27D8CB45A25888EB50A9BBA07499B8F968C44A988D805E2D13B7
        10362F11D35F98002C11C73266B15E0F7BAD50E47F2187C0DE3F8BD9A0502AF6
        7A34B3233984E8A552B137C0CEB344ED502000F706B646740AD12BC5A24F877D
        B788DAA340005EFDD7C7F44A03AA5E2E7E2DEC9A266A97F01A80410FFC8AD8FE
        911D331455FD6004217A17902600AFBEF32DBCD20655FB64CCC390A3243E1855
        B75B701FE068343F76E538421E09DDFED1A8CB306F0B243A9224C006971D0C25
        E883A77FFC76D043A11D491D06BD034D2542B8BB08220B42890F477275CC676B
        A572F9BA04C10B4209027C1ACD85D69EE8513CEC021784A11F8F669978EEC0ED
        61ED891E46D082309400EB5CBC7DF084E6085A10868484716364B5B5F50975AC
        C13CBED5E7872104E0E2E3546BCB130631C6E754348400DC513BC0DAEA844178
        A5D1791120DF3665644A224079D087B9BCA3E88F42EE001F4573A5B5D50975FC
        0C72CC2E8FC90C21003387986E7484B5F53D0E86C4F5F9665187BE06F211B0DE
        25125881933F137378936F07123B81890436089E7C42EA302891202E181C3A53
        223740F23838916038E8DC9A709F62934F484704499380D13C0B5D966BC72A1B
        DC7D8C1572EE0BC625B222D897204CA05DE1B2D47A0970F267487D389AD0080A
        9522019DF8B1C618F83CEFE07D9073206345150F07C3D3590E86A9EC4F36E83C
        2AD7990933FB06F4CFC93F137D7F5752697102E4468790E0A79073A1D70FDAF4
        CF8D28C6EC9D07114992F4049DC7A4586629713F7E671B9DC7A0F924E4BDAEF8
        634165F2EB7A69102037B82809066EF72B8AA47BE5A9E9AC74A6599FA019989F
        CF4979B0A05F8E73D99DA2D3CAE19CFCE9D2F90083FA68112037B653120CBBDD
        171C87C459AC6648732C82BEFD9EFAF2B1F07EC852D7FEB1A03AF9755D340990
        1BDB8E0423DEEE3B1C83C1A81B540D198E49D07B63A0DECC33B8DC65A564863E
        1698CBC0C9572DE1A74E80DC50C60D7ED86559355C19337C9CB104574964F7E6
        E56A9E72F1DE10188431DAB72C4B13FD994E37CF652577989BC0A4967EF4FF73
        6D43A210A0C150169ADAA1F11D00F4CDABF1A448A66C820D2A21F0BC5862D645
        8C4A0055436A353E8F4592253AC012F86DA1B5CD12A81201189BB82ED27093E1
        B7BBAD6D96409508C0C70BD701DAC52CB9381B2D959B678DCA10A06E4CAD768F
        CBAA9B6A8255374FB4B6550A552300DFAB2F561E66197C5686FABF22A81A01A6
        B8AC4E9F2658A7F02E6B5BA5503502304C8DEB00AD1475EE598C6E5578B91B51
        2902D40DAAD5B6A0395EA9FBADF0D709D6364AA28A04E0D6EA454ADDB3F6D03C
        6B1B25514502B0ACCB1AA5EEA7C15F6BAD6D94441509C07381079C7CFD3E067C
        8C93DAFF2F0B2A4780BA51D93790A457EA53F88D1D6BDBA4514902D40DABD518
        31340BD2E7FCEBFA31BEEF76C84AF8E9366B9B34F07F0C72B7501045BB200000
        000049454E44AE426082}
      ExplicitHeight = 128
    end
    object ckAPIAuto: TCheckBox
      Left = 16
      Top = 96
      Width = 121
      Height = 17
      Caption = ' '
      TabOrder = 0
    end
    object btnAPI: TButton
      Left = 176
      Top = 86
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 1
    end
    object edtPort: TEdit
      Left = 16
      Top = 53
      Width = 121
      Height = 23
      BorderStyle = bsNone
      MaxLength = 5
      NumbersOnly = True
      TabOrder = 2
      Text = '8082'
    end
  end
end
