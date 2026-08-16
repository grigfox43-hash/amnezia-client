import os
from PIL import Image

src_mob = 'icon_mob.png' if os.path.exists('icon_mob.png') else 'icon.png'
img = Image.open(src_mob).convert('RGBA')

# 1. Android mipmap icons
android_sizes = {
    'ldpi': 36,
    'mdpi': 48,
    'hdpi': 72,
    'xhdpi': 96,
    'xxhdpi': 144,
    'xxxhdpi': 192
}

for density, size in android_sizes.items():
    resized = img.resize((size, size), Image.Resampling.LANCZOS)
    target_dir = f'client/android/res/mipmap-{density}'
    os.makedirs(target_dir, exist_ok=True)
    
    resized.save(f'{target_dir}/icon.png')
    resized.save(f'{target_dir}/icon_round.png')
    resized.save(f'{target_dir}/ic_launcher_foreground.png')

print('Android mipmap icons generated.')

# 2. iOS launch image
launch_img = img.resize((1024, 1024), Image.Resampling.LANCZOS)
launch_dir = 'client/ios/app'
os.makedirs(launch_dir, exist_ok=True)
launch_img.save(f'{launch_dir}/launch.png')
print('iOS launch.png generated.')

# 3. iOS AppIcon set
ios_sizes = [20, 29, 40, 50, 57, 58, 60, 72, 76, 80, 87, 100, 114, 120, 144, 152, 167, 180, 1024]
ios_dir = 'client/ios/app/Media.xcassets/AppIcon.appiconset'
os.makedirs(ios_dir, exist_ok=True)
for s in ios_sizes:
    resized = img.resize((s, s), Image.Resampling.LANCZOS)
    resized.save(f'{ios_dir}/{s}.png')

print('iOS AppIcon set generated.')
