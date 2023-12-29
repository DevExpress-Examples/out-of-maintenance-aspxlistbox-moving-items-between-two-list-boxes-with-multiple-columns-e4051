<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
<!-- default file list end -->
# ASPxListBox - Moving Items between two List Boxes with multiple columns


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


