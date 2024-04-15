export class DnDCharacter {
  strength: number;
  dexterity:number;
  constitution: number;
  intelligence: number;

  wisdom: number;
  charisma: number;
  hitpoints: number;

  constructor() {
    this.strength=DnDCharacter.generateAbilityScore();
    this.dexterity=DnDCharacter.generateAbilityScore();
    this.constitution=DnDCharacter.generateAbilityScore();
    this.intelligence=DnDCharacter.generateAbilityScore();
    this.wisdom=DnDCharacter.generateAbilityScore();
    this.charisma=DnDCharacter.generateAbilityScore();
    this.hitpoints=10+DnDCharacter.getModifierFor(this.constitution);
  }

  public static generateAbilityScore(): number {
    const roll = () => 1 + Math.floor(Math.random()*6);
    let minimum = roll();
    let total = minimum;
    for (let index = 0; index < 3; index++) {
      const current = roll()
      if (current < minimum) {
        minimum = current;
      }
      total += current;
    }
    return total - minimum;
  }

  public static getModifierFor(abilityValue: number): number {
    return Math.floor(abilityValue / 2 - 5);
  }
}
