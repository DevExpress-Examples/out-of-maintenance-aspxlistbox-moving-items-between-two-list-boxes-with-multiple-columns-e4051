<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128536773/13.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4051)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
<!-- default file list end -->
# ASPxListBox - Moving Items between two List Boxes with multiple columns
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4051/)**
<!-- run online end -->


<p>This example based on the <a href="http://demos.devexpress.com/aspxeditorsdemos/ListEditors/MovingItems.aspx"><u>List Editors - Moving Items Between Two List Boxes</u></a> demo.<br />
When ASPxListBox uses multiple columns, the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxEditorsScriptsASPxClientListEditItem_texttopic">ASPxClientListEditItem.text</a> property returns text on one string. Use the JavaScript <a href="http://www.w3schools.com/jsref/jsref_split.asp">string.split</a> method to split the item text into an array of strings. To remove unnecessary spaces, call the <a href="http://www.w3schools.com/jsref/jsref_slice_string.asp">string.slice</a> method:</p><p><br />


```js
function MoveSelectedItems(srcListBox, dstListBox) {
           srcListBox.BeginUpdate();
           dstListBox.BeginUpdate();
           var items = srcListBox.GetSelectedItems();
           for (var i = items.length - 1; i >= 0; i = i - 1) {
               var itemText = GetSplitText(items[i].text);
               dstListBox.AddItem(itemText, items[i].value);
               srcListBox.RemoveItem(items[i].index);
           }
           srcListBox.EndUpdate();
           dstListBox.EndUpdate();
       }

function GetSplitText(text) {
           var splitedText = text.split(';');
           var index = 0;
           for (str in splitedText) {
               if (index != 0)
                   splitedText[index] = splitedText[index].slice(1);
               index++;
           }
           return splitedText;
       }
```

 </p>

<br/>


