module MonsterAttack exposing (..)


type alias MonsterDamage =
    String


attackWithWeapon : String -> String -> Int -> String
attackWithWeapon weapon monsterDamage strength =
    String.concat [ monsterDamage, "Attacked with ", weapon, " of strength ", String.fromInt strength, "." ]


attackWithSword1 : MonsterDamage -> Int -> MonsterDamage
attackWithSword1 =
    attackWithWeapon "sword"


attackWithClaw1 : MonsterDamage -> Int -> MonsterDamage
attackWithClaw1 =
    attackWithWeapon "claw"


attackAnn : MonsterDamage -> MonsterDamage
attackAnn monsterDamage =
    attackWithSword1 monsterDamage 5


attackKazak : MonsterDamage -> MonsterDamage
attackKazak monsterDamage =
    attackWithClaw1 monsterDamage 1


attack1 : MonsterDamage -> MonsterDamage
attack1 monsterDamage =
    monsterDamage
        |> attackAnn
        |> attackKazak
        |> attackKazak
        |> attackAnn


attackWithSword2 : Int -> MonsterDamage -> MonsterDamage
attackWithSword2 strength monsterDamage =
    attackWithSword1 monsterDamage strength


attackWithClaw2 : Int -> MonsterDamage -> MonsterDamage
attackWithClaw2 strength monsterDamage =
    attackWithClaw1 monsterDamage strength


attack2 : MonsterDamage -> MonsterDamage
attack2 monsterDamage =
    monsterDamage
        |> attackWithSword2 5
        |> attackWithClaw2 1
        |> attackWithClaw2 1
        |> attackWithSword2 5


attack3 : MonsterDamage -> MonsterDamage
attack3 =
    attackWithSword2 5 >> attackWithClaw2 1 >> attackWithClaw2 1 >> attackWithSword2 5
