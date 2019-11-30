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
![ss1](ReadmeResources/ss1.gif)

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
![ss2](ReadmeResources/ss2.gif)

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
![ss3](ReadmeResources/ss3.gif)


## Error Handling
### Each row is independent. Thus, if any error occurs, only the relevant row is affected.
![error](ReadmeResources/error.gif =621x1344)
