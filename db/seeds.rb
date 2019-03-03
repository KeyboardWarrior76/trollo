

Item.destroy_all()
List.destroy_all()
UserBoard.destroy_all()
Board.destroy_all()
User.destroy_all()

pictures = ["/assets/snowy-road.jpg", "/assets/mountain-lake.jpg", "/assets/waves.jpg", "/assets/stairs.jpg", "/assets/ladybug.jpg", "/assets/gorge.jpg", "/assets/city.jpg"]

User.create(
    email: "fake@mail.com",
    password: "password",
    first_name: Faker::Name.first_name(),
    last_name: Faker::Name.last_name(),
    avatar: Faker::Avatar.image()
)

# for i in (1..2)
#     User.create(
#         email: Faker::Internet.email(),
#         password: "password",
#         first_name: Faker::Name.first_name(),
#         last_name: Faker::Name.last_name(),
#         avatar: Faker::Avatar.image()
#     )
# end

User.all().each() {|user|
    for i in (0..6)
        # val = Random.rand(pictures.length).to_i

        # board = Board.create(
        #     board: Faker::Games::SuperSmashBros.stage(),
        #     public: Faker::Boolean.boolean(),
        #     picture: pictures[val]
        # )

        board = Board.create(
            board: Faker::Games::SuperSmashBros.stage(),
            public: Faker::Boolean.boolean(),
            picture: pictures[i]
        )
    
    
        UserBoard.create(
            user_id: user.id,
            board_id: board.id
        )
    
        for i in (1..3)
            list = List.create(
                list: Faker::Verb.base() + " today",
                order_by: "Priority",
                user_id: user.id,
                board_id: board.id
            )
    
            val = Random.rand(1..7)
            for i in (1..val)
                Item.create_item(
                    item: Faker::Verb.ing_form(),
                    priority: "N/A",
                    details: Faker::Lorem.sentence(20),
                    user_id: user.id,
                    list_id: list.id
                )
            end
        end
    end

}


puts "\n__________ Database Seeded __________\n\n"