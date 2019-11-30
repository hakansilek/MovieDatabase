# MovieDatabase

## To-Do list to add new row type:
1. Create a new tableviewcell layout, viewmodel and controller
2. Add the new row type to MainPageRowCreator.swift
3. That's all :)

## You can get different screens by just modifying the rows.json file.
### Example 1
```
{
    "rows":[
        {"rowType":"suggestion", "dataId":"suggestion2"},
        {"rowType":"moviestar", "dataId":"moviestar1"},
        {"rowType":"category", "dataId":"category2"},
        {"rowType":"populartrailer", "dataId":"populartrailer1"},
        {"rowType":"category", "dataId":"category3"},
        {"rowType":"moviestar", "dataId":"moviestar2"},
        {"rowType":"category", "dataId":"category4"}
    ]
}
```
<img src="./ReadmeResources/ss1.gif" width="300" height="600">

### Example 2
```
{
    "rows":[
        {"rowType":"suggestion", "dataId":"suggestion1"},
        {"rowType":"populartrailer", "dataId":"populartrailer1"},
        {"rowType":"category", "dataId":"category3"},
        {"rowType":"category", "dataId":"category2"},
        {"rowType":"moviestar", "dataId":"moviestar1"},
        {"rowType":"moviestar", "dataId":"moviestar2"},
        {"rowType":"category", "dataId":"category4"}
    ]
}
```
<img src="./ReadmeResources/ss2.gif" width="300" height="600">

### Example 3
```
{
    "rows":[
        {"rowType":"suggestion", "dataId":"suggestion1"},
        {"rowType":"category", "dataId":"category1"},
        {"rowType":"category", "dataId":"category2"},
        {"rowType":"category", "dataId":"category3"}
    ]
}
```
<img src="./ReadmeResources/ss3.gif" width="300" height="600">


## Error Handling
### Each row is independent. Thus, if any error occurs, only the relevant row is affected.
<img src="./ReadmeResources/error.gif" width="300" height="600">
