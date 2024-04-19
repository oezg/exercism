export class DnDCharacter {
  strength = DnDCharacter.generateAbilityScore();
  dexterity = DnDCharacter.generateAbilityScore();
  constitution = DnDCharacter.generateAbilityScore();
  intelligence = DnDCharacter.generateAbilityScore();
  wisdom = DnDCharacter.generateAbilityScore();
  charisma = DnDCharacter.generateAbilityScore();

  hitpoints = 10 + DnDCharacter.getModifierFor(this.constitution);;


  public static generateAbilityScore(): number {
    const roll = () => 1 + Math.floor(Math.random() * 6);
    return new Array(4).fill(roll()).sort((a, b) => a - b).slice(1).reduce((a, b) => a + b);
  }

  public static getModifierFor(abilityValue: number): number {
    return Math.floor((abilityValue - 10) / 2);
  }
}
