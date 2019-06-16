from time import sleep
from recommender.MenuActions import MenuActions

if __name__ == '__main__':
    menu = MenuActions('bolt://localhost:7687', 'neo4j', 'password')

    while True:
        print('''
            These are the options you have:
                0. Exit

                1. Do the initial load of the graph
                2. Recommend me housing options based on my age group
                3. Recommend me housing options based on touristic attractions
        ''')
        chosen_option = int(input('Choose one of the options: '))
        
        if chosen_option == 1:
            menu.initial_load()
            sleep(3)
        elif chosen_option == 2:
            menu.recommend_by_business_type_and_age()
            sleep(3)
        elif chosen_option == 3:
            menu.recommend_by_touristic_attraction()
            sleep(3)
        else:
            print('Goodbye!')
            break

    menu.close()
