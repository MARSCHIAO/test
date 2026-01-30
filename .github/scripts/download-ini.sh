#!/usr/bin/env bash
source "$(dirname "$0")/lib_fetch.sh"

echo "📦 Processing INI Configs..."

# 定义下载列表
urls=(
  "https://raw.githubusercontent.com/szkane/ClashRuleSet/main/Clash/kclash.ini"
  "https://raw.githubusercontent.com/liandu2024/clash/main/Cash-All.ini"
  "https://raw.githubusercontent.com/liandu2024/clash/main/Clash-Full.ini"
  "https://raw.githubusercontent.com/liandu2024/clash/main/Clash-LIAN.ini"
  "https://raw.githubusercontent.com/liandu2024/clash/main/Clash-S01.ini"
  "https://raw.githubusercontent.com/liandu2024/clash/main/Clash-mini.ini"
  "https://raw.githubusercontent.com/liandu2024/clash/main/proxy/clash-all-globe-noicon.ini"
  "https://raw.githubusercontent.com/juewuy/ShellCrash/dev/rules/ShellClash.ini"
  "https://raw.githubusercontent.com/juewuy/ShellCrash/dev/rules/ShellClash_Mini.ini"
  "https://raw.githubusercontent.com/juewuy/ShellCrash/dev/rules/ShellClash_Block.ini"
  "https://raw.githubusercontent.com/juewuy/ShellCrash/dev/rules/ShellClash_Nano.ini"
  "https://raw.githubusercontent.com/juewuy/ShellCrash/dev/rules/ShellClash_Full.ini"
  "https://raw.githubusercontent.com/juewuy/ShellCrash/dev/rules/ShellClash_Full_Block.ini"
  "https://raw.githubusercontent.com/juewuy/ShellCrash/dev/rules/lhie1_clash.ini"
  "https://raw.githubusercontent.com/juewuy/ShellCrash/dev/rules/lhie1_dler.ini"
  "https://raw.githubusercontent.com/juewuy/ShellCrash/dev/rules/ACL4SSR_Online_Mini_MultiCountry.ini"
  "https://raw.githubusercontent.com/juewuy/ShellCrash/dev/rules/ACL4SSR_BackCN.ini"
  "https://raw.githubusercontent.com/juewuy/ShellCrash/dev/rules/ACL4SSR_WithGFW.ini"
  "https://raw.githubusercontent.com/cmliu/ACL4SSR/main/Clash/config/ACL4SSR_Online.ini"
  "https://raw.githubusercontent.com/cmliu/ACL4SSR/main/Clash/config/ACL4SSR_Online_Mini_MultiMode_CF.ini"
  "https://raw.githubusercontent.com/cmliu/ACL4SSR/main/Clash/config/ACL4SSR_Online_Mini_NoAuto_CF.ini"
  "https://raw.githubusercontent.com/cmliu/ACL4SSR/main/Clash/config/ACL4SSR_Online_MultiCountry.ini"
  "https://raw.githubusercontent.com/cmliu/ACL4SSR/main/Clash/config/ACL4SSR_Online_MultiCountry_CF.ini"
  "https://raw.githubusercontent.com/cmliu/ACL4SSR/main/Clash/config/ACL4SSR_Online_Full.ini"
  "https://raw.githubusercontent.com/cmliu/ACL4SSR/main/Clash/config/ACL4SSR_Online_Full_CF.ini"
  "https://raw.githubusercontent.com/cmliu/ACL4SSR/main/Clash/config/ACL4SSR_Online_Full_MultiMode.ini"
  "https://raw.githubusercontent.com/DustinWin/ruleset_geodata/master/rule_templates/DustinWin_Full.ini"
  "https://raw.githubusercontent.com/DustinWin/ruleset_geodata/master/rule_templates/DustinWin_Full_NoAds.ini"
  "https://raw.githubusercontent.com/DustinWin/ruleset_geodata/master/rule_templates/DustinWin_Lite.ini"
  "https://raw.githubusercontent.com/DustinWin/ruleset_geodata/master/rule_templates/DustinWin_Lite_NoAds.ini"
  "https://raw.githubusercontent.com/DustinWin/ruleset_geodata/master/rule_templates/DustinWin_Blacklist_NoAds.ini"
  "https://raw.githubusercontent.com/DustinWin/ruleset_geodata/master/rule_templates/DustinWin_Light.ini"
  "https://raw.githubusercontent.com/DustinWin/ruleset_geodata/master/rule_templates/DustinWin_Nano.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Full_NoAuto.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Full_AdblockPlus.ini"
  "https://raw.githubusercontent.com/youshandefeiyang/webcdn/main/SONY.ini"
  "https://raw.githubusercontent.com/WC-Dream/ACL4SSR/WD/Clash/config/ACL4SSR_Online_Full_Dream.ini"
  "https://raw.githubusercontent.com/WC-Dream/ACL4SSR/WD/Clash/config/ACL4SSR_Mini_Dream.ini"
  "https://raw.githubusercontent.com/justdoiting/ClashRule/main/GeneralClashRule.ini"
  "https://raw.githubusercontent.com/cutethotw/ClashRule/main/GeneralClashRule.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_NoAuto.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_AdblockPlus.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_MultiCountry.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_NoReject.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Mini_NoAuto.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Full.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Full_Google.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Full_MultiMode.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Full_Netflix.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Mini.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Mini_AdblockPlus.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Mini_Fallback.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Mini_MultiCountry.ini"
  "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Mini_MultiMode.ini"
  "https://raw.githubusercontent.com/flyhigherpi/merlinclash_clash_related/master/Rule_config/ZHANG.ini"
  "https://raw.githubusercontent.com/xiaoshenxian233/cool/rule/complex.ini"
  "https://subweb.s3.fr-par.scw.cloud/RemoteConfig/special/phaors.ini"
  "https://raw.githubusercontent.com/flyhigherpi/merlinclash_clash_related/master/Rule_config/ZHANG_Area_Fallback.ini"
  "https://raw.githubusercontent.com/flyhigherpi/merlinclash_clash_related/master/Rule_config/ZHANG_Area_Urltest.ini"
  "https://raw.githubusercontent.com/flyhigherpi/merlinclash_clash_related/master/Rule_config/ZHANG_Area_NoAuto.ini"
  "https://raw.githubusercontent.com/OoHHHHHHH/ini/master/config.ini"
  "https://raw.githubusercontent.com/OoHHHHHHH/ini/master/cfw-tap.ini"
  "https://raw.githubusercontent.com/lhl77/sub-ini/main/tsutsu-full.ini"
  "https://raw.githubusercontent.com/lhl77/sub-ini/main/tsutsu-mini-gfw.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/connershua_new.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/connershua_backtocn.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/lhie1_clash.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/lhie1_dler.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/ehpo1_main.ini"
  "https://raw.nameless13.com/api/public/dl/ROzQqi2S/white.ini"
  "https://raw.nameless13.com/api/public/dl/ptLeiO3S/mayinggfw.ini"
  "https://raw.nameless13.com/api/public/dl/FWSh3dXz/easy3.ini"
  "https://raw.nameless13.com/api/public/dl/L_-vxO7I/youtube.ini"
  "https://raw.nameless13.com/api/public/dl/zKF9vFbb/easy.ini"
  "https://raw.nameless13.com/api/public/dl/E69bzCaE/easy2.ini"
  "https://raw.nameless13.com/api/public/dl/XHr0miMg/ipip.ini"
  "https://raw.nameless13.com/api/public/dl/BBnfb5lD/MAYINGVIP.ini"
  "https://raw.githubusercontent.com/Mazeorz/airports/master/Clash/Examine.ini"
  "https://raw.githubusercontent.com/Mazeorz/airports/master/Clash/Examine_Full.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/nzw9314_custom.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/maicoo-l_custom.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/dlercloud_lige_platinum.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/dlercloud_lige_gold.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/dlercloud_lige_silver.ini"
  "https://unpkg.com/proxy-script/config/Clash/clash.ini"
  "https://github.com/UlinoyaPed/ShellClash/raw/master/rules/ShellClash.ini"
  "https://gist.github.com/jklolixxs/16964c46bad1821c70fa97109fd6faa2/raw/EXFLUX.ini"
  "https://gist.github.com/jklolixxs/32d4e9a1a5d18a92beccf3be434f7966/raw/NaNoport.ini"
  "https://gist.github.com/jklolixxs/dfbe0cf71ffc547557395c772836d9a8/raw/CordCloud.ini"
  "https://gist.github.com/jklolixxs/e2b0105c8be6023f3941816509a4c453/raw/BigAirport.ini"
  "https://gist.github.com/jklolixxs/9f6989137a2cfcc138c6da4bd4e4cbfc/raw/PaoLuCloud.ini"
  "https://gist.github.com/jklolixxs/fccb74b6c0018b3ad7b9ed6d327035b3/raw/WaveCloud.ini"
  "https://gist.github.com/jklolixxs/bfd5061dceeef85e84401482f5c92e42/raw/JiJi.ini"
  "https://gist.github.com/jklolixxs/6ff6e7658033e9b535e24ade072cf374/raw/SJ.ini"
  "https://gist.github.com/jklolixxs/24f4f58bb646ee2c625803eb916fe36d/raw/ImmTelecom.ini"
  "https://gist.github.com/jklolixxs/b53d315cd1cede23af83322c26ce34ec/raw/AmyTelecom.ini"
  "https://subweb.s3.fr-par.scw.cloud/RemoteConfig/customized/convenience.ini"
  "https://gist.github.com/jklolixxs/ff8ddbf2526cafa568d064006a7008e7/raw/Miaona.ini"
  "https://gist.github.com/jklolixxs/df8fda1aa225db44e70c8ac0978a3da4/raw/Foo&Friends.ini"
  "https://gist.github.com/jklolixxs/b1f91606165b1df82e5481b08fd02e00/raw/ABCloud.ini"
  "https://raw.githubusercontent.com/SleepyHeeead/subconverter-config/master/remote-config/customized/xianyu.ini"
  "https://subweb.oss-cn-hongkong.aliyuncs.com/RemoteConfig/customized/convenience.ini"
  "https://raw.githubusercontent.com/Mazeorz/airports/master/Clash/SSRcloud.ini"
  "https://raw.githubusercontent.com/Mazetsz/ACL4SSR/master/Clash/config/V2rayPro.ini"
  "https://raw.githubusercontent.com/Mazeorz/airports/master/Clash/V2Pro.ini"
  "https://raw.githubusercontent.com/Mazeorz/airports/master/Clash/Stitch.ini"
  "https://raw.githubusercontent.com/Mazeorz/airports/master/Clash/Stitch-Balance.ini"
  "https://raw.githubusercontent.com/SleepyHeeead/subconverter-config/master/remote-config/customized/maying.ini"
  "https://subweb.s3.fr-par.scw.cloud/RemoteConfig/customized/ytoo.ini"
  "https://raw.nameless13.com/api/public/dl/M-We_Fn7/w8ves.ini"
  "https://raw.githubusercontent.com/SleepyHeeead/subconverter-config/master/remote-config/customized/nyancat.ini"
  "https://subweb.s3.fr-par.scw.cloud/RemoteConfig/customized/nexitally.ini"
  "https://raw.githubusercontent.com/SleepyHeeead/subconverter-config/master/remote-config/customized/socloud.ini"
  "https://raw.githubusercontent.com/SleepyHeeead/subconverter-config/master/remote-config/customized/ark.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/n3ro_optimized.ini"
  "https://gist.githubusercontent.com/tindy2013/1fa08640a9088ac8652dbd40c5d2715b/raw/scholar_optimized.ini"
  "https://subweb.s3.fr-par.scw.cloud/RemoteConfig/customized/flower.ini"
  "https://raw.githubusercontent.com/SleepyHeeead/subconverter-config/master/remote-config/special/netease.ini"
  "https://raw.githubusercontent.com/SleepyHeeead/subconverter-config/master/remote-config/special/basic.ini"
)

# 构建任务列表 (url|output_path)
# 将输出路径改为 Overwrite/THEINI
TASKS=""
for url in "${urls[@]}"; do
  # 自动分类
  if [[ "$url" == *"ACL4SSR"* ]]; then
    category="ACL4Category"
  elif [[ "$url" == *"jklolixxs"* ]] || [[ "$url" == *"/customized/"* ]] || [[ "$url" == *"Mazeorz/airports"* ]]; then
    category="Airport"
  else
    category="Ordinary"
  fi

  # 提取作者
  if [[ "$url" == *"github"* ]]; then
    author=$(echo "$url" | cut -d '/' -f 4)
  else
    author=$(echo "$url" | awk -F/ '{print $3}')
  fi
  
  filename=$(basename "$url")
  # 关键修改：路径指向 Overwrite/THEINI
  output="Overwrite/THEINI/$category/$author/$filename"
  TASKS+="$url|$output"$'\n'
done

# 执行并行下载 (6线程)
run_parallel_tasks "$TASKS" 6

# 生成 Overwrite/THEINI 目录的 README
echo "📝 Generating THEINI README..."
# 确保目录存在，否则进入失败
mkdir -p Overwrite/THEINI
cd Overwrite/THEINI || exit 0

echo "# 📂 INI Config Collection (THEINI)" > README.md
echo "" >> README.md
echo "Last Updated: $(date "+%Y-%m-%d %H:%M:%S") (Beijing Time)" >> README.md
echo "" >> README.md
echo "## 📊 File Structure" >> README.md
echo "" >> README.md
echo "\`\`\`text" >> README.md
# 生成当前目录树
tree -L 3 --dirsfirst -I 'README.md' --charset=utf-8 >> README.md
echo "\`\`\`" >> README.md

cd ../..
