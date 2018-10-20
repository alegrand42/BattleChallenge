# List of Character
Character.find_or_create_by(name: 'Gorgutz', hp:5, attack:4, background:'Clever among his folk as he is able to think not aloud')
Character.find_or_create_by(name: 'Uriel', hp:4, attack:5, background:'A hero, a great leader...')

# List of weapon
Weapon.find_or_create_by(name: 'iron sword', power: 1, detail: 'simple craft')
Weapon.find_or_create_by(name: 'axe', power: 2, detail: 'rusted')
Weapon.find_or_create_by(name: 'old shield', power: 1, shield: true)
