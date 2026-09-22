**Lab 4 – Flutter UI Fundamentals**

**1\. Objective**

This lab helps students practice building user interfaces using Flutter’s core widget system.  
Students will learn how to work with basic widgets, input controls, layout structures, navigation scaffolding, and design polish techniques such as spacing and theming.

This lab corresponds directly to **Module 4 – Flutter UI Fundamentals**.

**2\. Requirements**

Complete **five exercises** covering the main UI concepts: 

1. Core Widgets (Text, Image, Icon, Card, ListTile)

2. Input Widgets (Slider, Switch, RadioListTile, Pickers)

3. Layout Composition (Column, Row, Padding, ListView)

4. Building Screen Structure using Scaffold

5. Applying ThemeData \+ fixing common UI errors

All tasks must:

* Compile and run in Android Studio / VS Code / DartPad

* Produce visible UI output

* Include comments explaining code

* Include screenshots (if required by instructor)

**3\. Guided Steps**

**Exercise 1 – Core Widgets: Text, Image, Icon, Card, ListTile**

**Goal:** Build a simple UI demonstrating essential Flutter display widgets.

**Steps**

1. Create a new Flutter file core\_widgets\_demo.dart. 

2. Build a simple screen that includes:

   * A headline Text

   * An Icon using Material Icons

   * An Image.network() (any valid image)

   * A Card containing a ListTile

3. Run the UI and confirm widgets display properly.

**Exercise 2 – Input Widgets: Slider, Switch, RadioListTile, DatePicker** 

**Goal:** Build interactive UI that lets users control values.

**Steps**

1. Create a StatefulWidget named InputControlsDemo.

2. Implement a Slider, Switch, and RadioListTile group.

3. Add a button that shows a DatePicker when tapped.

4. Display updated values on screen.

**Exercise 3 – Layout Basics: Column, Row, Padding, ListView** 

**Goal:** Build a sectioned UI layout similar to a real app Home screen.

**Steps**

1. Use Column to create vertical sections.

2. Add spacing using Padding and SizedBox.

3. Add a ListView.builder showing movie titles or items.

4. Apply consistent spacing (8, 12, or 16 px).

**Exercise 4 – App Structure with Scaffold, AppBar, FAB & Theme** 

**Goal:** Practice building a complete screen structure.

**Steps**

1. Create a new screen using Scaffold.

2. Add:

   * AppBar

   * Body

   * FloatingActionButton

   * Theme customization using ThemeData

3. Implement a “Dark Mode” toggle using themeMode.

**Exercise 5 – Debug & Fix Common UI Errors** 

**Goal:** Understand common layout issues and fix them.

**Tasks**

1. Fix **ListView inside Column** using Expanded.

2. Fix **overflow** in small screens using SingleChildScrollView.

3. Fix state update issue by adding setState().

4. Fix DatePicker build context errors by calling from valid widget tree.

**4\. Expected Results**

By completing this lab, students should be able to:

* Build UI using core Flutter widgets

* Handle input widgets and pickers

* Compose complex layouts using Column/Row/ListView

* Structure screens using Scaffold & Theme

* Identify and fix common UI mistakes

* Produce visible and runnable Flutter UI screens

---

**5\. Submission**

* Source code for all 5 exercises

* Screenshots of UI output for each

* Short explanation for fixes in Exercise 5

* Submit via LMS or upload zipped project

   

