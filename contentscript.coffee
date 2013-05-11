#############################################################################
#############################################################################
############################# LINKED LIST CODE ##############################
#############################################################################
#############################################################################

# "Classic" linked list implementation that doesn't keep track of its size.
# Taken from https://github.com/jashkenas/coffee-script/blob/master/examples/computer_science/linked_list.coffee
class LinkedList

  ->
    this._head = null # Pointer to the first item in the list.


  # Appends some data to the end of the list. This method traverses the existing
  # list and places the value at the end in a new node.
  add: (element, method, details) ->

    # Create a new node object to wrap the data.
    node = element: element, method: method, details: details, next: null

    current = this._head or= node

    if this._head isnt node
      (current = current.next) while current.next
      current.next = node

    this


  # Retrieves the data at the given position in the list.
  item: (index) ->

    # Check for out-of-bounds values.
    return null if index < 0

    current = this._head or null
    i = -1

    # Advance through the list.
    (current = current.next) while current and index > (i += 1)

    # Return null if we've reached the end.
    current and current.data

  # Return the last item in the list and remove it 
  pop: -> 
    current = this._head

    # go through the list until we reach null
    while current.next isnt null
      prev = current
      current = current.next

    # delete node
    data = current

    if prev?
      prev.next = null
    else 
      this._head = null

    data

  # Remove the item from the given location in the list.
  remove: (index) ->

    # Check for out-of-bounds values.
    return null if index < 0

    current = this._head or null
    i = -1

    # Special case: removing the first item.
    if index is 0
      this._head = current.next
    else

      # Find the right location.
      ([previous, current] = [current, current.next]) while index > (i += 1)

      # Skip over the item to remove.
      previous.next = current.next

    # Return the value.
    current and current.data


  # Calculate the number of items in the list.
  size: ->
    current = this._head
    count = 0

    while current
      count += 1
      current = current.next

    count


  # Convert the list into an array.
  toArray: ->
    result  = []
    current = this._head

    while current
      result.push current.data
      current = current.next

    result


  # The string representation of the linked list.
  toString: -> this.toArray().toString()


# Tests.
commandList = new LinkedList

#############################################################################
#############################################################################
############################# START CONTENTSCRIPT CODE ######################
#############################################################################
#############################################################################

$(document).ready ->
      
#############################################################################
#############################################################################
############################# INJECTED FLASH MESSAGES #######################
#############################################################################
#############################################################################

  # make container to put all the flashes into 
  $('body').append('
    <div id="ContextlyFlashesHolder"></div>
    ')

  # info flash messages 
  $('#ContextlyFlashesHolder').prepend('
     <div id="draggableFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Element made draggable</p>
    </div>
    ')

  # info change font message
  $('#ContextlyFlashesHolder').prepend('
     <div id="changeFontFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Font changed</p>
    </div>
    ')

  # info wrap class messages 
  $('#ContextlyFlashesHolder').prepend('
     <div id="wrapClassFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 230px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Element wrapped in specified div</p>
    </div>
    ')

  # info add to div messages 
  $('#ContextlyFlashesHolder').prepend('
     <div id="addToClassFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 230px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Element added to specified div</p>
    </div>
    ')

  # info change tagName messages 
  $('#ContextlyFlashesHolder').prepend('
     <div id="changeTagNameFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Element\'s tagName changed</p>
    </div>
    ')

  # info modify class messages 
  $('#ContextlyFlashesHolder').prepend('
     <div id="modifyClassFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Class changed</p>
    </div>
    ')

  # info resizable messages 
  $('#ContextlyFlashesHolder').prepend('
     <div id="resizableFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Element made resizable</p>
    </div>
    ')

  # info revert messages 
  $('#ContextlyFlashesHolder').prepend('
     <div id="revertFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Change reverted</p>
    </div>
    ')

  # info fail revert messages 
  $('#ContextlyFlashesHolder').prepend('
     <div id="failRevertFlash" class="hide alert alert-error" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>No changes to revert</p>
    </div>
    ')

#############################################################################
#############################################################################
############################# INJECTED MODALS ###############################
#############################################################################
#############################################################################

  # div to hold all the modals 
  $('body').append('
    <div id="ContextlyModalsHolder"></div>
    ')

  # modal for changing font 
  $('#ContextlyModalsHolder').append('
      <!-- Modal -->
      <div id="fontModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel">Change font</h3>
        </div>
        <div class="modal-body">
          <select name="font-list" id="font-list">
            <option value="Helvetica">Helvetica</option>
            <option value="Raleway">Raleway</option>
            <option value="Gabriela"> Gabriela </option>
            <option value="Abril+Fatface">Abril Fatface</option>
            <option value="Gentium+Book+Basic">Gentium Book Basic</option>
            <option value="Gravitas+One">Gravitas One</option>
            <option value="Lato">Lato</option>
            <option value="Merriweather">Merriweather</option>
            <option value="Old+Standard+TT">Old Standard TT</option>
            <option value="Open+Sans">Open Sans</option>
            <option value="Oswald">Oswald</option>
            <option value="Playfair+Display">Playfair Display</option>
            <option value="PT+Sans">PT Sans</option>
            <option value="PT+Mono">PT Mono</option>
            <option value="PT+Sans+Narrow">PT Sans Narrow</option>
            <option value="PT+Serif">PT Serif</option>
            <option value="Vollkorn">Vollkorn</option>
            <option value="Abel">Abel</option>
          </select>
        <textarea name="Tony" id="changeFontSize" style="width: 280px"cols="1" rows="1">Current font size:</textarea>
        <textarea name="Tony" id="changeFontStyle" style="width: 280px"cols="1" rows="1">Current font-style:</textarea>
        <textarea name="Tony" id="changeFontWeight" style="width: 280px"cols="1" rows="1">Current font-weight:</textarea>
        <b style="font-size: 20px">R</b><input style="width: 50px" id="fontColorR">
        <b style="font-size: 20px">G</b><input style="width: 50px" id="fontColorG">
        <b style="font-size: 20px">B</b><input style="width: 50px" id="fontColorB">
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <button id="fontChange" class="btn btn-primary" data-dismiss="modal">Save changes</button>
        </div>
      </div>  
    ')
  
  # Keyboard shortcuts modal
  $('#ContextlyModalsHolder').append('
      <!-- Modal -->
      <div id="helpModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel">Help Menu</h3>
        </div>
        <div class="modal-body">
          <p>Help menu: Shift + H</p>
          <p>Change font-styles: Shift + F</p>
          <p>Wrap element with class: Shift + W</p>
          <p>Change tagName: Shift + T</p>
          <p>Make element draggable: Shift + D</p>
          <p>Make class draggable: Shift + E</p>
          <p>Add element to existing div: Shift + A</p>
          <p>Choose element to make resizable: Shift + R</p>
          <p>Modify existing class: Shift + M</p>
          <p>Undo last change: Shift + Z</p>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
      </div>  
    ')

  # wrap element in specified class modal
  $('#ContextlyModalsHolder').append('
      <!-- Modal -->
      <div id="wrapElementModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel">Wrap Element Menu</h3>
        </div>
        <div class="modal-body">
          <b style="font-size: 50px">.</b><textarea name="Tony" id="wrapElememtArea" cols="1" rows="1">Wrap element class:</textarea>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <button id="wrapElement" class="btn btn-primary" data-dismiss="modal" >Save changes</button>
        </div>
      </div>  
    ')

  # make class draggable
  $('#ContextlyModalsHolder').append('
    <!-- Modal -->
    <div id="makeClassDraggable" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <h3 id="myModalLabel">Make class draggable</h3>
      </div>
      <div class="modal-body">
        <b style="font-size: 50px">.</b><textarea name="Tony" id="draggableClassArea" cols="1" rows="1">Make class draggable:</textarea>
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button id="makeClassDraggableSubmit" class="btn btn-primary" data-dismiss="modal" >Save changes</button>
      </div>
    </div>  
  ')

  # change tagName modal
  $('#ContextlyModalsHolder').append('
      <!-- Modal -->
      <div id="changeTagNameModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel">Change tagName</h3>
        </div>
        <div class="modal-body">
          <textarea name="Tony" id="changeTagNameArea" cols="1" rows="1">change tagName to:</textarea>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <button id="changeTagNameSubmit" class="btn btn-primary" data-dismiss="modal" >Save changes</button>
        </div>
      </div>  
    ')

  # add element to existing div modal
  $('#ContextlyModalsHolder').append('
      <!-- Modal -->
      <div id="addElementToDivModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel">Add Element to Existing Class</h3>
        </div>
        <div class="modal-body">
          <b style="font-size: 50px">.</b><textarea name="Tony" id="addElementToDivArea" cols="1" rows="1">Choose div to add element to:</textarea>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <button id="addElementToDiv" class="btn btn-primary" data-dismiss="modal" >Save changes</button>
        </div>
      </div>  
    ')

  # make class resizable modal
  $('#ContextlyModalsHolder').append('
      <!-- Modal -->
      <div id="resizableModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel">Make Class resizable</h3>
        </div>
        <div class="modal-body">
          <b style="font-size: 50px">.</b><textarea name="Tony" id="resizableClassArea" cols="1" rows="1">Choose class to make resizable:</textarea>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <button id="makeResizable" class="btn btn-primary" data-dismiss="modal" >Save changes</button>
        </div>
      </div>  
    ')

  # change class thingies modal
  $('#ContextlyModalsHolder').append('
      <!-- Modal -->
      <div id="modifyClassModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <h3 id="myModalLabel">Change class things</h3>
        </div>
        <div class="modal-body">
          <b style="font-size: 50px">.</b><textarea name="Tony" id="modifyClassArea" cols="1" rows="1">Choose class</textarea>
            <textarea name="Tony" id="modifyClassBackgroundColor" cols="1" rows="1">Background color?</textarea>
            <textarea name="Tony" id="modifyClassAreaHeight" cols="1" rows="1">Height</textarea>
            <textarea name="Tony" id="modifyClassAreaWidth" cols="1" rows="1">Width</textarea>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <button id="modifyClass" class="btn btn-primary" data-dismiss="modal" >Save changes</button>
        </div>
      </div>  
    ')

#############################################################################
#############################################################################
############################# KEYBINDINGS ###################################
#############################################################################
#############################################################################

# keep state if one modal window is down. Don't allow two modal windows at once
  modalDown = false

  $(document).bind 'keypress', (e) ->

    # Display help menu
    if event.shiftKey and event.which is 72
      modalDown = true
      $("#helpModal").modal()

     # change font specifications ( shift + F )
    if event.shiftKey and event.which is 70 

      # replace fontStyle and fontWeight vals with current ones of clicked element
      fontStyle = $('.clicked').css('font-style')
      fontWeight = $('.clicked').css('font-weight')
      $('#changeFontStyle').val(fontStyle)
      $('#changeFontWeight').val(fontWeight)

      # replace clicked color vals into modal
      color = $('.clicked').css("color")
      $('#fontColorR').val(color.substring(4,6))
      $('#fontColorG').val(color.substring(8,10))
      $('#fontColorB').val(color.substring(12,14))

      # get current font-size 
      currFontSize = $('.clicked').css('font-size')
      $("#changeFontSize").val(currFontSize)
      $("#fontModal").modal()

    # Wrap with class ( shift + W )
    if event.shiftKey and event.which is 87
      $('#wrapElementModal').modal()

    # change tagName ( shift + T )
    if event.shiftKey and event.which is 84
      # fill in the modal with tagName of currently selected element
      currTagName = $('.clicked').prop('tagName').toLowerCase()
      $('#changeTagNameArea').val(currTagName)
      $("#changeTagNameModal").modal()

    # make class draggable ( shift + D + C)
    if event.shiftKey and event.which is 69
      $("#makeClassDraggable").modal()

    # make something draggable to a 50 x 50 grid ( shift + D)
    if event.shiftKey and event.which is 68

      # show flash
      $('#draggableFlash').fadeIn 1500, ->
        $(this).fadeOut()

      # make something draggable
      $('.clicked').draggable({

        # constrain dragged element to 20 x 20 grid
        grid: [20,20], 

        # fix for not being able to reintialize draggable upon release
        disabled: false,

        # make element not draggable upon release
        stop: -> 
          # some tooltipping action 
          $(this).tooltip('destroy')
          left = $(this).css('left')
          top = $(this).css('top')
          $(this).tooltip('title': "left: #{left}, top: #{top}")
          $(this).tooltip('show')

          # disable the draggable
          $(this).draggable('disable')

        # don't change opacity while dragging
        opacity: 1
        })

      # add it to the list of commands done
      commandList.add $('.clicked'), 'draggable'
      console.log commandList

    # method for adding element to a class ( shift + A )
    if event.shiftKey and event.which is 65
      $('#addElementToDivModal').modal()

    # method for making element resizable ( shift + R )
    if event.shiftKey and event.which is 82 
      $('#resizableModal').modal()

    # modify class ( shift + M )
    if event.shiftKey and event.which is 77
      $("#modifyClassModal").modal()

    # revert change ( shift + Z)
    if event.shiftKey and event.which is 90 

      # show flash
      if commandList.size() > 0
        $('#revertFlash').fadeIn 1500, -> 
          $(this).fadeOut()

        # get last element in list
        action = commandList.pop()
        element = action.element
        method = action.method
        details = action.details

        if method is "tagName"
          tagName = details.tagName
          content = $('.changeTagNameTarget').text()

          $('.changeTagNameTarget').replaceWith -> 
            $("<#{tagName} />").append content

        else if method is "modifyClass"
          $(element).css('background', details.background)
          $(element).css('height', details.height)
          $(element).css('width', details.width)

        else if method is "wrapClass"
          $(element).unwrap()

        else if method is "addElementToDiv"
          classToAdd = ".#{details.classToAdd}"
          index  = details.index
          parent = details.parent

          # remove element from div
          $(element).remove()

          # insert element back to original spot by index
          $(parent).append( $(element) )

        else if method is "changeFont"
          console.log details
          $(element).css("font-size", details.fontSize)   
          $(element).css("font-family", details.fontFamily)   
          $(element).css("font-color", details.color)  
          $(element).css("font-style", details.fontStyle)   
          $(element).css("font-weight", details.fontWeight)   
 

        else if method is "draggable" or "classDraggable"
          # revert to original position. Only have to change "left" and "top" 
          # jquery converts right into (-1)left and same for top and down
          $(element).animate({"top": "0px", "left": "0px"})

      else 
        $('#failRevertFlash').fadeIn 1500, ->
          $(this).fadeOut()

#############################################################################
#############################################################################
############################# CLICK LISTENERS ###############################
#############################################################################
#############################################################################

# ---------------------------- CHANGE FONT ---------------------------------
  $('body').on 'click', "#fontChange", (e) -> 
     # get font type
    font = $('#font-list').val()

    # get font size
    fontSize = $('#changeFontSize').val()

    # get font-style 
    fontStyle = $('#changeFontStyle').val()

    # get font-weight 
    fontWeight = $('#changeFontWeight').val()

    # get color 
    colorR = $("#fontColorR").val()
    colorG = $("#fontColorG").val()
    colorB = $("#fontColorB").val()
    color = "rgb(#{colorR}, #{colorG}, #{colorB})"

    # add to list of commands done
    commandList.add $('.clicked'), "changeFont", {
      "fontFamily": $('.clicked').css("font-family")
      "fontSize" : $('.clicked').css("font-size")
      "fontStyle" : $('.clicked').css("font-style")
      "fontWeight" : $('.clicked').css('font-weight')
      "color" : $('.clicked').css("color")
    }

    # call changeFont
    changeFont(font, fontSize, color, fontStyle, fontWeight)

    # show flash 
    $("#changeFontFlash").fadeIn 1500, -> 
      $(this).fadeOut()

    console.log commandList

# ---------------------------- WRAP ELEMENT ---------------------------------
  $('body').on 'click', "#wrapElement", (e) -> 
    # get element
    classToWrap = $('#wrapElememtArea').val()
    wrapElement classToWrap

    # show flash 
    $('#wrapClassFlash').fadeIn 1500, -> 
      $(this).fadeOut()

    # add to list of commands done
    commandList.add $('.clicked'), "wrapClass"

# ---------------------------- CHANGE TAGNAME -------------------------------
  $('body').on 'click', "#changeTagNameSubmit", (e) -> 

    # get tagName 
    tagName = $('#changeTagNameArea').val()

    # add to list of commands done
    commandList.add $('.clicked'), 'tagName', {
      "tagName" : $('.clicked').prop('tagName').toLowerCase()
    }

    changeTagName tagName

    # show flash 
    $('#changeTagNameFlash').fadeIn 1500, -> 
      $(this).fadeOut()

# ---------------------------- CLOSE FLASH ----------------------------------
  $('body').on 'click', '#closeMyFlash', (e) -> 
    $(this).fadeOut()

# ---------------------------- ADD ELEMENT TO DIV ---------------------------
  $('body').on 'click', '#addElementToDiv', (e) -> 
    # get class val 
    classToAdd = $('#addElementToDivArea').val()

    parent = $('.clicked').parent()

    commandList.add $('.clicked'), 'addElementToDiv', {
      "classToAdd": classToAdd

      # get the index of the element in the dom
      "index": $('*').index( $('.clicked') )

      # get parent 
      "parent": parent
    }
    addElementToDiv classToAdd

    # show flash 
    $('#addToClassFlash').fadeIn 1500, ->
      $(this).fadeOut()

# ---------------------------- MAKE DIV RESIZABLE -----------------------------
  $('body').on 'click', '#makeResizable', (e) -> 
    # make something resizable 
    element = "." + $('#resizableClassArea').val()
    $(element).resizable()

    # show flash 
    $('#resizableFlash').fadeIn 1500, ->
      $(this).fadeOut()

    # add to list of commands done
    commandList.add $('.clicked')

# ---------------------------- MAKE DIV DRAGGABLE------------------------------

  $('body').on 'click', '#makeClassDraggableSubmit', (e) ->
    # make class draggable 
    element = "." + $('#draggableClassArea').val()
    $(element).draggable({

        # constrain dragged element to 20 x 20 grid
        grid: [20,20], 

        # fix for not being able to reintialize draggable upon release
        disabled: false,

        # make element not draggable upon release
        stop: -> 
          # some tooltipping action 
          $(this).tooltip('destroy')
          left = $(this).css('left')
          top = $(this).css('top')
          $(this).tooltip('title': "left: #{left}, top: #{top}")
          $(this).tooltip('show')

          # disable the draggable
          $(this).draggable('disable')

        # don't change opacity while dragging
        opacity: 1
        })

    # show flash 
    $('#draggableFlash').fadeIn 1500, ->
      $(this).fadeOut()

    # add to list of commands done
    commandList.add $(element), "classDraggable"

# ---------------------------- MODIFY CLASS---------------------------------
  $('body').on 'click', "#modifyClass", (e) -> 

    # get variables 
    element = "." + $('#modifyClassArea').val()
    background = $('#modifyClassBackgroundColor').val()
    height = $('#modifyClassAreaHeight').val()
    width = $('#modifyClassAreaWidth').val()

    # add to the list of commands done 
    commandList.add element, 'modifyClass', {
      "background" : $(element).css("background")
      "height" : $(element).css('height') 
      "width" : $(element).css('width')
    }

    $(element).css('background', background)
    $(element).css('height', height)
    $(element).css('width', width)

    $('#modifyClassFlash').fadeIn 1500, ->
      $(this).fadeOut()

# ---------------------------- GET CLICKED ELEMENT-----------------------------
  $('body').on "click", "h1, h2, h3, p, a, li, img", (e) -> 

    # prevent default
    e.preventDefault()

    # get clicked element
    x = $(this)

    # remove background and class from previously clicked elements 
    $('.clicked').css('background', 'none')
    $('.clicked').removeClass('clicked')  

    # set background and class to highlight the clicked element
    x.addClass('clicked')
    x.css('background', 'rgb(255, 251, 204)')

    chrome.extension.sendMessage {
      # send information to background page
      "tagName": x.prop("tagName").toLowerCase()
      "fontSize": x.css("font-size")
    }


#############################################################################
#############################################################################
############################# METHODS FOR CHANGING THINGIES #################
#############################################################################
#############################################################################

# method for changing the font
changeFont = (font, fontSize, color, fontStyle, fontWeight) -> 
  # set local variables
  font = font 
  element = $('.clicked')
  fontSize= fontSize
  color = color

  # if font is google web font 
  unless font is "Helvetica"

    # get css stylesheet from googlefonts
    $("head").append("
      <link href='http://fonts.googleapis.com/css?family=" + font + "' rel='stylesheet' type='text/css'>
      ");

    # some magicking to get right font-name 
    font = font.split("+").join(" ")

  # change css of element
  element.css('font-family', font)

  # change font-size
  element.css('font-size', fontSize)

  # change color
  element.css('color', color)

  # change style and weight
  element.css('font-style', fontStyle)
  element.css('font-weight', fontWeight)


# method for wrapping elements in classes 
wrapElement = (wrapElement) -> 
  $('.clicked').wrap('<div class=' + '"' + wrapElement + '"' + ' />')

# method for changing the tagName of an element 
changeTagName  = (tagName) -> 
  if tagName?
    $('.clicked').replaceWith -> 
      $("<#{tagName} class = 'changeTagNameTarget'></#{tagName}>").append $('.clicked').contents()
      


# method for adding element to existing div 
addElementToDiv = (classToAdd) -> 
  if classToAdd? 

    # change from "hero-unit" to ".hero-unit"
    classToAdd = ".#{classToAdd}"
    element = $('.clicked')
    $(classToAdd).append(element)
