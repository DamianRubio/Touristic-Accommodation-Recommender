from recommender.NeighborhoodDatabase import NeighborhoodDatabase


class MenuActions:

    def  __init__(self, uri, user, password):
        self.db = NeighborhoodDatabase(uri, user, password)
    
    def initial_load(self):
        print('Downloading and importing the data...')
        self.db.initial_load()
        print('Graph import finished successfully!')
    
    def close(self):
        self.db.close()

    def recommend_by_touristic_attraction(self):

        beds = int(input("How many people are travelling? "))
        print('''
            Select one of the following touristic point types:
                1. Museos
                2. Música
                3. Arquitectura
        ''')
        touristic_point_type = [
            'Museos', 'Musica', 'Arquitectura'
        ][int(input("Choose a number: ")) - 1]

        print('These are the 10 best housing options for you:')
        recommendations = [r for r in self.db.recommend_by_touristic_attraction(touristic_point_type, beds)]
        
        for i, rec in enumerate(recommendations):
            print('{}. Price: {}. URL: {}'.format(i+1, rec.get('a.price'), rec.get('a.url')))
    
    def recommend_by_business_type_and_age(self):
        # Beds
        beds = int(input("How many people are travelling? "))

        # Business types
        print('''
            These are the available business types:
                1. Deportes
                2. Bebida
                3. Enseñanza
                4. Asociaciones
        ''')
        business_types = [
            'Esports', 'Begudes', 'Ensenyament', 'Associacions'
        ]

        inp = input('Choose your favourite categories of these (eg. 3 2): ')
        business_types = [business_types[int(i)-1] for i in inp.split(' ')]

        # User's age
        age = int(input('What is your age? '))
        if age < 18:
            age_group = 'range18'
        elif age < 24:
            age_group = 'range24'
        elif age < 35:
            age_group = 'range35'
        elif age < 50:
            age_group = 'range50'
        else:
            age_group = 'range60'

        turism_inp = input('Are you looking for touristic places? y/n? (eg. n): ')
        if turism_inp == 'y':
            looks_for_turism = True
        else:
            looks_for_turism = False

        print('These are the 10 best housing options for you:')
        recommendations = [r for r in self.db.recommend_by_business_type_and_age(age_group, business_types, beds, looks_for_turism)]
        
        for i, rec in enumerate(recommendations):
            print('{}. Price: {}. URL: {}'.format(i+1, rec.get('price'), rec.get('url')))
    
