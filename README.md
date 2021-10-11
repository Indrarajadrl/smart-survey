# smart_survey1


## Framework , Micro-framework & package

#flutter
![](images/flutter.png)

- [Fast Development
Paint your app to life in milliseconds with Stateful Hot Reload. Use a rich set of fully-customizable widgets to build native interfaces in minutes.](https://flutter.dev/docs/get-started/codelab)
- [Expressive and Flexible UI
Quickly ship features with a focus on native end-user experiences. Layered architecture allows for full customization, which results in incredibly fast rendering and expressive and flexible designs.]
- [Native Performance
Flutter’s widgets incorporate all critical platform differences such as scrolling, navigation, icons and fonts, and your Flutter code is compiled to native ARM machine code using Dart's native compilers.]
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

#getX
![](images/get.png)


# About Get

- GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, intelligent dependency injection, and route management quickly and practically.

- GetX has 3 basic principles. This means that these are the priority for all resources in the library: **PRODUCTIVITY, PERFORMANCE AND ORGANIZATION.**

  - **PERFORMANCE:** GetX is focused on performance and minimum consumption of resources. GetX does not use Streams or ChangeNotifier.

  - **PRODUCTIVITY:** GetX uses an easy and pleasant syntax. No matter what you want to do, there is always an easier way with GetX. It will save hours of development and will provide the maximum performance your application can deliver.

    Generally, the developer should be concerned with removing controllers from memory. With GetX this is not necessary because resources are removed from memory when they are not used by default. If you want to keep it in memory, you must explicitly declare "permanent: true" in your dependency. That way, in addition to saving time, you are less at risk of having unnecessary dependencies on memory. Dependency loading is also lazy by default.

  - **ORGANIZATION:** GetX allows the total decoupling of the View, presentation logic, business logic, dependency injection, and navigation. You do not need context to navigate between routes, so you are not dependent on the widget tree (visualization) for this. You don't need context to access your controllers/blocs through an inheritedWidget, so you completely decouple your presentation logic and business logic from your visualization layer. You do not need to inject your Controllers/Models/Blocs classes into your widget tree through `MultiProvider`s. For this, GetX uses its own dependency injection feature, decoupling the DI from its view completely.

    With GetX you know where to find each feature of your application, having clean code by default. In addition to making maintenance easy, this makes the sharing of modules something that until then in Flutter was unthinkable, something totally possible.
    BLoC was a starting point for organizing code in Flutter, it separates business logic from visualization. GetX is a natural evolution of this, not only separating the business logic but the presentation logic. Bonus injection of dependencies and routes are also decoupled, and the data layer is out of it all. You know where everything is, and all of this in an easier way than building a hello world.
    GetX is the easiest, practical, and scalable way to build high-performance applications with the Flutter SDK. It has a large ecosystem around it that works perfectly together, it's easy for beginners, and it's accurate for experts. It is secure, stable, up-to-date, and offers a huge range of APIs built-in that are not present in the default Flutter SDK.

- GetX is not bloated. It has a multitude of features that allow you to start programming without worrying about anything, but each of these features are in separate containers and are only started after use. If you only use State Management, only State Management will be compiled. If you only use routes, nothing from the state management will be compiled.
- GetX has a huge ecosystem, a large community, a large number of collaborators, and will be maintained as long as the Flutter exists. GetX too is capable of running with the same code on Android, iOS, Web, Mac, Linux, Windows, and on your server.



