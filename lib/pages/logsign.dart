import 'package:flutter/material.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  int currentPageIndex = 0;

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xfff5efd7),
        appBar: AppBar(
          backgroundColor: Colors.black38,
          toolbarHeight: 5,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Builder(builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/splashLogo.png'),
                width: 350,
                height: 350,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: '  Email',
                  constraints: const BoxConstraints(maxWidth: 300),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: '  Password',
                  constraints: const BoxConstraints(maxWidth: 300),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFffa9411d),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Eat Away!', style: TextStyle(color: Colors.white),),
              ),
              const Text(
                        'or Sign Up with',
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.facebook, color: Colors.blue),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            icon: const Icon(Icons.email, color: Colors.redAccent),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.27,),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => 
                      DraggableScrollableSheet(
                        initialChildSize: 1.0,
                        maxChildSize: 1.0,
                        expand: false,
                        builder: (context, Controller) => 
                        SingleChildScrollView(
                          controller: Controller,
                          physics: const BouncingScrollPhysics(),
                          child : Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: MediaQuery.sizeOf(context).height,
                                padding: const EdgeInsets.all(16.0),
                                decoration: const BoxDecoration(
                                  color: Color(0xff1873114),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFA07A),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: '  Name',
                                        constraints: const BoxConstraints(maxWidth: 300),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: '  Email',
                                        constraints: const BoxConstraints(maxWidth: 300),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: '  Password',
                                        constraints: const BoxConstraints(maxWidth: 300),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                      obscureText: true,
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFFFFA07A),
                                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: const Text('Never Hungry Again!', style: TextStyle(color: Colors.white)),
                                    ),
                                    const SizedBox(width: 40),
                                    const Text(
                                      'or Sign Up with',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.facebook, color: Colors.blue),
                                          iconSize: 30,
                                          onPressed: () {},
                                        ),
                                        const SizedBox(width: 20),
                                        IconButton(
                                          icon: const Icon(Icons.email, color: Colors.redAccent),
                                          iconSize: 30,
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFffa9411d),
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: 
                      BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.arrow_drop_up, color: Colors.white),
                      Text('Sign Up', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        ),
      ),
    );
  }
}