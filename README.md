# NovaLang Dungeon

A small turn-based dungeon crawler that runs in your terminal, written entirely in NovaLang.

You go down into the dungeon one fight at a time. Every fight is against a random monster. You trade blows, drink potions when things look bad, and run when you have to. Your health carries over from one fight to the next, so each step deeper is a gamble. When you stop, you see a record of every battle you've fought.

```
=== NOVALANG DUNGEON ===
What is your name, adventurer? Ada
Welcome, Ada. Descend and survive.

A wild Wraith appears! (28 HP, 6 ATK)

Ada   [####################.] 30/30 HP   potions: 3
Wraith   [####################.] 28/28 HP
(a)ttack, (p)otion, (f)lee > a
You strike the Wraith for 5 damage.
The Wraith hits you for 7 damage.
```

---

## Requirements

- **Python 3.7 or newer.** Nothing else is needed: there's no `pip install` and no build step.

The NovaLang interpreter (`novalang.py`) is included in this repository.

## Running the game

From the repository folder, run:

```sh
python3 novalang.py dungeon_crawler.nova
```

On macOS you can instead double-click **`Play Dungeon Crawler.command`**. It opens a Terminal window and starts the game. If macOS blocks it the first time, right-click it and choose **Open**.

The game saves its battle log to `dungeon_log.jsonl` in your **current working directory**. Run it from the same folder each time if you want one continuous history.

---

## How to play

1. Enter your name, or press Enter to play as *Wanderer*.
2. A random monster appears. On each turn, pick an action:

   | Input           | Action | What happens |
   |-----------------|--------|--------------|
   | `a` / `attack`  | Attack | You hit the monster, and then it hits back if it's still alive. |
   | `p` / `potion`  | Potion | You heal, and then the monster still gets its attack. |
   | `f` / `flee`    | Flee   | You leave the fight right away. The monster doesn't get a parting hit. |

   Input isn't case-sensitive, and spaces around it are ignored.
3. After you win or flee a fight, you're asked **"Descend further?"**. Answer `y` or `yes` to fight again. Any other answer ends the run.
4. The run also ends when your HP reaches 0.
5. At the end you see your battle history: how many fights you've had and won, with one line per battle.

### Tips

- **Your HP doesn't regenerate between fights.** The only way to heal is a potion, and you get just three for the whole run.
- A potion turn still lets the monster hit you. Drinking at very low HP against a hard hitter can still get you killed.
- Fleeing is free and has no penalty, so you can escape an Orc Brute you don't like the look of. It does still count in your history.

---

## Game reference

### You

| Stat    | Value |
|---------|-------|
| HP      | 30    |
| Attack  | 6 (each hit deals `randint(4, 9)` damage) |
| Potions | 3 (each heals `randint(8, 15)` HP, up to max HP) |

### Monsters

Each monster deals `randint(ATK − 1, ATK + 2)` damage per hit.

| Monster     | HP | ATK |
|-------------|----|-----|
| Cave Slime  | 14 | 3   |
| Goblin      | 18 | 4   |
| Skeleton    | 24 | 5   |
| Wraith      | 28 | 6   |
| Orc Brute   | 32 | 7   |

### Battle log

The game adds one JSON object per battle to `dungeon_log.jsonl`:

```json
{"time": "2026-10-24 21:14:03", "result": "win", "monster": "Goblin", "turns": 4}
```

`result` is one of `win`, `loss` or `fled`. To reset your history, delete the file. If the log can't be written, the game prints a warning and carries on.

---

## Modding

All the game's balance numbers are near the top of `dungeon_crawler.nova`:

- **Add or change monsters** in `random_monster()` with `make_monster(name, hp, atk)`.
- **Change your starting stats** in `make_player()`.
- **Change damage and healing ranges** in `player_attack()`, `monster_attack()` and `use_potion()`.

## Project layout

```
.
├── dungeon_crawler.nova           # the whole game
├── novalang.py                    # NovaLang interpreter (v1.1.0)
├── Play Dungeon Crawler.command   # double-click launcher for macOS
├── LICENSE                        # MIT licence for NovaLang
└── README.md
```

## License

NovaLang is released under the MIT License. See [`LICENSE`](LICENSE).
