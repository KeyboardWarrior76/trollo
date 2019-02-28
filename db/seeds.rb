


User.create(
    email: "fake@mail.com",
    password: "password",
    first_name: Faker::Name.first_name(),
    last_name: Faker::Name.last_name(),
    avatar: Faker::Avatar.image()
)

for i in (1..4)
    User.create(
        email: Faker::Internet.email(),
        password: "password",
        first_name: Faker::Name.first_name(),
        last_name: Faker::Name.last_name(),
        avatar: Faker::Avatar.image()
    )
end

User.all().create() {|user|
    board = Board.create(
        board: Faker::Verb.simple_present() + Faker::Games::SuperSmashBros.stage(),
        public: Faker::Boolean.boolean,
        picture: "assets/images/night.jpg"
    )

    UserBoard.create(
        user_id: user.id,
        board_id: board.id
    )

    for i in (1..3)
        list = List.create(
            list: Faker::Verb.base() + " today",
            order: "default",
            user_id: user.id,
            board_id: board.id
        )

        val = Random.rand(1..7)
        for i in (1..val)
            Item.create(
                item: Faker::Verb.ing_form(),
                priority: "N/A",
                details: Faker::Lorem.sentence(20),
                user_id: user.id,
                list_id: list.id
            )
        end
    end
}


puts "\n__________ Database Seeded __________\n\n"