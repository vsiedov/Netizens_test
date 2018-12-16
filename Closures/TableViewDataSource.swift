import UIKit

open class TableViewDataSource: NSObject {
    private var numberOfRowsInSectionHandler: NumberOfRowsInSectionHandler!
    private var cellForRowAtIndexPathHandler: CellForRowAtIndexPathHandler!
    private var numberOfSectionsHandler: NumberOfSectionsHandler?
    private var titleForHeaderInSectionHandler: TitleForHeaderFooterInSectionHandler?
    private var titleForFooterInSectionHandler: TitleForHeaderFooterInSectionHandler?
    private var canEditRowAtIndexPathHandler: CanChangeRowAtIndexPathHandler?
    private var canMoveRowAtIndexPathHandler: CanChangeRowAtIndexPathHandler?
    private var sectionIndexTitlesHandler: SectionIndexTitlesHandler?
    private var sectionForSectionIndexTitleHandler: SectionForSectionIndexTitleHandler?
    private var commitEditingStyleForRowAtIndexPathHandler: CommitEditingStyleForRowAtIndexPathHandler?
    private var moveRowAtIntexPathToNewIndexPathHandler: MoveRowAtIntexPathToNewIndexPathHandler?
}

public typealias NumberOfRowsInSectionHandler = (UITableView, Int) -> Int?
public typealias NumberOfRowsInSectionHandlerWithContext<Context: AnyObject> = (Context, UITableView, Int) -> Int?
extension TableViewDataSource {
    /// Tells the data source to return the number of rows in a given section of a table view.
    ///
    /// - Parameter handler: (UITableView, Int) -> Int?
    /// - Returns: Self
    @discardableResult
    public func onNumberOfRowsInSection(_ handler: @escaping NumberOfRowsInSectionHandler) -> Self {
        numberOfRowsInSectionHandler = handler
        return self
    }
    
    /// Tells the data source to return the number of rows in a given section of a table view.
    ///
    /// - Parameter handler: (Context, UITableView, Int) -> Int?
    /// - Returns: Self
    @discardableResult
    public func onNumberOfRowsInSection<Context: AnyObject>(strongify context: Context, _ handler: @escaping NumberOfRowsInSectionHandlerWithContext<Context>) -> Self {
        numberOfRowsInSectionHandler = strongify(weak: context, closure: handler)
        return self
    }
}

public typealias CellForRowAtIndexPathHandler = (UITableView, IndexPath) -> UITableViewCell?
public typealias CellForRowAtIndexPathHandlerWithContext<Context: AnyObject> = (Context, UITableView, IndexPath) -> UITableViewCell?
extension TableViewDataSource {
    /// Asks the data source for a cell to insert in a particular location of the table view.
    ///
    /// The returned UITableViewCell object is frequently one that the application reuses for performance reasons. You should fetch a previously created cell object that is marked for reuse by sending a dequeueReusableCell(withIdentifier:) message to tableView. Various attributes of a table cell are set automatically based on whether the cell is a separator and on information the data source provides, such as for accessory views and editing controls.
    ///
    /// - Parameter handler: (UITableView, IndexPath) -> UITableViewCell?
    /// - Returns: Self
    @discardableResult
    public func onCellForRowAtIndexPath(_ handler: @escaping CellForRowAtIndexPathHandler) -> Self {
        cellForRowAtIndexPathHandler = handler
        return self
    }
    
    /// Asks the data source for a cell to insert in a particular location of the table view.
    ///
    /// The returned UITableViewCell object is frequently one that the application reuses for performance reasons. You should fetch a previously created cell object that is marked for reuse by sending a dequeueReusableCell(withIdentifier:) message to tableView. Various attributes of a table cell are set automatically based on whether the cell is a separator and on information the data source provides, such as for accessory views and editing controls.
    ///
    /// - Parameter handler: (Context, UITableView, IndexPath) -> UITableViewCell?
    /// - Returns: Self
    @discardableResult
    public func onCellForRowAtIndexPath<Context: AnyObject>(strongify context: Context, _ handler: @escaping CellForRowAtIndexPathHandlerWithContext<Context>) -> Self {
        cellForRowAtIndexPathHandler = strongify(weak: context, closure: handler)
        return self
    }
}

public typealias NumberOfSectionsHandler = (UITableView) -> Int?
public typealias NumberOfSectionsHandlerWithContext<Context: AnyObject> = (Context, UITableView) -> Int?
extension TableViewDataSource {
    /// Asks the data source to return the number of sections in the table view.
    ///
    /// - Parameter handler: (UITableView) -> Int?
    /// - Returns: Self
    @discardableResult
    public func onNumberOfSections(_ handler: @escaping NumberOfSectionsHandler) -> Self {
        numberOfSectionsHandler = handler
        return self
    }
    
    /// Asks the data source to return the number of sections in the table view.
    ///
    /// - Parameter handler: (Context, UITableView) -> Int?
    /// - Returns: Self
    @discardableResult
    public func onNumberOfSections<Context: AnyObject>(strongify context: Context, _ handler: @escaping NumberOfSectionsHandlerWithContext<Context>) -> Self {
        numberOfSectionsHandler = strongify(weak: context, closure: handler)
        return self
    }
}

public typealias TitleForHeaderFooterInSectionHandler = (UITableView, Int) -> String?
public typealias TitleForHeaderFooterInSectionHandlerWithContext<Context: AnyObject> = (Context, UITableView, Int) -> String?
extension TableViewDataSource {
    /// Asks the data source for the title of the header of the specified section of the table view.
    ///
    /// The table view uses a fixed font style for section header titles. If you want a different font style, return a custom view (for example, a UILabel object) in the delegate method tableView(\_:viewForHeaderInSection:) instead.
    ///
    /// - Parameter handler: (UITableView, Int) -> String?
    /// - Returns: Self
    @discardableResult
    public func onTitleForHeaderInSection(_ handler: @escaping TitleForHeaderFooterInSectionHandler) -> Self {
        titleForHeaderInSectionHandler = handler
        return self
    }
    
    /// Asks the data source for the title of the header of the specified section of the table view.
    ///
    /// The table view uses a fixed font style for section header titles. If you want a different font style, return a custom view (for example, a UILabel object) in the delegate method tableView(\_:viewForHeaderInSection:) instead.
    ///
    /// - Parameter handler: (Context, UITableView, Int) -> String?
    /// - Returns: Self
    @discardableResult
    public func onTitleForHeaderInSection<Context: AnyObject>(strongify context: Context, _ handler: @escaping TitleForHeaderFooterInSectionHandlerWithContext<Context>) -> Self {
        titleForHeaderInSectionHandler = strongify(weak: context, closure: handler)
        return self
    }
    
    /// Asks the data source for the title of the footer of the specified section of the table view.
    ///
    /// The table view uses a fixed font style for section footer titles. If you want a different font style, return a custom view (for example, a UILabel object) in the delegate method tableView(\_:viewForFooterInSection:) instead.
    ///
    /// - Parameter handler: (UITableView, Int) -> String?
    /// - Returns: Self
    @discardableResult
    public func onTitleForFooterInSection(_ handler: @escaping TitleForHeaderFooterInSectionHandler) -> Self {
        titleForFooterInSectionHandler = handler
        return self
    }
    
    /// Asks the data source for the title of the footer of the specified section of the table view.
    ///
    /// The table view uses a fixed font style for section footer titles. If you want a different font style, return a custom view (for example, a UILabel object) in the delegate method tableView(\_:viewForFooterInSection:) instead.
    ///
    /// - Parameter handler: (Context, UITableView, Int) -> String?
    /// - Returns: Self
    @discardableResult
    public func onTitleForFooterInSection<Context: AnyObject>(strongify context: Context, _ handler: @escaping TitleForHeaderFooterInSectionHandlerWithContext<Context>) -> Self {
        titleForFooterInSectionHandler = strongify(weak: context, closure: handler)
        return self
    }
}

public typealias CanChangeRowAtIndexPathHandler = (UITableView, IndexPath) -> Bool?
public typealias CanChangeRowAtIndexPathHandlerWithContext<Context: AnyObject> = (Context, UITableView, IndexPath) -> Bool?
extension TableViewDataSource {
    /// Asks the data source to verify that the given row is editable.
    ///
    ///The method permits the data source to exclude individual rows from being treated as editable. Editable rows display the insertion or deletion control in their cells. If this method is not implemented, all rows are assumed to be editable. Rows that are not editable ignore the editingStyle property of a UITableViewCell object and do no indentation for the deletion or insertion control. Rows that are editable, but that do not want to have an insertion or remove control shown, can return none from the tableView(\_:editingStyleForRowAt:) delegate method.
    ///
    /// - Parameter handler: (UITableView, IndexPath) -> Bool?
    /// - Returns: Self
    @discardableResult
    public func onCanEditRowAtIndexPath(_ handler: @escaping CanChangeRowAtIndexPathHandler) -> Self {
        canEditRowAtIndexPathHandler = handler
        return self
    }
    
    /// Asks the data source to verify that the given row is editable.
    ///
    ///The method permits the data source to exclude individual rows from being treated as editable. Editable rows display the insertion or deletion control in their cells. If this method is not implemented, all rows are assumed to be editable. Rows that are not editable ignore the editingStyle property of a UITableViewCell object and do no indentation for the deletion or insertion control. Rows that are editable, but that do not want to have an insertion or remove control shown, can return none from the tableView(\_:editingStyleForRowAt:) delegate method.
    ///
    /// - Parameter handler: (Context, UITableView, IndexPath) -> Bool?
    /// - Returns: Self
    @discardableResult
    public func onCanEditRowAtIndexPath<Context: AnyObject>(strongify context: Context, _ handler: @escaping CanChangeRowAtIndexPathHandlerWithContext<Context>) -> Self {
        canEditRowAtIndexPathHandler = strongify(weak: context, closure: handler)
        return self
    }
    
    /// Asks the data source whether a given row can be moved to another location in the table view.
    ///
    /// This method allows the data source to specify that the reordering control for the specified row not be shown. By default, the reordering control is shown if the data source implements the tableView(\_:moveRowAt:to:) method.
    ///
    /// - Parameter handler: (UITableView, IndexPath) -> Bool?
    /// - Returns: Self
    @discardableResult
    public func onCanMoveRowAtIndexPath(_ handler: @escaping CanChangeRowAtIndexPathHandler) -> Self {
        canMoveRowAtIndexPathHandler = handler
        return self
    }
    
    /// Asks the data source whether a given row can be moved to another location in the table view.
    ///
    /// This method allows the data source to specify that the reordering control for the specified row not be shown. By default, the reordering control is shown if the data source implements the tableView(\_:moveRowAt:to:) method.
    ///
    /// - Parameter handler: (Context, UITableView, IndexPath) -> Bool?
    /// - Returns: Self
    @discardableResult
    public func onCanMoveRowAtIndexPath<Context: AnyObject>(strongify context: Context, _ handler: @escaping CanChangeRowAtIndexPathHandlerWithContext<Context>) -> Self {
        canMoveRowAtIndexPathHandler = strongify(weak: context, closure: handler)
        return self
    }
}

public typealias SectionIndexTitlesHandler = (UITableView) -> [String]?
public typealias SectionIndexTitlesHandlerWithContext<Context: AnyObject> = (Context, UITableView) -> [String]?
extension TableViewDataSource {
    /// Asks the data source to return the titles for the sections for a table view.
    ///
    /// - Parameter handler: (UITableView) -> [String]?
    /// - Returns: Self
    @discardableResult
    public func onSectionIndexTitles(_ handler: @escaping SectionIndexTitlesHandler) -> Self {
        sectionIndexTitlesHandler = handler
        return self
    }
    
    /// Asks the data source to return the titles for the sections for a table view.
    ///
    /// - Parameter handler: (Context, UITableView) -> [String]?
    /// - Returns: Self
    @discardableResult
    public func onSectionIndexTitles<Context: AnyObject>(strongify context: Context, _ handler: @escaping SectionIndexTitlesHandlerWithContext<Context>) -> Self {
        sectionIndexTitlesHandler = strongify(weak: context, closure: handler)
        return self
    }
}

public typealias SectionForSectionIndexTitleHandler = (UITableView, String, Int) -> Int?
public typealias SectionForSectionIndexTitleHandlerWithContext<Context: AnyObject> = (Context, UITableView, String, Int) -> Int?
extension TableViewDataSource {
    /// Asks the data source to return the index of the section having the given title and section title index.
    ///
    /// This method is passed the index number and title of an entry in the section index list and should return the index of the referenced section. To be clear, there are two index numbers in play here: an index to a section index title in the array returned by sectionIndexTitles(for:), and an index to a section of the table view; the former is passed in, and the latter is returned. You implement this method only for table views with a section index list—which can only be table views created in the plain style (plain). Note that the array of section titles returned by sectionIndexTitles(for:) can have fewer items than the actual number of sections in the table view.
    ///
    /// - Parameter handler: (UITableView, String, Int) -> Int?
    /// - Returns: Self
    @discardableResult
    public func onSectionForSectionIndexTitle(_ handler: @escaping SectionForSectionIndexTitleHandler) -> Self {
        sectionForSectionIndexTitleHandler = handler
        return self
    }
    
    /// Asks the data source to return the index of the section having the given title and section title index.
    ///
    /// This method is passed the index number and title of an entry in the section index list and should return the index of the referenced section. To be clear, there are two index numbers in play here: an index to a section index title in the array returned by sectionIndexTitles(for:), and an index to a section of the table view; the former is passed in, and the latter is returned. You implement this method only for table views with a section index list—which can only be table views created in the plain style (plain). Note that the array of section titles returned by sectionIndexTitles(for:) can have fewer items than the actual number of sections in the table view.
    ///
    /// - Parameter handler: (Context, UITableView, String, Int) -> Int?
    /// - Returns: Self
    @discardableResult
    public func onSectionForSectionIndexTitle<Context: AnyObject>(strongify context: Context, _ handler: @escaping SectionForSectionIndexTitleHandlerWithContext<Context>) -> Self {
        sectionForSectionIndexTitleHandler = strongify(weak: context, closure: handler)
        return self
    }
}

public typealias CommitEditingStyleForRowAtIndexPathHandler = (UITableView, UITableViewCell.EditingStyle, IndexPath) -> Void
public typealias CommitEditingStyleForRowAtIndexPathHandlerWithContext<Context> = (Context, UITableView, UITableViewCell.EditingStyle, IndexPath) -> Void
extension TableViewDataSource {
    /// Asks the data source to commit the insertion or deletion of a specified row in the receiver.
    ///
    /// When users tap the insertion (green plus) control or Delete button associated with a UITableViewCell object in the table view, the table view sends this message to the data source, asking it to commit the change. (If the user taps the deletion (red minus) control, the table view then displays the Delete button to get confirmation.) The data source commits the insertion or deletion by invoking the UITableView methods insertRows(at:with:) or deleteRows(at:with:), as appropriate.
    ///
    /// To enable the swipe-to-delete feature of table views (wherein a user swipes horizontally across a row to display a Delete button), you must implement this method.
    ///
    /// You should not call setEditing(\_:animated:) within an implementation of this method. If for some reason you must, invoke it after a delay by using the perform(\_:with:afterDelay:) method.
    ///
    /// - Parameter handler: (UITableView, UITableViewCellEditingStyle, IndexPath) -> Void
    /// - Returns: Self
    @discardableResult
    public func onCommitEditingStyleForRowAtIndexPath(_ handler: @escaping CommitEditingStyleForRowAtIndexPathHandler) -> Self {
        commitEditingStyleForRowAtIndexPathHandler = handler
        return self
    }
    
    /// Asks the data source to commit the insertion or deletion of a specified row in the receiver.
    ///
    /// When users tap the insertion (green plus) control or Delete button associated with a UITableViewCell object in the table view, the table view sends this message to the data source, asking it to commit the change. (If the user taps the deletion (red minus) control, the table view then displays the Delete button to get confirmation.) The data source commits the insertion or deletion by invoking the UITableView methods insertRows(at:with:) or deleteRows(at:with:), as appropriate.
    ///
    /// To enable the swipe-to-delete feature of table views (wherein a user swipes horizontally across a row to display a Delete button), you must implement this method.
    ///
    /// You should not call setEditing(\_:animated:) within an implementation of this method. If for some reason you must, invoke it after a delay by using the perform(\_:with:afterDelay:) method.
    ///
    /// - Parameter handler: (Context, UITableView, UITableViewCell.EditingStyle, IndexPath) -> Void
    /// - Returns: Self
    @discardableResult
    public func onCommitEditingStyleForRowAtIndexPath<Context: AnyObject>(strongify context: Context, _ handler: @escaping CommitEditingStyleForRowAtIndexPathHandlerWithContext<Context>) -> Self {
        commitEditingStyleForRowAtIndexPathHandler = strongify(weak: context, closure: handler)
        return self
    }
}

public typealias MoveRowAtIntexPathToNewIndexPathHandler = (UITableView, IndexPath, IndexPath) -> Void
public typealias MoveRowAtIntexPathToNewIndexPathHandlerWithContext<Context: AnyObject> = (Context, UITableView, IndexPath, IndexPath) -> Void
extension TableViewDataSource {
    /// Tells the data source to move a row at a specific location in the table view to another location.
    ///
    /// The UITableView object sends this message to the data source when the user presses the reorder control in fromRow.
    ///
    /// - Parameter handler: (UITableView, IndexPath, IndexPath) -> Void
    /// - Returns: Self
    @discardableResult
    public func onMoveRowAtIntexPathToNewIndexPath(_ handler: @escaping MoveRowAtIntexPathToNewIndexPathHandler) -> Self {
        moveRowAtIntexPathToNewIndexPathHandler = handler
        return self
    }
    
    /// Tells the data source to move a row at a specific location in the table view to another location.
    ///
    /// The UITableView object sends this message to the data source when the user presses the reorder control in fromRow.
    ///
    /// - Parameter handler: (Context, UITableView, IndexPath, IndexPath) -> Void
    /// - Returns: Self
    @discardableResult
    public func onMoveRowAtIntexPathToNewIndexPath<Context: AnyObject>(strongify context: Context, _ handler: @escaping MoveRowAtIntexPathToNewIndexPathHandlerWithContext<Context>) -> Self {
        moveRowAtIntexPathToNewIndexPathHandler = strongify(weak: context, closure: handler)
        return self
    }
}

// MARK: UITableViewDataSource
extension TableViewDataSource: UITableViewDataSource {
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRowsInSection = numberOfRowsInSectionHandler else { fatalError("numberOfRowsInSection is required handler!") }
        return numberOfRowsInSection(tableView, section) ?? 0
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellForRowAtIndexPath = cellForRowAtIndexPathHandler else { fatalError("cellForRowAtIndexPath is required handler!") }
        return cellForRowAtIndexPath(tableView, indexPath) ?? UITableViewCell()
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSectionsHandler?(tableView) ?? 1
    }
    
    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleForHeaderInSectionHandler?(tableView, section)
    }
    
    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return titleForFooterInSectionHandler?(tableView, section)
    }
    
    // MARK: - Editing
    open func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return canEditRowAtIndexPathHandler?(tableView, indexPath) ?? false
    }
    
    // MARK: - Moving/reordering
    open func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return canMoveRowAtIndexPathHandler?(tableView, indexPath) ?? false
    }
    
    // MARK: - Index
    open func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndexTitlesHandler?(tableView)
    }
    
    open func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return sectionForSectionIndexTitleHandler?(tableView, title, index) ?? 0
    }
    
    // MARK: - Data manipulation - Insert and delete support
    open func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        commitEditingStyleForRowAtIndexPathHandler?(tableView, editingStyle, indexPath)
    }
    
    // MARK: - Data manipulation - Reorder / moving support
    open func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveRowAtIntexPathToNewIndexPathHandler?(tableView, sourceIndexPath, destinationIndexPath)
    }
}
