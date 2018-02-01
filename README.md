![Challgen accepted](https://www.pubnub.com/wp-content/uploads/2014/08/determined-challenge-accepted-l.png)
I uploaded this to Heroku to enable yours to try it

### All the request on this api should be done with `GET/POST` requests
# Instructions


----------


## ZOMBIES

**View a list of all Zombies with a GET request**

    /api/v1/zombies

> We can use params for filter with properties between all zombies adding params to the GET request params as for example:

    name: zombhson
    hit_points: 40
 Request can looks like:
 **GET** http://localhost:3000/api/v1/weapons?name=zombhson&hit_points=40
 *This is an example, remember to check first available zombies and attributes.. i suggest a REST client like [Insomnia](https://insomnia.rest/) for do it*.

----------

**View a single Zombie with a GET request**

    /api/v1/zombies/id_number
For example:

    /api/v1/zombies/72


> *We can view attached armors or weapons just adding* `/armors` *or* `/weapons` *to the request a complete request will look something like
> this* `/api/v1/zombies/72/armors` *and* `/api/v1/zombies/72/armors/details` *will
> show the model details of related armors /weapons.*


----------
 **Create Zombies!!!**

Maybe you want to create a zombie, it's easy as make a **POST** request like this:

    api/v1/zombies/

> **Add attributes!** like name, hit_points, brains_eaten or speed with a value.
> `/api/v1/zombies/?name=Grigyor&hit_points=12&brains_eaten=15&speed=7`


----------
**Update Zombie attributes**

Change the attributes of a zombie with a **POST** request to

    /api/v1/zombies/id_number/update

For example **POST** `/api/v1/zombies/153/update?name=Grigyor&hit_points=12&brains_eaten=15&speed=4`

----------

**Destroy a Zombie**

 Destroy with a **POST** request to:  


    /api/v1/zombies/id_number/destroy

*Looks like* `/api/v1/zombies/153/destroy`

> **NOTE:** When we destroy a zombie, we destroy all attached armor / weapons to that zombie.

----------


## Add armors and weapons to a zombie!!!

First them all we must check our catalog also for armors and weapons and find the **id** number of the armor or weapon model we want to add to the zombie.

Then, with just a **POST** to `/api/v1/zombies/zombie_id/armors/armor_id` we attach an armor to the zombie.
*An example will look like* `/api/v1/zombies/153/armors/45`*. remember that we can find info about know the info near the beginning of instructions. The same way is used to weapons, just replace **armors with weapons***


----------

## Remove armors and weapons from a zombie

We must find the **zombie weapon id** (not the detail id!) and make a **POST** request to `/api/v1/zombies/zombie_id_number/weapons/zombie_weapon_id/destroy` it must looks like this: **POST** `/api/v1/zombies/153/armors/7/destroy`


----------

## Armors and Weapons
> *As we done in zombies, this is kind similar.*
> *You can replace armor with weapon references for change the same kind of action*

----------
**List armors or weapons**
Just with a **GET** request to `/api/v1/armors` as we done before with zombies must list all the armors or weapons, also we can add attributes in the same way:
http://localhost:3000/api/v1/armors?defense_points=6


----------


**Show single armors or weapons**
Add the **armor id**  to the end of the route, something like
`/api/v1/armors/22` this will show the details for a single armor model.
*Replace as we said with weapons the armors reference if you want weapons.*

----------

**Create armors or weapons**
Make a **POST** request to `/api/v1/armors/`with armors/weapons attributes.

> *As we done before with zombies,* **POST**  `/api/v1/armors?defense_points=40&name=malla%20de%20zombhrill&price=120&durability=60`


----------


**Update armors or weapons**

Make a **POST** request to `/api/v1/armors/armor_id/update`with armors/weapons attributes.

> *As we done before with zombies,* **POST**  `/api/v1/armors/38/update?defense_points=40&name=malla%20de%20thorium&price=120&durability=60`


----------


**Destroy armors or weapons**

With a **POST** request to `/api/v1/armors/armor_id/destroy` will destroy that armor /weapon and the attached models of that weapons to zombies.


----------

Notes about the Challenge:

This was an excellent/joyfull exercise for building a REST API, i builded it as a versionable API, this means that it's possible to release newer versions with newer features without cause issues to the users/clients that already uses the API in his platforms.

Installation can be easy done as a normal Rails API app on local machine.  Check the `routes.rb` file for a complete understand of how http requests must be done.

Tests with Rspec was "scaffolded"

Greetings,
Marcos

# Badi Coding Challenge - Backend (Ruby on Rails)
![Zombies at Badi](https://user-images.githubusercontent.com/4199523/33260366-e54216aa-d35f-11e7-8442-8d9e1cd67d88.jpg)

## The context
You are a scientist in a post-apocalyptic world. In your lab you have plenty of human tissues, yet not so many brains. For this reason, you decide to create zombies, which you then equip with armors and weapons. Why would you do that? Well, we cannot tell you. The only thing you need to know is that you are a crazy scientist playing on the edge of life and death.

## Instructions

* Fork this repo and clone your fork in your local machine. Alternatively, if you prefer to keep your challenge private, just download the code of this repo and send the final result to jobs@badiapp.com.
* The challenge is on! Implement the 6 steps described below;
* Create a pull request.

## What we expect
* Build a performant, clean and well structured solution;
* Commit **early and often**. We want to be able to check your progress;
* Feel free to address the problem creatively according to your programming tastes (there are always multiple ways to achieve the same goal) and try to use elegant solutions.

## The Challenge

Create a fully-working API that allows to perform the following operations:

1. Create Zombies. Each zombie can have weapons and armors;
2. Update a Zombie's attributes, including (but not limited to) weapons and armors;
4. Search Zombies according to their attributes, weapons and armors;
3. Destroy a Zombie;
5. Make your API public. Deploy it using the service of your choice (e.g. AWS, Heroku, Digital Ocean...);
6. Create a Readme file including a short explanation of your technical choices and (if you wish) ideas and suggestions.

Too easy? Great, we think so too!
That's why we encourage candidates to go the extra mile and impress us in any way they deem appropriate (as long as it is related to this challenge ;).

**Happy coding!**

### Recommendations
We **highly recommend you to use Docker**, this project is already setup to do so.
Just run `docker-compose up -d && docker-compose logs -f` and your api will be up & running with hot code reloading on `http://localhost:3000`.

In case you want to clean your environment, run again:

```
docker-compose down -f
docker-compose up -d --build
docker-compose logs -f
```

### About Badi
[Badi](https://www.crunchbase.com/organization/badi) is a startup based in Barcelona (Spain) which offers a two-sided marketplace for shared flats and roommates (mobile and web app).
Our goal is making city living affordable for everyone by unlocking available rooms inside crowded urban areas. How? By offering the best marketplace that intelligently matches verified profiles without intermediaries.
Do you want to join our tech team as a backend engineer? Accept our challenge and impress us :)
In case of questions or doubts, don't hesitate to reach out to us at jobs@badiapp.com.
