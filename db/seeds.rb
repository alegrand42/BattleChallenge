# List of Character
Character.find_or_create_by(name: 'Gorgutz', hp:7, attack:4, background:'Clever among his folk as he is able to think not aloud')
Character.find_or_create_by(name: 'Uriel', hp:7, attack:5, background:'A hero, a great leader...')
Character.find_or_create_by(name: 'Red', hp:2, attack:1)
Character.find_or_create_by(name: 'Green', hp:1, attack:4)
Character.find_or_create_by(name: 'Blue', hp:2, attack:3)

# List of weapon
Weapon.find_or_create_by(name: 'iron sword', power: 1, detail: 'simple craft')
Weapon.find_or_create_by(name: 'axe', power: 2, detail: 'rusted')
Weapon.find_or_create_by(name: 'old shield', power: 1, shield: true)
Weapon.find_or_create_by(name: 'awsome shield', power: 2, shield: true)
